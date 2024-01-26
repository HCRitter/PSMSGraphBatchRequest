# PSMSGraphBatchRequest
The <b>MSGraphBatchRequest</b> PowerShell module provides a convenient way to transform data into Microsoft Graph Batch Requests by converting PowerShell objects to JSON with proper schema validation.

## Features
- Batch Request Schema: Enforces adherence to a specified JSON schema for Microsoft Graph Batch Requests.
- Batch Size Control: Allows batching of requests based on a specified batch size.
- Schema Validation: Validates the transformed JSON against the predefined schema.

## Usage
```PowerShell
$Calls = @(
    [PSCustomObject]@{
        id = '1'
        method = "GET"
        url = 'users/me'
    },
    [PSCustomObject]@{
        id = '2'
        method = "GET"
        url = 'devices'
    }
)

ConvertTo-MSGraphBatchRequest -Requests $Calls
```
returns:
```json
{
  "requests": [
    {
      "id": "1",
      "method": "GET",
      "url": "/users/me"
    },
    {
      "id": "2",
      "method": "GET",
      "url": "/devices"
    }
  ]
}
```
