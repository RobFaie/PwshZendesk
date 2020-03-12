#
# Module manifest for module 'PwshZendesk'
#
# Generated by: Robert McLeod
#
# Generated on: 15/9/19
#
@{

    # Script module or binary module file associated with this manifest.
    RootModule = '.\PwshZendesk.psm1'

    # Version number of this module.
    ModuleVersion = '0.5.16'

    # Supported PSEditions
    CompatiblePSEditions = @(
        'Core'
        'Desktop'
    )

    # ID used to uniquely identify this module
    GUID = 'fd14fe05-21fb-4dfb-969b-7012632b461e'

    # Author of this module
    Author = 'Telstra Purple DevSecOps'

    # Company or vendor of this module
    CompanyName = 'Telstra Purple Pty Ltd'

    # Copyright statement for this module
    Copyright = '(c) 2019 Telstra Purple Pty Ltd. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'Wrapper for the Zendesk Rest API'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '5.0'

    # Name of the PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(
        'Add-Tag',                             'Add-ZendeskTag'
        'Add-User',                            'Add-ZendeskUser'
        'Connect-',                            'Connect-Zendesk'
        'Export-Organization',                 'Export-ZendeskOrganization'
        'Export-Sample',                       'Export-ZendeskSample'
        'Export-Ticket',                       'Export-ZendeskTicket'
        'Export-TicketEvent',                  'Export-ZendeskTicketEvent'
        'Export-User',                         'Export-ZendeskUser'
        'Get-Attachment',                      'Get-ZendeskAttachment'
        'Get-AuthenticatedUser',               'Get-ZendeskAuthenticatedUser'
        'Get-AutocompleteUser',                'Get-ZendeskAutocompleteUser'
        'Get-Comment',                         'Get-ZendeskComment'
        'Get-Connection',                      'Get-ZendeskConnection'
        'Get-DeletedTicket',                   'Get-ZendeskDeletedTicket'
        'Get-DeletedUser',                     'Get-ZendeskDeletedUser'
        'Get-Group',                           'Get-ZendeskGroup'
        'Get-GroupMembership',                 'Get-ZendeskGroupMembership'
        'Get-Incident',                        'Get-ZendeskIncident'
        'Get-JobStatus',                       'Get-ZendeskJobStatus'
        'Get-Organization',                    'Get-ZendeskOrganization'
        'Get-OrganizationMembership',          'Get-ZendeskOrganizationMembership'
        'Get-OrganizationRelated',             'Get-ZendeskOrganizationRelated'
        'Get-Problem',                         'Get-ZendeskProblem'
        'Get-SearchCount',                     'Get-ZendeskSearchCount'
        'Get-SuspendedTicket',                 'Get-ZendeskSuspendedTicket'
        'Get-Tag',                             'Get-ZendeskTag'
        'Get-Ticket',                          'Get-ZendeskTicket'
        'Get-TicketCollaborator',              'Get-ZendeskTicketCollaborator'
        'Get-TicketEmailCC',                   'Get-ZendeskTicketEmailCC'
        'Get-TicketFollower',                  'Get-ZendeskTicketFollower'
        'Get-TicketRelated',                   'Get-ZendeskTicketRelated'
        'Get-User',                            'Get-ZendeskUser'
        'Get-UserGDPRStatus',                  'Get-ZendeskUserGDPRStatus'
        'Get-UserIdentity',                    'Get-ZendeskUserIdentity'
        'Get-UserRelated',                     'Get-ZendeskUserRelated'
        'Hide-Comment',                        'Hide-ZendeskComment'
        'Import-Ticket',                       'Import-ZendeskTicket'
        'Invoke-CommentRedaction',             'Invoke-ZendeskCommentRedaction'
        'Invoke-Method',                       'Invoke-ZendeskMethod'
        'Merge-Ticket',                        'Merge-ZendeskTicket'
        'Merge-User',                          'Merge-ZendeskUser'
        'New-Attachment',                      'New-ZendeskAttachment'
        'New-Group',                           'New-ZendeskGroup'
        'New-GroupMembership',                 'New-ZendeskGroupMembership'
        'New-Organization',                    'New-ZendeskOrganization'
        'New-OrganizationMembership',          'New-ZendeskOrganizationMembership'
        'New-Ticket',                          'New-ZendeskTicket'
        'New-UserIdentity',                    'New-ZendeskUserIdentity'
        'Remove-Attachment',                   'Remove-ZendeskAttachment'
        'Remove-Group',                        'Remove-ZendeskGroup'
        'Remove-GroupMembership',              'Remove-ZendeskGroupMembership'
        'Remove-Organization',                 'Remove-ZendeskOrganization'
        'Remove-OrganizationMembership',       'Remove-ZendeskOrganizationMembership'
        'Remove-SuspendedTicket',              'Remove-ZendeskSuspendedTicket'
        'Remove-Tag',                          'Remove-ZendeskTag'
        'Remove-Ticket',                       'Remove-ZendeskTicket'
        'Remove-User',                         'Remove-ZendeskUser'
        'Remove-UserIdentity',                 'Remove-ZendeskUserIdentity'
        'Request-UserLicense',                 'Request-ZendeskUserLicense'
        'Restore-DeletedTicket',               'Restore-ZendeskDeletedTicket'
        'Restore-SuspendedTicket',             'Restore-ZendeskSuspendedTicket'
        'Search-',                             'Search-Zendesk'
        'Search-User',                         'Search-ZendeskUser'
        'Send-UserIdentityVerification',       'Send-ZendeskUserIdentityVerification'
        'Set-GroupMembershipAsDefault',        'Set-ZendeskGroupMembershipAsDefault'
        'Set-Organization',                    'Set-ZendeskOrganization'
        'Set-OrganizationMembershipAsDefault', 'Set-ZendeskOrganizationMembershipAsDefault'
        'Set-Tag',                             'Set-ZendeskTag'
        'Set-User',                            'Set-ZendeskUser'
        'Set-UserIdentityAsPrimary',           'Set-ZendeskUserIdentityAsPrimary'
        'Set-UserIdentityAsVerified',          'Set-ZendeskUserIdentityAsVerified'
        'Test-Connection',                     'Test-ZendeskConnection'
        'Update-Group',                        'Update-ZendeskGroup'
        'Update-Organization',                 'Update-ZendeskOrganization'
        'Update-Ticket',                       'Update-ZendeskTicket'
        'Update-User',                         'Update-ZendeskUser'
        'Update-UserIdentity',                 'Update-ZendeskUserIdentity'
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    # VariablesToExport = @()

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @(
                'PSEdition_Desktop'
                'PSEdition_Core'
                'Windows'
                'Linux'
                'MacOS'
            )

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/Readify/PwshZendesk'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

            # Prerelease string of this module
            # Prerelease = ''

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            # RequireLicenseAcceptance = $false

            # External dependent modules of this module
            # ExternalModuleDependencies = @()

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    DefaultCommandPrefix = 'Zendesk'

}

