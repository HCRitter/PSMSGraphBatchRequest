@{
    ModuleVersion = '1.0.0'
    RootModule = 'MSGraphBatchRequest.psm1'
    Author = 'Christian Ritter'
    Description = 'This Module assists the creation of Batch Requests for Microsoft Graph by converting PSObjects to JSON with proper schema validation'
    FunctionsToExport = 'ConvertTo-MSGraphBatchRequest'
    CmdletsToExport = '*'
    VariablesToExport = '*'
    AliasesToExport = '*'
    ModuleList = @{}
    RequiredModules = @()
    PrivateData = @{
        PSData = @{
            ProjectUri = 'https://github.com/HCRitter/PSMSGraphBatchRequest'
            LicenseUri = 'https://github.com/HCRitter/PSMSGraphBatchRequest/blob/main/LICENSE'
        }
    }
}
