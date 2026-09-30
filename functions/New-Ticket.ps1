
function New-Ticket {
    <#
    .SYNOPSIS
        Creates a ticket.
    .DESCRIPTION
        Creates a ticket.
    .EXAMPLE
        PS C:\> New-ZendeskTicket -Comment @{ body = 'Access Request' }

        Creates a ticket with the only reqired parameter, comment.
    .EXAMPLE
        PS C:\> New-ZendeskTicket -Subject 'Access Request' -Comment @{ body = 'System Access Request' }

        Creates a ticket with a specific subject.
    .EXAMPLE
        PS C:\> New-ZendeskTicket -Comment @{ body = 'Access Request' }

        Creates a ticket with the only reqired parameter, comment using a connection context from `Get-ZendeskConnection`.
    #>
    [OutputType([PSCustomObject])]
    [CMDletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High', DefaultParameterSetName = 'Properties')]
    param (
        # Ticket Object to create
        [Parameter(Mandatory, ParameterSetName = 'Object')]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject]
        $Ticket,

        # The subject of the ticket
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateNotNullOrEmpty()]
        [String]
        $Subject,

        # The dynamic content placeholder
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateNotNullOrEmpty()]
        [String]
        $RawSubject,

        # An object that adds a comment to the ticket.
        [Parameter(Mandatory, ParameterSetName = 'Properties')]
        [PSCustomObject]
        $Comment,

        # The numeric ID of the user asking for support through the ticket
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $RequesterId,

        # The numeric ID of the user asking for support through the ticket
        [Parameter(ParameterSetName = 'Properties')]
        [PSCustomObject]
        $Requester,

        # The user who submitted the ticket.
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $SubmitterId,

        # The numeric ID of the agent to assign the ticket to
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $AssigneeId,

        # The email address of the agent to assign the ticket to
        [Parameter(ParameterSetName = 'Properties')]
        [ValidatePattern('@')]
        [String]
        $AssigneeEmail,

        # The original recipient e-mail address of the ticket
        [Parameter(ParameterSetName = 'Properties')]
        [ValidatePattern('@')]
        [String]
        $RecipientEmail,

        # The numeric ID of the group to assign the ticket to
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $GroupId,

        # The numeric ID of the organization to assign the ticket to.
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $OrganizationId,

        # An array of the numeric IDs of agents or end-users to CC.
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $CollaboratorId,

        # An array of numeric IDs, emails, or objects containing name and email properties.
        [Parameter(ParameterSetName = 'Properties')]
        [Object[]]
        $Collaborator,

        # An array of objects that represent agent followers to add or delete from the ticket.
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64[]]
        $FollowerId,

        # An array of objects that represent agent or end users email CCs to add or delete from the ticket.
        [Parameter(ParameterSetName = 'Properties')]
        [Object[]]
        $EmailCc,

        # Allowed values are problem, incident, question, or task
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateSet('problem', 'incident', 'question', 'task')]
        [String]
        $Type,

        # Allowed values are urgent, high, normal, or low
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateSet('urgent', 'high', 'normal', 'low')]
        [String]
        $Priority,

        # Allowed values are open, pending, hold, solved or closed
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateSet('new', 'open', 'pending', 'hold', 'solved', 'closed')]
        [String]
        $Status,

        # An array of tags to add to the ticket.
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Tags,

        # An ID to link tickets to local records
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateNotNullOrEmpty()]
        [String]
        $ExternalId,

        # The topic this ticket originated from, if any
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $ForumTopicId,

        # The id of a closed ticket when creating a follow-up ticket.
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $FollowupId,

        # The id of the ticket form to render for the ticket
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $FormId,

        # The id of the brand this ticket is associated with
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $BrandId,

        # For tickets of type "incident", the numeric ID of the problem the incident is linked to, if any
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64]
        $ProblemId,

        # For tickets of type "task", the due date of the task.
        [Parameter(ParameterSetName = 'Properties')]
        [DateTime]
        $DueAt,

        # An array of the custom field objects consisting of ids and values.
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject[]]
        $CustomFields,

        # An array of macro IDs to be recorded in the ticket audit
        [Parameter(ParameterSetName = 'Properties')]
        [ValidateRange(1, [Int64]::MaxValue)]
        [Int64[]]
        $MacroId,

        # Zendesk Connection Context from `Get-ZendeskConnection`
        [Parameter()]
        [PSTypeName('ZendeskContext')]
        [PSCustomObject]
        $Context = $null
    )

    $path = "/api/v2/tickets.json"

    if ($PSCmdlet.ParameterSetName -eq 'Properties') {
        $body = @{
            ticket = @{ }
        }

        $map = @{
            external_id            = 'ExternalId'
            type                   = 'Type'
            subject                = 'Subject'
            raw_subject            = 'RawSubject'
            comment                = 'Comment'
            priority               = 'Priority'
            status                 = 'Status'
            recipient              = 'RecipientEmail'
            requester_id           = 'RequesterId'
            requester              = 'Requester'
            submitter_id           = 'SubmitterId'
            assignee_id            = 'AssigneeId'
            assignee               = 'AssigneeEmail'
            organization_id        = 'OrganizationId'
            collaborator_ids       = 'CollaboratorId'
            collaborators          = 'Collaborator'
            email_cc_ids           = 'EmailCc'
            follower_ids           = 'FollowerId'
            forum_topic_id         = 'ForumTopicId'
            problem_id             = 'ProblemId'
            tags                   = 'Tags'
            custom_fields          = 'CustomFields'
            via_followup_source_id = 'FollowupId'
            macro_ids              = 'MacroId'
            ticket_form_id         = 'FormId'
            brand_id               = 'BrandId'
            group_id               = 'GroupId'
        }

        foreach ($item in $map.GetEnumerator()) {
            $property = $item.key
            $parameter = $item.value
            if ($PSBoundParameters.ContainsKey($parameter)) {
                $body.ticket[$property] = $PSBoundParameters.$parameter
            }
        }

        if ($PSBoundParameters.ContainsKey('DueAt')) {
            $body.ticket['due_at'] = $DueAt.ToString('yyyy-MM-dd')
        }

    } else {

        $body = @{
            ticket = $Ticket
        }

    }

    if ($PSCmdlet.ShouldProcess($Subject, "Create Zendesk Ticket")) {
        $result = Invoke-Method -Context $Context -Method 'Post' -Path $path -Body $body -Verbose:$VerbosePreference
        $result
    }

}
