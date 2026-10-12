# Non-Human Identity Security Review

## Overview

As part of my IAM Security Lab, I reviewed non-human identities across Active Directory and Microsoft Entra ID, focusing on service account governance, application ownership and potential security risks.

## 1. Active Directory Service Accounts

**Accounts reviewed:**
- `svc_backup`
- `svc_monitoring`

### Findings

Both service accounts were disabled at the time of review.

The assessment identified:
- No assigned owner in the `ManagedBy` attribute.
- No recorded password last-set date.
- Account dependencies and historical usage were not fully assessed.

### Recommendations

- Assign accountable owners to service accounts.
- Investigate account dependencies and determine whether the accounts are still required.
- Review permissions and authentication methods.
- Remove unused accounts only after confirming that deletion will not disrupt services.

**Remediation status:** Assessment completed; accounts were not deleted.

## 2. Microsoft Entra ID Application Identity

**Application:** Auth0 IAM Federation

### Finding

The application registration initially had no assigned owner, creating an accountability and governance gap.

### Remediation

Assigned the lab administrator as the application owner and verified the updated ownership configuration.

### Additional Observations

The application used delegated Microsoft Graph `User.Read` permission and a client secret for the
