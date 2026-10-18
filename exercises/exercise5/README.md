# Exercise 5 – Cross-Platform IAM Comparison
 
## Overview

This exercise compares Active Directory, Microsoft Entra ID, Auth0 and Okta, focusing on how each platform handles identity management, authentication and access control.

The lab involved practical testing with Active Directory, Entra ID and Auth0. Okta was also explored, but the setup couldn't be completed due to registration requirements.

The main objective was to understand the differences between on-premises identity management, cloud identity services and application authentication.
 
## 1. Platforms Compared

| Platform | Main Purpose | Lab Experience |
|---|---|---|
| Active Directory | On-premises user and group management | Hands-on |
| Microsoft Entra ID | Cloud identity management and access security | Hands-on |
| Auth0 | Application authentication and identity federation | Hands-on |
| Okta | Cloud identity management, SSO and MFA | Research only |

## 2. Identity and Access Management

### Active Directory

Active Directory was used to create and manage users, organisational units and security groups across departments such as IT, Finance, HR and Sales.

PowerShell scripts were also created to support onboarding and offboarding processes.

Additional testing involved transferring a user between departments, updating group memberships and disabling accounts that were no longer required.

### Microsoft Entra ID

Entra ID was used to manage cloud users, security groups and Conditional Access policies.

Four Conditional Access policies were configured, covering areas such as MFA, device compliance and sign-in restrictions.

The CA002 MFA policy was tested using a dedicated account, with sign-in logs used to verify the results.

### Auth0

Auth0 was used to configure an application integration with Microsoft Entra ID using OpenID Connect (OIDC).

The authentication flow was tested successfully, including Auth0 MFA (TOTP) enrolment.

This provided a basic understanding of how an application can use an external identity provider for authentication.

### Okta

Okta was initially included as part of the practical lab, but registration restrictions prevented the setup from being completed.

Its main capabilities, including SSO, MFA, group management and application integrations, were reviewed through research instead.

No hands-on Okta configuration was completed.

## 3. Platform Comparison

| Feature | Active Directory | Entra ID | Auth0 | Okta |
|---|---|---|---|---|
| User management | Yes | Yes | Yes | Yes |
| MFA | Through additional solutions | Yes | Yes | Yes |
| SSO | Through supported integrations | Yes | Yes | Yes |
| Access management | Security groups | Groups and roles | Roles and permissions | Groups and assignments |
| Access policies | Group Policy and related controls | Conditional Access | Authentication and authorisation policies | Sign-on policies |
| Main focus | On-premises identity | Cloud/workforce identity | Application identity | Workforce and customer identity |

Some capabilities depend on licensing and configuration.

## 4. Practical Testing

### Active Directory

The following tasks were completed:

- Created users, organisational units and security groups.
- Developed PowerShell scripts for onboarding and offboarding.
- Tested a departmental transfer from Finance to Sales.
- Simulated an unauthorised security group membership change.
- Investigated the change using Windows Security Event ID 4728.
- Removed the additional membership and verified the result.
- Reviewed service accounts with incomplete ownership information.

### Microsoft Entra ID

Testing included:

- Creating cloud users and security groups.
- Configuring four Conditional Access policies.
- Testing CA002, which requires MFA.
- Reviewing sign-in logs to confirm the policy was applied.
- Troubleshooting an incorrect user exclusion.

Not all Conditional Access policies were fully tested or enforced.

### Auth0

Testing included:

- Configuring an application integration with Entra ID.
- Setting up an OIDC authentication flow.
- Completing a successful sign-in.
- Reviewing the authentication result.

### Okta

Okta was researched but not configured or tested due to registration restrictions.

## 5. Key Differences

One of the main differences between the platforms is how they approach identity management.

**Active Directory** focuses on managing identities within a Windows domain. User accounts, organisational units, security groups and PowerShell are important parts of its administration.

**Microsoft Entra ID** focuses more on cloud identities and controlling access to applications and services. Conditional Access provides additional control over authentication requirements based on factors such as users, devices and sign-in conditions.

**Auth0** is more application-focused. It allows applications to use external identity providers and authentication standards such as OIDC.

**Okta** offers cloud identity capabilities, including SSO, MFA and lifecycle management. However, a full practical comparison wasn't possible without completing the setup.

## 6. Challenges and Lessons Learned

A few issues came up during the lab.

During the initial CA002 test, the sign-in logs showed that the policy wasn't being applied. Further investigation revealed that the test account had been excluded from the policy.

After removing the exclusion and testing again, the sign-in logs confirmed that CA002 was successfully applied.

The Okta setup was another limitation, as registration requirements prevented further practical testing.

Overall, the exercises highlighted the importance of checking policy configurations, reviewing authentication logs and verifying access changes rather than assuming everything is working correctly.

## 7. Areas for Further Development

Some areas worth exploring further include:

- Automating user provisioning and deprovisioning.
- Gaining more experience with SAML and OIDC.
- Testing additional Conditional Access scenarios.
- Learning more about identity governance and access reviews.
- Getting practical experience with Okta.
- Understanding how on-premises Active Directory integrates with Entra ID.

## 8. Related Exercises

- [Exercise 1 – Employee Lifecycle Simulation](../exercise1/)
- [Exercise 2 – Conditional Access Testing](../exercise2/)
- [Exercise 3 – Privilege Escalation Detection](../exercise3/)
- [Exercise 4 – Orphaned Service Account Response](../exercise4/)

## Conclusion

The exercise provided a better understanding of how identity management differs across on-premises directories, cloud identity platforms and application authentication services.

Practical testing covered Active Directory administration, Entra ID Conditional Access, Auth0 authentication and security event investigation.

Further experience is still needed in areas such as automated provisioning, identity governance and additional federation scenarios.
