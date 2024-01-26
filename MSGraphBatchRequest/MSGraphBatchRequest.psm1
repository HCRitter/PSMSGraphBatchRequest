# Dot source the class file(s)
. "$PSScriptRoot\Classes\JSONTrasform.ps1"

# Dot source the function file(s)
. "$PSScriptRoot\Functions\ConvertTo-MSGraphBatchRequest.ps1"

# Export the functions and classes from the module
Export-ModuleMember -Function * -Alias *