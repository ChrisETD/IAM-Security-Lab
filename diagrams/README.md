# IAM Lab Architecture

## Overview

This diagram illustrates the identity management and authentication technologies used in my IAM Security Lab.

The lab consists of three main platforms: Windows Server Active Directory, Microsoft Entra ID and Auth0.

## Active Directory

I configured an on-premises Active Directory environment using the `iamlab.local` domain.

This environment includes organisational units, user accounts, security groups and service accounts.

PowerShell scripts were developed to support user onboarding, offboarding and access reviews.

## Microsoft Entra ID

I configured cloud-based identities, security groups and four custom Conditional Access policies.

These policies cover multifactor authentication (MFA), device compliance, administrator location restrictions and risk-based authentication.

Two policies remain in Report-only mode pending further testing.

## Auth0 Federation

I configured federation between Microsoft Entra ID and Auth0 using OpenID Connect (OIDC).

A lab account successfully completed MFA registration and signed in through the federated authentication flow.

## Architecture Clarification

Active Directory and Microsoft Entra ID were configured as separate lab environments.

**Microsoft Entra Connect synchronisation was not implemented**, so the diagram does not represent an active hybrid identity synchronisation deployment.

## Key Learning Outcomes

- Active Directory identity and group management
- Cloud identity administration
- Conditional Access configuration
- Federated authentication
- IAM automation using PowerShell
- Understanding the differences between on-premises and cloud identity management

## Limitations

The diagram represents the lab architecture and configured components. It does not demonstrate production readiness, comprehensive Conditional Access enforcement testing or a complete hybrid identity deployment.
