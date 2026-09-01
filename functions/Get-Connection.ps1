
function Get-Connection {
    <#
    .SYNOPSIS
        Returns a Zendesk connection context
    .DESCRIPTION
        Returns an object describing a connection to a Zendesk instance
    .EXAMPLE
        PS C:\> $context = Get-ZendeskConnection -Organization 'company' -Username 'name@company.net' -ApiKey $ApiKey

        Sets $context to a connection context for the 'company' Zendesk instance as the user 'name@company.net'
    #>
    [OutputType([PSCustomObject])]
    [CMDletBinding()]
    Param (
        # Zendesk subdomain
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Organization,

        # Email address of user to log in
        [Parameter(Mandatory, ParameterSetName='ApiKey')]
        [ValidateNotNullOrEmpty()]
        [String]
        $Username,

        # Zendesk API token retrieved from https://<organization>.zendesk.com/agent/admin/api/settings
        [Parameter(Mandatory, ParameterSetName='ApiKey')]
        [Alias('ApiKey')]
        [ValidateNotNullOrEmpty()]
        [SecureString]
        $ApiToken,

        [Parameter(Mandatory, ParameterSetName='ClientCreds')]
        [ValidateNotNullOrEmpty()]
        [PSCredential]
        $ClientCredential
    )

    $context = [ordered]@{
        Organization   = $Organization
        BaseUrl        = "https://$Organization.zendesk.com"
        AuthType       = $null
        AccessToken    = $null
        TokenExpiresAt = [DateTime]::UTCNow
        User           = $null
    }

    switch ($PSCmdlet.ParameterSetName) {
        'ApiKey' {
            $context['AuthType'] = 'ApiKey'
            $context['ApiCredential'] = [System.Management.Automation.PSCredential]::New("$Username/token", $ApiToken)
        }
        'ClientCreds' {
            $context['AuthType'] = 'ClientCreds'
            $context['ClientCredential'] = $ClientCredential
        }
    }

    $context = [PSCustomObject]$context
    $context | Add-Member -TypeName 'ZendeskContext'
    $context

}
