# PwshZendesk

[![Main Badge Image]][Main Badge Link] [![Check Suite Badge]][Main Badge Link]</br>
[![Release Badge]][releases] [![PSGallery Badge]][PowerShell Gallery]

PwshZendesk is a Zendesk Support API client for Powershell.
PwshZendesk supports Powershell versions 5.1, 6, and 7 on all platforms.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Installing

PwshZendesk supports Powershell versions 5.1, and 7 on all platforms.

It is recommended to install PwshZendesk from the [PowerShell Gallery]:

```Powershell
Install-PSResource -Name PwshZendesk
```

PwshZendesk is also ready to go after a git clone or by downloading and extracting one of the [releases].

Microsoft has some official documentation on [installing] and [importing] Powershell modules.

### Authentication

#### Api Token

API Tokens are in the process of being phased out by Zendesk.
Active API tokens will stop working on April 30, 2027.

If API Token creation has not yet been turned off for your Zendesk tenant,
you can generate one from the Admin Center > Apps and integrations > API tokens.
API access with API Tokens must also be enabled in the API Configuration.

#### Client Credentials

The Client Credentials auth flow uses a confidential oauth client in your Zendesk instance to authenticate.
To create one, navigate to the Admin Center > Apps and integrations > OAuth clients.
When creating your oauth client, be sure to select the confidential client type.
No redirect urls are required.
Specifying scopes is also not required,
but it is recommended that you limit the access your oauth client where possible.

The oauth client will authenticate as the user that creates it,
so it is important that the user creating the oauth client also has the required permissions.

#### Authorization Flow

WIP

### Quickstart

The most basic operation you can perform with PwshZendesk is to retrieve the user object for the authenticated user.

```Powershell
# Read the Api Token. I must be a [SecureString]
$token = Read-Host -Prompt 'Zendesk Api Token' -AsSecureString

# Establish a connection to the Zendesk instance
Connect-Zendesk -Organization 'organization' -Username 'name@company.net' -ApiKey $token

# Get the user record for the user we just connected as.
Get-ZendeskAuthenticatedUser
```

## Running the tests

PwshZendesk uses Style and Best Practice testing provided by [PSScriptAnalyzer] and Unit testing via the [Pester] framework

### Style and Best Practice Testing

Ensure you have [PSScriptAnalyzer] installed:

```Powershell
Install-PSResource -Name 'PSScriptAnalyzer' -Version '1.25.0'
```

And just run it over the `functions`, `internal`, and `tests` directories. The `PSScriptAnalyzerSettings.psd1` will get picked up and run all configured tests.
I don't like the look of aligned assignments in the module manifest due to the large amounts of whitespace and comments, so it is excluded.

```Powershell
Get-ChildItem -Directory | Invoke-ScriptAnalyzer | Format-Table -AutoSize
```

### Unit tests

Ensure you have [Pester] installed:

```Powershell
Install-PSResource -Name 'Pester' -Version '4.10.1'
```

And just run it from the project root in a non-interactive session.
A non-interactive session is required so that tests ensuring certain parameters are required or parameter sets do not prompt the user for input.
Tests that require a non-interactive session that are run interactively will automatically fail.

```Powershell
pwsh -NonInteractive -Command 'Invoke-Pester'
```

If you wish to skip tests that require an internet connection then you can run the following. The tests for the `Invoke-Method` function make use of calls to [codes.httpauth.dev] to test behavior when hitting api limits, and other http status code scenarios.

```Powershell
pwsh -NonInteractive -Command 'Invoke-Pester -ExcludeTag internet'
```

## Built With

- [PSScriptAnalyzer] - Code Style and Best Practice testing
- [Pester] - Testing framework
- [codes.httpauth.dev] - Used to test getting different HTTP status codes back from the API
- [GitVersion] - Used to calculate version.

## Contributing

Please read [CONTRIBUTING.md] for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer] for versioning.
For the versions available, see the [tags on this repository].

We use [GitVersion] to calculate the version.

## Authors

- **Robert McLeod** - *Initial work* - [RobFaie](https://github.com/RobFaie)

See also the list of [contributors] who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

- **Billie Thompson** - *README.md template* - [PurpleBooth](https://github.com/PurpleBooth)


[tags on this repository]: https://github.com/RobFaie/PwshZendesk/tags
[CONTRIBUTING.md]: https://gist.github.com/PurpleBooth/b24679402957c63ec426
[contributors]: https://github.com/RobFaie/PwshZendesk/contributors

[PowerShell Gallery]: https://www.powershellgallery.com/packages/PwshZendesk
[PSScriptAnalyzer]: https://github.com/PowerShell/PSScriptAnalyzer
[Pester]: https://github.com/pester/Pester
[GitVersion]: https://github.com/GitTools/GitVersion
[codes.httpauth.dev]: https://codes.httpauth.dev
[SemVer]: http://semver.org/

[releases]: https://github.com/RobFaie/PwshZendesk/releases

[Main Badge Link]: https://github.com/RobFaie/PwshZendesk/actions/workflows/main.yml
[Main Badge Image]: https://github.com/RobFaie/PwshZendesk/actions/workflows/main.yml/badge.svg

[PSGallery Badge]: https://img.shields.io/powershellgallery/v/PwshZendesk
[Release Badge]: https://img.shields.io/github/v/release/RobFaie/PwshZendesk
[Check suite Badge]: https://img.shields.io/github/check-suites/RobFaie/PwshZendesk/main

[importing]:https://learn.microsoft.com/en-us/powershell/scripting/developer/module/importing-a-powershell-module?view=powershell-7.6
[installing]: https://learn.microsoft.com/en-us/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.6
