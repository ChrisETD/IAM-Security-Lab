# Identity & Access Management (IAM) Security Lab

A self-directed lab connecting on-premises Active Directory to Microsoft Entra ID, with PowerShell lifecycle automation, Conditional Access testing, Auth0 federation, privileged-change detection and a written security audit. Every finding below links to screenshot evidence, and anything not fully tested is marked as such.

**Scope:** an isolated lab built for learning and portfolio use, not a production deployment.

![IAM lab architecture](diagrams/IAM%20Lab%20Architecture%20Overview.png)

*Windows Server 2022 AD (`iamlab.local`) synchronised to Microsoft Entra ID with Entra Connect Sync (Password Hash Sync, OU-filtered), plus Auth0 federation over OIDC. Built on Oracle VirtualBox.*

## What was done and how far it was verified

| Area | What I did | Status | Evidence |
|---|---|---|---|
| Hybrid identity sync | Deployed Entra Connect Sync, PHS, OU filtering; synced a test account | Verified for one test account | [hybrid-identity-sync](hybrid-identity-sync/) |
| Joiner-mover-leaver | Full lifecycle for a test employee (scripted joiner and leaver, manual mover) | Verified | [Exercise 1](exercises/exercise1/) |
| Conditional Access | Four policies (two On, two Report-only); CA002 tested via sign-in logs | Partial | [Exercise 2](exercises/exercise2/), [conditional-access](conditional-access/) |
| Auth0 federation | Entra ID as identity provider for Auth0 via OIDC; "Assignment required" blocked an unassigned user (`AADSTS50105`), then succeeded once access was restored | Verified for test accounts | [auth0-federation](auth0-federation/) |
| Privileged change detection | Simulated an `Admin-Access` membership change, investigated Event ID 4728, remediated | Verified | [Exercise 3](exercises/exercise3/) |
| Access review | Removed unnecessary `IT-Staff` and `HR-Staff` access from a test user; flagged a privileged member | Verified; privileged finding open | [access-review](access-review/) |
| Non-human identities | Reviewed two service accounts and one app registration; assigned the missing app owner | Partial | [non-human-identity](non-human-identity/) |
| Security audit | Strengthened password policy (7 to 14 characters, lockout at 10); prioritised recommendations | Remediated and open items listed | [Audit report (PDF)](audit-report/IAM%20Lab%20Security%20Audit%20Report.pdf) |

Exercises 1 to 3 were hands-on. [Exercise 4](exercises/exercise4/) (service account review) and [Exercise 5](exercises/exercise5/) (platform comparison) are desk reviews.

## Four things the lab taught me

**Local success is not cloud success.** Entra Connect imported and synchronised users without errors, but nothing reached Entra ID. The server was in staging mode, which processes changes without exporting them. I disabled it and confirmed the account in the Entra portal with its on-premises attributes.

**An MFA prompt does not prove your policy ran.** My first CA002 test completed MFA, but the sign-in log showed the policy hadn't applied because the test user was directly excluded. After removing the exclusion, the log confirmed CA002 applied. A Microsoft-managed MFA policy also returned Success, so I can't claim CA002 alone caused the prompt.

**Authentication is not authorisation.** With "Assignment required" enabled on the Entra enterprise application, a user with valid credentials was still refused with `AADSTS50105` until they were assigned. After restoring access, the Auth0 connection test succeeded.

**Group changes leave an audit trail.** Adding a test user to `Admin-Access` generated Event ID 4728, recording who made the change, who was added and when. Membership of that group does not on its own prove Domain Admin rights, and I did not test its effective permissions.

## PowerShell scripts

| Script | Purpose |
|---|---|
| `onboard-user.ps1` | Creates an AD account and assigns the department group |
| `offboard-user.ps1` | Disables the account, removes group memberships, moves it to a Disabled Users OU |
| `access-review.ps1` | Lists `Admin-Access` members and accounts inactive for 90+ days, exported to CSV |

These are basic lab scripts. They need input validation, error handling, logging and `-WhatIf` support before any real use, and the mover step is not yet scripted. [View scripts](scripts/)

## Open items

- Verify effective permissions of the `Admin-Access` group and justify or remove its membership.
- Test CA001 and CA003 (report-only) and review MFA registration across all users.
- Extend hybrid tests to account changes, disablement, password sign-in and sync errors.
- Document ownership and dependencies for the two service accounts.
- Explore Privileged Identity Management and Entra access reviews.

## Technologies

Windows Server 2022, Active Directory Domain Services, Microsoft Entra ID, Entra Connect Sync, Conditional Access, Auth0, OpenID Connect, PowerShell, Windows Security Event Logs, Oracle VirtualBox.
