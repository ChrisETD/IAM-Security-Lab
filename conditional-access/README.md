# Microsoft Entra ID – Conditional Access Policies

## Overview

As part of my IAM Security Lab, I configured four custom Conditional Access policies in Microsoft Entra ID to explore identity security, multifactor authentication (MFA), device compliance, location-based access restrictions and risk-based authentication.

## Configured Policies

### CA001 – Block Non-Compliant Devices
**Status:** Report-only

**Purpose:** Require devices to meet compliance requirements before accessing organisational resources.

**Configuration:** Targets all users with three excluded identities, covers all resources and requires the device to be marked as compliant.

**Note:** The policy was initially configured with an overly broad Block access control. I identified this issue during review and corrected it to require device compliance. Enforcement has not been validated.

### CA002 – Require MFA – All Users
**Status:** On

**Purpose:** Strengthen authentication by requiring MFA for users accessing organisational resources.

**Configuration:** Targets all users with three excluded identities, covers all resources and requires multifactor authentication.

**Note:** Full MFA enforcement across all accounts has not been verified.

### CA003 – Restrict Admin Portal – Locations
**Status:** Report-only

**Purpose:** Restrict administrator access to a selected resource based on network location.

**Configuration:** Targets two administrator roles, with three excluded users. Uses a Named Location called `IAM-Lab-Trusted-Network` to exempt the lab's home network from the location-based block condition.

**Note:** The policy remains in Report-only pending testing. The trusted network is based on a home public IP address, which may change.

### CA004 – Require MFA – Risky Sign-ins
**Status:** On

**Purpose:** Require additional authentication for sign-ins assessed as medium or high risk.

**Configuration:** Targets all users with one excluded identity and one selected resource. Requires MFA for medium- and high-risk sign-ins.

**Note:** Risk-based enforcement has not been independently validated.

## Key Learning Outcomes

- Configuring identity-based access controls in Microsoft Entra ID.
- Understanding how Conditional Access combines user assignments, resources, conditions and grant controls.
- Using Report-only mode to assess policies before enforcement.
- Identifying and correcting potentially disruptive policy configurations.
- Recognising the importance of testing, exclusions and licensing when implementing IAM security controls.

## Lab Limitations

This project demonstrates Conditional Access configuration and review in a controlled lab environment. It does not represent a fully tested production deployment.
