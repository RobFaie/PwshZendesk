function Request-AccessToken {
    <#
    .SYNOPSIS
        Fetches a fresh OAuth access token.
    .EXAMPLE
        PS C:\> Request-AccessToken -Context $Context

        Fetches an oauth access token. The supplied Context is updated with the new token and expiration time.
    #>
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('AvoidUsingConvertToSecureStringWithPlainText', '')]
    Param (
        # Zendesk Connection Context from `Get-ZendeskConnection`
        [Parameter(Mandatory = $false)]
        [PSTypeName('ZendeskContext')]
        [PSCustomObject]
        $Context = $null
    )

    $when = [DateTime]::UtcNow

    $params = @{
        Method = 'Post'
        Uri    = $Context.BaseUrl + '/oauth/tokens'
        Body   = @{
            grant_type    = 'client_credentials'
            client_id     = $Context.ClientCredential.GetNetworkCredential().username
            client_secret = $Context.ClientCredential.GetNetworkCredential().password
            scope         = 'read write'
        }
    }
    $result = Invoke-RestMethod @params

    $Context.AccessToken = $result.access_token | ConvertTo-SecureString -AsPlainText -Force
    $Context.TokenExpiresAt = $when.AddSeconds($result.expires_in).AddMinutes(-5)
}
