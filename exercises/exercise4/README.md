# Exercise 4 – Orphaned Service Account Response

## Overview

This exercise focuses on identifying and assessing potentially orphaned service accounts in an Active Directory environment.

The objective was to review service account ownership, account status and available lifecycle information, identify potential security risks and recommend appropriate remediation.

## Lab Environment

- **Platform:** Windows Server Active Directory
- **Domain:** `iamlab.local`
- **Tools:** Active Directory and PowerShell
- **Accounts reviewed:** `svc_backup` and `svc_monitoring`

## 1. Service Account Discovery

Two service accounts were identified during the non-human identity assessment:

| Account | Status | ManagedBy | PasswordLastSet |
|---|---|---|---|
| `svc_backup` | Disabled | Not populated | Not populated |
| `svc_monitoring` | Disabled | Not populated | Not populated |

Both accounts were disabled at the time of review.

The absence of recorded ownership and password information highlighted potential identity governance gaps requiring further investigation.

## 2. Risk Assessment

The following risks were considered:

- **Unclear ownership:** Without a documented owner, accountability for reviewing and maintaining an account may be limited.
- **Unknown dependencies:** The accounts may have been associated with services, applications or scheduled tasks that require further investigation.
- **Lifecycle management:** Accounts without confirmed business purposes or ownership may remain in the directory unnecessarily.
- **Future misuse:** If an unnecessary account is re-enabled without appropriate controls, it could introduce security risks.

Because both accounts were disabled, the immediate authentication exposure was reduced.

However, the available findings alone did not establish whether either account was genuinely orphaned.

## 3. Investigation and Response

An initial review of the service account attributes was completed.

The findings identified:

- Two disabled service accounts.
- No populated `ManagedBy` attribute.
- No populated `PasswordLastSet` value.
- No verified application or service dependencies.

The appropriate response would be to identify the responsible service or application owner, confirm whether each account is still required and investigate potential dependencies.

No account deletion was performed as part of this assessment.

## 4. Recommended Remediation

1. Identify and document an accountable owner for each service account.
2. Review associated Windows services, scheduled tasks and application dependencies.
3. Confirm whether the accounts are still required for a valid business purpose.
4. Retain disabled status while investigating accounts that are not currently needed.
5. Where accounts are confirmed unnecessary, follow an approved decommissioning process.
6. Introduce periodic reviews of non-human identities, ownership and permissions.

## 5. Existing Evidence

The original service account investigation and supporting evidence are documented in the repository's [Non-Human Identity Assessment](../../non-human-identity/).

This exercise reuses those findings rather than duplicating screenshots.

## Key IAM Skills Demonstrated

- Non-human identity discovery
- Service account lifecycle assessment
- Identity ownership and accountability review
- Risk-based access assessment
- Least-privilege and identity governance principles
- Remediation planning and documentation

## Limitations

This was an initial service account assessment within a simulated Active Directory lab.

The accounts were not conclusively established as orphaned. Application dependencies, business ownership and effective permissions were not fully verified.

Remediation recommendations were documented, but no account deletion or decommissioning was performed.

## Outcome

Identified two disabled service accounts with incomplete ownership information, assessed potential identity governance risks and documented a safe investigation and remediation approach.

The exercise demonstrates foundational non-human identity governance and service account lifecycle management skills.
