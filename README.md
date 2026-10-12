# Identity & Access Management (IAM) Security Lab

## Project Overview

This project documents a hands-on Identity and Access Management (IAM) security lab designed to develop practical skills in identity administration, access governance, authentication security and automation.

Using Windows Server Active Directory, Microsoft Entra ID, Auth0 and PowerShell, I configured identity environments, developed automation scripts, reviewed security controls and documented remediation activities.

The project focuses on IAM principles including least privilege, role-based access control (RBAC), joiner-mover-leaver (JML) processes, multifactor authentication (MFA), Conditional Access and non-human identity governance.

## Technologies Used

- Windows Server Active Directory
- Microsoft Entra ID
- Auth0 (OpenID Connect federation)
- PowerShell
- Microsoft Entra Conditional Access
- Windows Server and Oracle VirtualBox

## IAM Lab Architecture

The lab consists of three identity management components:

**Active Directory:** On-premises identity administration, organisational units, security groups and service accounts.

**Microsoft Entra ID:** Cloud identity administration, MFA and Conditional Access policies.

**Auth0:** Federated authentication using Microsoft Entra ID as an identity provider through OpenID Connect (OIDC).

Active Directory and Microsoft Entra ID were configured as separate environments. Microsoft Entra Connect synchronisation was not implemented.

[View IAM Architecture Diagram](diagrams/)

## PowerShell Automation

Developed three PowerShell scripts to demonstrate IAM administration and automation:

| Script | Purpose |
|---|---|
| `onboard-user.ps1` | Supports Active Directory user provisioning and group assignment. |
| `offboard-user.ps1` | Supports account disabling and removal of group memberships. |
| `access-review.ps1` | Reviews administrative group membership and identifies potentially inactive accounts, exporting findings to CSV. |

[View PowerShell Scripts](scripts/)

## Microsoft Entra ID Conditional Access

Configured four custom Conditional Access policies:

| Policy | Purpose | Status |
|---|---|---|
| CA001 – Block Non-Compliant Devices | Require compliant devices to access organisational resources. | Report-only |
| CA002 – Require MFA – All Users | Strengthen authentication by requiring MFA. | On |
| CA003 – Restrict Admin Portal – Locations | Evaluate restrictions on administrator access from outside a designated lab network. | Report-only |
| CA004 – Require MFA – Risky Sign-ins | Require MFA for medium- and high-risk sign-ins. | On |

The policies demonstrate device compliance, MFA, location-based access restrictions and risk-based authentication.

Full enforcement testing has not been completed for every policy.

[View Conditional Access Configuration](conditional-access/)

## Access Review and Least Privilege

Conducted an Active Directory group membership review to identify excessive permissions.

Identified unnecessary `IT-Staff` and `HR-Staff` memberships for the lab account `sdunce`.

Removed the unnecessary memberships while retaining `Sales-Staff` and `Domain Users`.

Documented the findings and remediation using before-and-after screenshots.

[View Access Review Evidence](access-review/)

## Non-Human Identity Security Review

Reviewed Active Directory service accounts and a Microsoft Entra ID application registration.

**Active Directory:** Assessed `svc_backup` and `svc_monitoring`, identifying missing ownership information and areas requiring further investigation. The accounts were not deleted.

**Microsoft Entra ID:** Identified an application registration without an assigned owner and remediated the issue by assigning the lab administrator.

The assessment demonstrates service account governance, application ownership and identity lifecycle considerations.

[View Non-Human Identity Assessment](non-human-identity/)

## IAM Security Audit Report

Conducted a documented IAM security review covering Active Directory, Microsoft Entra ID and Auth0.

The assessment included password policy configuration, MFA and Conditional Access, privileged access, group memberships, service accounts and federated authentication.

The report documents findings, remediation completed and prioritised recommendations.

[View IAM Security Audit Report (PDF)](audit-report/IAM%20Security%20Audit%20Report.pdf)

## Practical IAM Exercises

Additional scenario-based exercises cover employee lifecycle management, Conditional Access testing, privilege escalation detection and orphaned service account response.

These exercises are planned for further hands-on validation and documentation.

## Cross-Platform Comparison

A comparison of Active Directory, Microsoft Entra ID and Okta is planned to examine user provisioning, group management, authentication controls and identity lifecycle capabilities.

Okta was not configured in this lab.

## Key Learning Outcomes

- Managing users, groups and permissions in Active Directory.
- Developing PowerShell scripts for IAM administrative processes.
- Configuring and reviewing Microsoft Entra Conditional Access policies.
- Understanding MFA, federation and identity security controls.
- Conducting access reviews and applying least-privilege principles.
- Assessing service accounts and application identities.
- Documenting security findings and remediation activities.

## Future Improvements

- Complete the five scenario-based IAM exercises.
- Validate Conditional Access policy behaviour using sign-in logs and controlled tests.
- Assess MFA registration and coverage across all lab users.
- Expand privileged access and stale account assessments.
- Implement Microsoft Entra Connect to explore hybrid identity synchronisation.
- Investigate Privileged Identity Management (PIM) and additional identity governance controls.

## Project Scope

This is a self-directed learning project conducted in a controlled lab environment. It demonstrates practical IAM configuration, investigation and documentation, rather than a fully validated production deployment.
