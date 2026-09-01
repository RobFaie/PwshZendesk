
function Search-User {
    [CmdletBinding()]
    param (
        # Zendesk Connection Context from `Get-ZendeskConnection`
        [Parameter(Mandatory = $false)]
        [PSTypeName('ZendeskContext')]
        [PSCustomObject]
        $Context = $null
    )

    throw [System.NotImplementedException]::new()

}
