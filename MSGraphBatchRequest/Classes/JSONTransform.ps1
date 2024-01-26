# Define a PowerShell class named JSONTransform that inherits from System.Management.Automation.ArgumentTransformationAttribute
class JSONTransform : System.Management.Automation.ArgumentTransformationAttribute{
    [object] Transform([System.Management.Automation.EngineIntrinsics]$EngineIntrinsics,[object]$InputData){
        # Define a JSON schema for the batch graph request
        $batchGraphRequestSchema = @{
            'type' = 'object'
            'properties' = @{
                'requests' = @{
                    'type' = 'array'
                    'items' = @{
                        'type' = 'object'
                        'properties' = @{
                            'id' = @{
                                'type' = 'string'
                            }
                            'method' = @{
                                'type' = 'string'
                                'enum' = @('GET', 'PUT', 'PATCH', 'POST', 'DELETE')
                            }
                            'url' = @{
                                'type' = 'string'
                                'pattern' = '^\/[a-zA-Z0-9\/$&=?,]+$'
                            }
                            'headers' = @{
                                'type' = 'object'
                                # Additional properties for headers schema if needed
                            }
                            'body' = @{
                                'type' = 'object'
                                # Additional properties for body schema if needed
                            }
                        }
                        'required' = @('id', 'method', 'url')
                        'propertyNames' = @{
                            'enum' = @('id', 'method', 'url', 'headers', 'body')
                        }
                    }
                }
            }
            'required' = @('requests')
        }

        # Initialize a counter object to keep track of the number of items processed
        $counter = [pscustomobject] @{ Value = 0 }

        # Set the batch size to 20
        $BatchSize = 20

        # Group the input data into batches based on the batch size
        $Batches = $InputData | Group-Object -Property { [math]::Floor($counter.Value++ / $BatchSize) }

        # Process each batch and convert it to JSON
        $ReturnBatches = foreach($Batch in $Batches){
            $ReturnObject = @{
                requests = $Batch.Group
            } | ConvertTo-Json -Depth 6
    
            try {
                # Validate the JSON object against the batch graph request schema
                $Null = $ReturnObject | Test-Json -Schema $($batchGraphRequestSchema | Convertto-Json -Depth 6) -ErrorAction Stop
            }
            catch {
                # If the validation fails, write the invalid JSON object and throw an exception
                write-host $ReturnObject
                Throw "$($_.Exception.Message). JSON Schema did not match"
            }
            $ReturnObject
        }

        # Return the processed batches
        return $ReturnBatches
    }
}