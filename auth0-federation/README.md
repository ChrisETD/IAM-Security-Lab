
# Auth0 Federation and Application Access Control

## Overview

As part of my IAM Security Lab, I configured federated authentication between Microsoft Entra ID and Auth0 using OpenID Connect (OIDC).

The objective was to understand how Microsoft Entra ID can act as an identity provider for an external application, while testing application access assignments, multifactor authentication (MFA) and authentication logging.

The exercise involved configuring an application registration in Microsoft Entra ID, establishing an Auth0 enterprise connection and testing authentication using lab accounts.

Additional testing was carried out to investigate how application assignments affect access and to verify authentication outcomes.

## 1. Microsoft Entra ID Application Configuration

An application registration named `Auth0 IAM Federation` was configured in Microsoft Entra ID to support the integration with Auth0.

The application was configured with a client secret and a web redirect URI to support the OIDC authentication flow.

A corresponding enterprise application was used to manage user assignments and access restrictions.

The application registration was also reviewed during the Non-Human Identity Security Review, where an unassigned application owner was identified and subsequently remediated.

### Evidence

![Microsoft Entra ID Application Registration](screenshots/01-entra-app-registration.png)

## 2. Auth0 Federation Configuration

An enterprise connection named `Entra-IAM-Lab` was configured in Auth0 using Microsoft Entra ID as the external identity provider.

The connection was associated with the Microsoft Entra tenant `iamlab133.onmicrosoft.com`.

The configuration included:

- Selecting Microsoft Identity Platform (V2).
- Configuring the Microsoft Entra ID tenant information.
- Associating the connection with the Microsoft Entra application registration.
- Configuring the client credentials required for authentication.
- Enabling basic profile attributes for the authentication connection.

The integration was configured to support user authentication through Microsoft Entra ID.

### Evidence

![Auth0 Federation Connection](screenshots/02-auth0-connection.png)

## 3. Application Access Control

The Microsoft Entra enterprise application was configured with **Assignment required** enabled.

This setting restricts access to users who have been explicitly assigned to the application, either directly or through an assigned group.

A security group named `SG-Auth0-App-Access` was also assigned to the enterprise application.

The configuration provided an opportunity to test how application assignments affect access to a federated application.

### Evidence

![Enterprise Application Assignment Requirement](screenshots/05-assignment-required.png)

## 4. Access Restriction Testing

Authentication tests were performed using Microsoft Entra ID lab accounts to investigate application access restrictions.

During testing, an account without the required application assignment was blocked from accessing the application.

Microsoft Entra ID returned error `AADSTS50105`, indicating that the account was not directly assigned to the application or a member of a group with the required access.

This confirmed that the enterprise application's assignment requirement was restricting access for the tested account.

### Evidence

![Unassigned User Blocked](screenshots/07-unassigned-user-blocked.png)

## 5. Successful Authentication Testing

Following the access restriction tests, application access was restored for a test account and authentication was performed again.

The account successfully completed the Auth0 federation connection test.

Auth0 displayed a successful transaction message for the `Entra-IAM-Lab` connection and returned the authenticated user's profile information.

This confirmed that the selected test account could authenticate successfully through the configured integration.

The result also demonstrated the importance of validating access after making changes to application assignments.

### Evidence

![Successful Authentication After Access Restoration](screenshots/11-successful-login-after-access-restored.png)

## 6. Authentication Logs and MFA

Auth0 authentication logs were reviewed to examine the events recorded during the authentication process.

The logs included:

- Successful login.
- Successful signup.
- Successful authorization-code exchange.
- MFA/TOTP enrolment started.
- MFA/TOTP enrolment completed.

The recorded events provided evidence of authentication activity and MFA enrolment within the lab.

These results supported the successful federation testing, although they did not establish comprehensive MFA enforcement across all users or authentication scenarios.

### Evidence

![Auth0 Authentication Logs](screenshots/10-auth0-authentication-logs.png)

## 7. Testing Summary

| Test | Expected Outcome | Result |
|---|---|---|
| Configure Entra ID and Auth0 federation | Establish an authentication connection | Successful |
| Require enterprise application assignment | Restrict access to assigned users and groups | Configured |
| Attempt access without assignment | Unassigned account is blocked | Confirmed – AADSTS50105 |
| Restore application access and retest | Test account authenticates successfully | Confirmed |
| Review Auth0 authentication logs | Authentication events are recorded | Confirmed |
| Review MFA enrolment events | MFA registration activity is recorded | Confirmed |

## 8. Key Learning Outcomes

This exercise provided practical experience with:

- Configuring Microsoft Entra ID application registrations.
- Integrating Microsoft Entra ID with Auth0 using OIDC.
- Understanding the relationship between identity providers and external applications.
- Managing enterprise application assignments.
- Restricting access using user and group assignments.
- Investigating authentication failures.
- Validating successful authentication after access changes.
- Reviewing Auth0 authentication logs.
- Understanding MFA enrolment within an authentication process.

A key takeaway from this exercise was the distinction between authentication and authorisation.

Although an account may have valid credentials and successfully authenticate with Microsoft Entra ID, access to an application can still be restricted by its assignment requirements.

Testing both successful and unsuccessful authentication scenarios helped demonstrate how these controls operate within a federated identity environment.

## 9. Scope and Limitations

This exercise was completed within a controlled IAM lab environment.

Federated authentication between Microsoft Entra ID and Auth0 was successfully configured and tested using selected lab accounts.

Application assignment restrictions were tested, and successful authentication was verified following an access change.

However, comprehensive testing of Conditional Access enforcement, MFA requirements across all users, automated provisioning and advanced federation scenarios was not completed.

The exercise demonstrates the configured integration, application access restrictions and verified authentication outcomes rather than a production-ready federation deployment.

