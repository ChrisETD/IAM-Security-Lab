
# Identity & Access Management (IAM) Security Lab

## Project Overview

This project documents a hands-on Identity and Access Management (IAM) lab developed to gain practical experience with identity administration, access security, authentication, hybrid identity management and PowerShell automation.

The environment integrates Windows Server Active Directory with Microsoft Entra ID using Microsoft Entra Connect Sync. Auth0 was also configured to test federated authentication through OpenID Connect (OIDC).

The lab covers user lifecycle management, security group administration, Conditional Access, multifactor authentication (MFA), access reviews, identity synchronisation and security auditing.

Five practical IAM exercises were completed to investigate common identity security scenarios, including employee onboarding and offboarding, Conditional Access troubleshooting, unexpected group membership changes and service account management.

The project focuses on applying least privilege, role-based access control (RBAC), joiner-mover-leaver (JML) processes and identity governance principles within a controlled environment.

## Technologies Used

- Windows Server 2022
- Active Directory Domain Services (AD DS)
- Microsoft Entra ID
- Microsoft Entra Connect Sync
- Microsoft Entra Conditional Access
- Auth0
- OpenID Connect (OIDC)
- PowerShell
- Windows Security Event Logs
- Oracle VirtualBox

## IAM Lab Architecture

The lab consists of three identity platforms, with hybrid identity synchronisation configured between Active Directory and Microsoft Entra ID.

**Active Directory:** Provides on-premises identity management, including users, organisational units, security groups, service accounts and PowerShell-based administration.

**Microsoft Entra ID:** Provides cloud identity management, Conditional Access, MFA, authentication monitoring and application registrations.

**Microsoft Entra Connect Sync:** Synchronises selected on-premises identities to Microsoft Entra ID using Password Hash Synchronisation (PHS).

**Auth0:** Provides an application authentication environment integrated with Microsoft Entra ID through OpenID Connect.

The on-premises environment uses the `iamlab.local` domain, with Microsoft Entra Connect Sync deployed on a dedicated domain-joined Windows Server.

[View IAM Architecture Diagram](diagrams/)

## Hybrid Identity Synchronisation

Hybrid identity synchronisation was implemented using Microsoft Entra Connect Sync to establish integration between on-premises Active Directory and Microsoft Entra ID.

The configuration included:

- Deploying a dedicated Windows Server 2022 synchronisation server.
- Joining the server to the Active Directory domain.
- Installing and configuring Microsoft Entra Connect Sync.
- Configuring Password Hash Synchronisation.
- Applying organisational unit filtering for Finance, HR, IT and Sales.
- Configuring a test account with a Microsoft Entra-compatible User Principal Name (UPN).
- Validating directory imports and synchronisation operations.
- Troubleshooting staging mode and enabling synchronisation exports.

A dedicated test account, `hybridtest`, was created in Active Directory and successfully synchronised to Microsoft Entra ID.

Synchronisation Service Manager confirmed successful Full Import and Full Synchronisation operations, with 11 user objects identified in the metaverse.

The synchronised account was subsequently verified in Microsoft Entra ID using its on-premises attributes, including the source domain, distinguished name, SAM account name and synchronisation status.

This exercise provided practical experience with hybrid identity infrastructure, directory integration, identity attribute management and synchronisation troubleshooting.

[View Hybrid Identity Synchronisation Project](hybrid-identity-sync/)

## PowerShell Automation

Three PowerShell scripts were developed to support common IAM administration activities.

| Script | Purpose |
|---|---|
| `onboard-user.ps1` | Creates Active Directory accounts and assigns security group memberships. |
| `offboard-user.ps1` | Disables user accounts and removes unnecessary group memberships. |
| `access-review.ps1` | Reviews administrative group memberships and potentially inactive accounts, exporting findings to CSV. |

The scripts were used during practical exercises to support user provisioning, offboarding and access reviews.

Areas for further improvement include additional input validation, error handling and automation of more complex lifecycle processes.

[View PowerShell Scripts](scripts/)

## Microsoft Entra ID Conditional Access

Four Conditional Access policies were configured to assess different identity and access security controls.

| Policy | Purpose | Status |
|---|---|---|
| CA001 – Block Non-Compliant Devices | Evaluate device compliance requirements when accessing organisational resources. | Report-only |
| CA002 – Require MFA – All Users | Require multifactor authentication during sign-in. | On |
| CA003 – Restrict Admin Portal – Locations | Evaluate location-based restrictions for administrative access. | Report-only |
| CA004 – Require MFA – Risky Sign-ins | Require MFA for medium- and high-risk sign-ins. | On |

### Conditional Access Testing

CA002 was tested using a dedicated Microsoft Entra ID account.

During the initial test, the policy was not applied because the test account was excluded from its assignments.

After reviewing the configuration and correcting the exclusion, a second authentication test confirmed that CA002 was successfully applied in the Microsoft Entra sign-in logs.

The remaining policies were configured and documented, although comprehensive enforcement testing was not completed across every scenario.

This exercise demonstrated the importance of validating Conditional Access policies through authentication results and sign-in logs rather than relying solely on their configuration status.

[View Conditional Access Configuration](conditional-access/)

## Authentication and Federation

Microsoft Entra ID was integrated with Auth0 using OpenID Connect to test federated application authentication.

The configuration involved establishing an application registration, configuring the identity provider connection and testing authentication with a Microsoft Entra ID account.

During testing, the account was prompted to register MFA before completing the authentication process.

Following MFA registration, the account successfully authenticated through the federated sign-in flow.

This demonstrated how Microsoft Entra ID can act as an identity provider for an external application and how MFA forms part of the authentication process.

The testing confirmed successful authentication for the selected account but did not establish full enforcement or coverage across all users.

## Access Review and Least Privilege

An Active Directory access review was conducted to identify unnecessary group memberships and assess whether assigned access remained appropriate.

The test account `sdunce` was identified as having additional memberships in the `IT-Staff` and `HR-Staff` groups.

These memberships were removed, while the required `Sales-Staff` and `Domain Users` memberships were retained.

A follow-up check confirmed that the unnecessary memberships had been successfully removed.

A separate review also identified `jboom` as a member of the custom `Admin-Access` group. This was documented for further investigation, as the group's effective permissions had not been fully assessed.

The exercise demonstrated how access reviews support least privilege and help identify permissions that may no longer be required.

[View Access Review Evidence](access-review/)

## Non-Human Identity Security Review

The lab included a security review of Active Directory service accounts and Microsoft Entra application identities.

### Active Directory Service Accounts

Two service accounts, `svc_backup` and `svc_monitoring`, were reviewed.

Both accounts were disabled and had no recorded owner in the `ManagedBy` attribute.

The accounts were not deleted because their dependencies and operational requirements had not been fully investigated.

The review highlighted the importance of documenting account ownership, purpose and service dependencies before making changes to non-human identities.

### Microsoft Entra Application Registration

An application registration associated with the Auth0 federation configuration was reviewed.

The registration initially had no assigned owner. This was addressed by assigning the lab administrator as its owner.

Additional considerations included reviewing application permissions and monitoring client secret expiry.

[View Non-Human Identity Assessment](non-human-identity/)

## Practical IAM Exercises

Five practical exercises were completed to apply IAM concepts and investigate common identity administration and security scenarios.

### Exercise 1 – Employee Lifecycle Simulation

A joiner-mover-leaver scenario was completed using a fictional employee account.

The exercise involved:

- Creating an Active Directory account in the Finance department.
- Assigning the appropriate security group.
- Transferring the account from Finance to Sales.
- Updating organisational unit placement and group memberships.
- Disabling the account and removing access during offboarding.

PowerShell was used to support parts of the lifecycle process, with verification carried out after the changes.

[View Exercise 1](exercises/exercise1/)

### Exercise 2 – Conditional Access Testing

The CA002 MFA policy was tested using a Microsoft Entra ID account.

An initial authentication attempt showed that the policy was not being applied due to an account exclusion.

After correcting the configuration, the sign-in logs confirmed successful policy application.

This exercise focused on troubleshooting Conditional Access assignments and validating authentication outcomes.

[View Exercise 2](exercises/exercise2/)

### Exercise 3 – Privilege Escalation Detection

A controlled security scenario was used to investigate an unexpected Active Directory group membership change.

The test account `dcarter` was added to the custom `Admin-Access` security group.

Windows Security Event Logs were reviewed using PowerShell, with Event ID 4728 recording the membership change.

The additional membership was subsequently removed and the group membership was verified.

The exercise demonstrated security event investigation, group membership auditing and access remediation.

The effective permissions of the custom group were not tested, so the exercise does not establish that Domain Admin privileges were granted.

[View Exercise 3](exercises/exercise3/)

### Exercise 4 – Orphaned Service Account Response

Two Active Directory service accounts were reviewed to assess their status, ownership and potential security concerns.

Both accounts were disabled and had incomplete ownership information.

The exercise documented the checks required before decommissioning a service account, including verifying ownership, operational dependencies and business requirements.

The accounts were considered potentially orphaned rather than confirmed orphaned.

[View Exercise 4](exercises/exercise4/)

### Exercise 5 – Cross-Platform IAM Comparison

A comparison was completed covering Active Directory, Microsoft Entra ID, Auth0 and Okta.

The assessment focused on:

- User and group administration.
- Authentication and MFA.
- Single sign-on and federation.
- Access control and security policies.
- Identity lifecycle management.

Active Directory, Microsoft Entra ID and Auth0 were used in practical lab activities.

Okta was included in the research-based comparison but was not configured because of account registration requirements.

[View Exercise 5](exercises/exercise5/)

## IAM Security Audit Report

A security audit was conducted across the IAM lab to assess identity configurations, access controls and potential security weaknesses.

The assessment covered:

- Active Directory password and account lockout policies.
- Microsoft Entra Conditional Access and MFA.
- Privileged access and security group memberships.
- Service account ownership and application registrations.
- Federated authentication through Auth0.
- Hybrid identity synchronisation.
- Security findings, remediation and outstanding recommendations.

### Key Findings and Remediation

The Active Directory password policy was reviewed and strengthened by increasing the minimum password length from 7 to 14 characters and configuring an account lockout threshold of 10 failed attempts.

Unnecessary departmental group memberships were identified and removed following an access review.

An application registration without an assigned owner was also identified and remediated.

Other areas, including privileged access, MFA coverage across all users and service account dependencies, were documented for further investigation.

The report distinguishes verified remediation from findings requiring additional assessment.

[View IAM Security Audit Report](audit-report/)

## Key Learning Outcomes

The project provided practical experience across several areas of identity and access management:

- Administering Active Directory users, groups and organisational units.
- Implementing hybrid identity synchronisation with Microsoft Entra Connect Sync.
- Configuring OU filtering and Password Hash Synchronisation.
- Troubleshooting directory synchronisation and staging mode.
- Developing PowerShell scripts for identity lifecycle administration.
- Configuring and troubleshooting Conditional Access policies.
- Reviewing Microsoft Entra sign-in logs and Windows Security Events.
- Testing MFA registration and federated authentication.
- Investigating unexpected security group membership changes.
- Applying least-privilege principles during access reviews.
- Reviewing service accounts and application ownership.
- Documenting security findings, remediation and technical evidence.

A key takeaway from the project was the importance of validating identity and access changes.

Whether configuring synchronisation, reviewing group memberships or testing authentication policies, confirming the outcome is essential to ensuring that the intended controls are operating correctly.

## Further Development

Potential areas for further development include:

- Improving PowerShell error handling and input validation.
- Testing additional Conditional Access scenarios involving device compliance and location restrictions.
- Expanding automated identity provisioning and deprovisioning.
- Testing hybrid identity lifecycle changes between Active Directory and Microsoft Entra ID.
- Exploring Microsoft Entra Privileged Identity Management (PIM) and identity governance capabilities.
- Developing more comprehensive service account ownership and dependency reviews.
- Expanding access review automation and privileged access assessments.
- Gaining practical experience with Okta.

## Project Scope

This is a self-directed IAM project completed within a controlled lab environment.

The configurations, exercises and security assessments were designed to develop practical experience with identity administration, access security, hybrid identity management and troubleshooting.

Although several configurations and remediation activities were successfully tested and verified, some security controls require further validation.

The environment is intended for learning and portfolio demonstration purposes and does not represent a production IAM deployment.
