# Identity & Access Management (IAM) Security Lab

## Project Overview

This project documents a hands-on Identity and Access Management (IAM) lab focused on building practical experience with user administration, access management, authentication security and PowerShell automation.

The lab was built using Windows Server Active Directory, Microsoft Entra ID and Auth0. It covers everyday IAM tasks such as creating users, managing security groups, onboarding and offboarding accounts, configuring Conditional Access policies and investigating access-related security events.

Five practical exercises were also completed to test different IAM scenarios, including employee lifecycle management, MFA policy testing, unexpected group membership changes and service account reviews.

The project is based around key IAM concepts such as least privilege, role-based access control (RBAC), joiner-mover-leaver (JML) processes, multifactor authentication (MFA) and identity governance.

## Technologies Used

- Windows Server Active Directory
- Microsoft Entra ID
- Auth0
- PowerShell
- Microsoft Entra Conditional Access
- Windows Security Event Logs
- Oracle VirtualBox

## IAM Lab Architecture

The lab uses three main identity platforms:

**Active Directory:** Used for on-premises user administration, organisational units, security groups, service accounts and PowerShell automation.

**Microsoft Entra ID:** Used for cloud user management, group assignments, MFA and Conditional Access policies.

**Auth0:** Used to test application authentication through Microsoft Entra ID using OpenID Connect (OIDC).

Active Directory and Entra ID were configured separately. Directory synchronisation between the two environments was not implemented.

[View IAM Architecture Diagram](diagrams/)

## PowerShell Automation

Three PowerShell scripts were developed to support common IAM administration tasks.

| Script | Purpose |
|---|---|
| `onboard-user.ps1` | Creates Active Directory user accounts and assigns group membership. |
| `offboard-user.ps1` | Disables user accounts and removes unnecessary group memberships. |
| `access-review.ps1` | Reviews administrative group membership and potentially inactive accounts, with findings exported to CSV. |

The scripts were used during the lab exercises to test user provisioning, offboarding and access reviews.

Some limitations were identified during testing, particularly around error handling in the onboarding script. These have been documented as areas for improvement.

[View PowerShell Scripts](scripts/)

## Microsoft Entra ID Conditional Access

Four Conditional Access policies were configured to explore different access security controls.

| Policy | Purpose | Status |
|---|---|---|
| CA001 – Block Non-Compliant Devices | Require compliant devices when accessing organisational resources. | Report-only |
| CA002 – Require MFA – All Users | Require MFA during authentication. | On |
| CA003 – Restrict Admin Portal – Locations | Evaluate restrictions on administrator access from outside a designated lab network. | Report-only |
| CA004 – Require MFA – Risky Sign-ins | Require MFA for medium- and high-risk sign-ins. | On |

CA002 was tested using a dedicated test account.

The first test showed that the policy wasn't being applied. After reviewing the configuration, an exclusion affecting the test account was identified and removed.

A second test confirmed that CA002 was successfully applied in the Entra ID sign-in logs.

The other policies were configured and documented, although full enforcement testing was not completed for every scenario.

[View Conditional Access Configuration](conditional-access/)

## Access Review and Least Privilege

An Active Directory access review was carried out to check security group memberships and identify unnecessary access.

During the review, the lab account `sdunce` was found to have additional memberships in `IT-Staff` and `HR-Staff`.

These memberships were removed, while the required `Sales-Staff` and `Domain Users` memberships were retained.

A separate PowerShell access review also identified `jboom` as a member of the custom `Admin-Access` group. This was recorded for further review rather than treated as a confirmed security issue.

The findings and changes were documented with screenshots and PowerShell output.

[View Access Review Evidence](access-review/)

## Non-Human Identity Security Review

The lab also included a review of service accounts and application identities.

**Active Directory**

Two service accounts, `svc_backup` and `svc_monitoring`, were reviewed.

Both accounts were disabled and had no recorded owner in the `ManagedBy` attribute. Further investigation would be needed to confirm whether the accounts were still required or had any service dependencies.

No accounts were deleted during the review.

**Microsoft Entra ID**

An application registration was identified without an assigned owner.

The issue was addressed by assigning the lab administrator as the application owner.

This part of the project highlighted the importance of keeping track of non-human identities, their ownership and whether they are still needed.

[View Non-Human Identity Assessment](non-human-identity/)

## Practical IAM Exercises

Five exercises were completed to apply the IAM concepts covered throughout the lab.

### Exercise 1 – Employee Lifecycle Simulation

A joiner-mover-leaver scenario was carried out using a fictional employee account.

The exercise covered:

- Creating a new user in the Finance department.
- Assigning the appropriate security group.
- Transferring the user from Finance to Sales.
- Updating group memberships and organisational unit placement.
- Disabling the account and removing access during offboarding.

PowerShell scripts were used for parts of the process, with screenshots taken to verify the changes.

[View Exercise 1](exercises/exercise1/)

### Exercise 2 – Conditional Access Testing

The CA002 MFA policy was tested using a Microsoft Entra ID test account.

The initial sign-in showed that CA002 wasn't applied because the account was excluded from the policy.

After correcting the exclusion and testing again, the sign-in logs confirmed that the policy was successfully applied.

This exercise provided useful experience with troubleshooting Conditional Access and checking authentication results rather than relying only on the policy configuration.

[View Exercise 2](exercises/exercise2/)

### Exercise 3 – Privilege Escalation Detection

A controlled scenario was used to simulate an unexpected change to an Active Directory security group.

The test account `dcarter` was added to the custom `Admin-Access` group.

Windows Security Event Logs were then reviewed using PowerShell, where Event ID 4728 recorded the membership change.

The additional membership was removed, and a final check confirmed that the group had returned to its original membership.

The exercise covered security event investigation, group membership auditing and access remediation.

The effective permissions of the custom group were not tested, so the scenario does not establish that Domain Admin privileges were granted.

[View Exercise 3](exercises/exercise3/)

### Exercise 4 – Orphaned Service Account Response

This exercise built on the earlier non-human identity assessment.

The two service accounts, `svc_backup` and `svc_monitoring`, were reviewed for account status, ownership information and potential security concerns.

Both accounts were disabled and had incomplete ownership information.

The exercise documented the risks associated with poorly managed service accounts and the steps that should be taken before removing an account, including checking ownership, business requirements and service dependencies.

The accounts were treated as potentially orphaned rather than confirmed orphaned, as their dependencies had not been fully investigated.

[View Exercise 4](exercises/exercise4/)

### Exercise 5 – Cross-Platform IAM Comparison

A comparison was completed covering Active Directory, Microsoft Entra ID, Auth0 and Okta.

The comparison focused on:

- User and group management.
- Authentication and MFA.
- SSO and federation.
- Access control and security policies.
- Identity lifecycle management.

Active Directory, Entra ID and Auth0 were used during practical lab activities.

Okta was researched but not configured, as registration requirements prevented the practical setup from being completed.

[View Exercise 5](exercises/exercise5/)

## IAM Security Audit Report

A security audit report was produced to bring together the findings from the Active Directory, Microsoft Entra ID and Auth0 environments.

The report covers areas such as:

- Password policies and authentication security.
- MFA and Conditional Access.
- Privileged access and group memberships.
- Service accounts and application identities.
- Federated authentication.
- Security findings and recommended improvements.

The report includes observations from the lab, remediation activities and recommendations for further improvements.

[View IAM Security Audit Report (PDF)](audit-report/IAM%20Security%20Audit%20Report.pdf)

## Key Learning Outcomes

The project provided practical experience across several IAM areas:

- Managing Active Directory users, groups and organisational units.
- Using PowerShell for onboarding, offboarding and access reviews.
- Configuring and troubleshooting Microsoft Entra Conditional Access.
- Reviewing sign-in logs and Windows Security events.
- Testing MFA and OIDC-based authentication.
- Investigating unexpected security group membership changes.
- Applying least-privilege principles during access reviews.
- Assessing service accounts and application ownership.
- Documenting technical findings, troubleshooting and remediation.

One of the main takeaways from the lab was the importance of verifying changes. Whether it's removing group membership or testing an MFA policy, checking the results is just as important as making the configuration change.

## Future Improvements

Although the five exercises are complete, there are several areas that could be developed further:

- Improve error handling and validation in the PowerShell scripts.
- Test additional Conditional Access scenarios, including device compliance and location restrictions.
- Explore automated user provisioning and deprovisioning.
- Implement Microsoft Entra Connect to learn more about hybrid identity synchronisation.
- Gain hands-on experience with Okta.
- Explore Privileged Identity Management (PIM) and identity governance features.
- Expand service account dependency checks and access review automation.

## Project Scope

This is a self-directed IAM learning project completed in a controlled lab environment.

The configurations and exercises were designed to develop practical experience with identity administration, access security and troubleshooting.

Some features were configured without full enforcement testing, and the lab does not represent a production IAM deployment.
