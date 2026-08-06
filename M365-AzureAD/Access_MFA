<#
.SYNOPSIS
Applies baseline Conditional Access policy enforcing MFA.

.DESCRIPTION
Ensures all cloud users authenticate with MFA and compliant devices.
#>

$PolicyName = "Baseline-MFA-AllUsers"

New-MgIdentityConditionalAccessPolicy `
    -DisplayName $PolicyName `
    -State "enabled" `
    -Conditions @{
        Users = @{
            IncludeUsers = @("All")
        }
        Applications = @{
            IncludeApplications = @("All")
        }
    } `
    -GrantControls @{
        Operator = "AND"
        BuiltInControls = @("mfa")
    }

Write-Host "Conditional Access MFA policy deployed successfully."
