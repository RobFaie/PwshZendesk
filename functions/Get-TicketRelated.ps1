
function Get-TicketRelated {

    [OutputType([PSCustomObject])]
    [CMDletBinding()]
    Param (

        # Unique Id of the ticket to get related information for
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $TicketId,

        # Zendesk Connection Context from `Get-ZendeskConnection`
        [Parameter(Mandatory = $false)]
        [PSTypeName('ZendeskContext')]
        [PSCustomObject]
        $Context = $null
    )

    $path = "/api/v2/tickets/$TicketId/related.json"

    $result = Invoke-Method -Context $Context -Path $path -Verbose:$VerbosePreference
    $result

}
