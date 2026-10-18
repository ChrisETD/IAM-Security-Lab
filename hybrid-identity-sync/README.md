# Hybrid Identity Synchronisation | Active Directory & Microsoft Entra ID

## Project Overview

This project involved implementing and validating hybrid identity synchronisation between an on-premises Active Directory environment and Microsoft Entra ID using Microsoft Entra Connect Sync.

The objective was to establish a functional hybrid identity environment, enabling selected on-premises identities to be provisioned into Microsoft Entra ID while maintaining Active Directory as their authoritative identity source.

The implementation focused on directory integration, synchronisation scoping, identity attribute configuration, troubleshooting and verification.

## Objectives

- Establish connectivity between on-premises Active Directory and Microsoft Entra ID.
- Deploy and configure Microsoft Entra Connect Sync on a dedicated server.
- Implement organisational unit (OU) filtering to control the scope of synchronised identities.
- Configure Password Hash Synchronisation (PHS).
- Validate directory imports and synchronisation operations.
- Troubleshoot synchronisation issues and verify successful cloud provisioning.

## Lab Environment

| Component | Configuration |
|---|---|
| Domain Controller | Windows Server 2022 (TestLab) |
| Active Directory Domain | `iamlab.local` |
| Synchronisation Server | Windows Server 2022 (EntraConnect01) |
| Cloud Identity Platform | Microsoft Entra ID |
| Microsoft Entra Tenant | `iamlab133.onmicrosoft.com` |
| Synchronisation Tool | Microsoft Entra Connect Sync |
| Authentication Method | Password Hash Synchronisation |
| Synchronisation Scope | Finance, HR, IT and Sales OUs |
| Virtualisation Platform | Oracle VirtualBox |

## Implementation

### 1. Infrastructure Preparation

Provisioned a dedicated Windows Server 2022 virtual machine to host Microsoft Entra Connect Sync.

Configured network connectivity between the synchronisation server and the on-premises domain controller, including internal network addressing and DNS resolution.

Joined the synchronisation server to the `iamlab.local` Active Directory domain and verified connectivity to Microsoft Entra ID.

### 2. Microsoft Entra Connect Configuration

Installed Microsoft Entra Connect Sync using the custom installation option.

Configured the connection between the on-premises Active Directory forest and the Microsoft Entra tenant, selecting Password Hash Synchronisation as the authentication method.

Applied OU filtering to restrict synchronisation to four
