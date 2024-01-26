<#
.SYNOPSIS
Converts a JSON object into a Microsoft Graph batch request.

.DESCRIPTION
The ConvertTo-MSGraphBatchRequest function takes a JSON object representing a batch request and converts it into a format that can be used with Microsoft Graph batch requests.

.PARAMETER Requests
The JSON object representing the batch request.

.EXAMPLE
$Calls = @(
    [PSCustomObject]@{
        id = '1'
        method = "GET"
        url = '/users/me'
    },
    [PSCustomObject]@{
        id = '2'
        method = "GET"
        url = '/devices'
    }
)

ConvertTo-MSGraphBatchRequest -Requests $Calls

.OUTPUTS
The converted Microsoft Graph batch request.

#>
function ConvertTo-MSGraphBatchRequest {
    [CmdletBinding()]
    param (
        [jsontransform()]$Requests
    )
    
    begin {

    }
    
    process {
        
    }
    
    end {
        return $Requests
    }
}

