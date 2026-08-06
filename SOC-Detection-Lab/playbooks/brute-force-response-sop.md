# Standard Operating Procedure: Brute Force Attack Response

**Document type:** Incident Response Playbook

**Scope:** SSH and RDP/Windows authentication brute-force attempts

**MITRE ATT&CK reference:** T1110 — Brute Force

---

## 1. Purpose

This SOP defines the standard response process when a brute-force detection
rule fires — repeated failed authentication attempts against SSH or Windows
logon, indicating an attacker or automated tool attempting credential
guessing.

## 2. Trigger conditions

This SOP is invoked when either detection rule fires:
- **SSH brute force:** 5+ failed SSH logins from the same source IP within 2 minutes
- **Windows failed logon spike:** Repeated Event ID 4625 from the same account or source within a short window

## 3. Severity classification

| Condition | Severity |
|---|---|
| Failed attempts only, no successful logon | Medium |
| Failed attempts followed by a successful logon from the same source | High |
| Successful logon followed by privilege escalation or new account creation | Critical |

## 4. Response steps

### Step 1 — Triage (target: within 5 minutes of alert)
1. Confirm the alert in the SIEM — verify it isn't a false positive (e.g. a misconfigured service account retrying with an expired password).
2. Identify the source IP and target account(s).
3. Check whether the source IP is internal or external, and cross-reference against any known allowlists (scanners, monitoring tools).
4. Determine current severity using the table above.

### Step 2 — Investigation
1. Pull the full authentication log timeline for the source IP and target account over the preceding 24 hours.
2. Check for a successful login following the failed attempts — this changes the incident from "attempted" to "possible compromise."
3. If a successful login occurred, check for follow-on activity: new processes, new accounts created, privilege escalation, lateral movement indicators.
4. Identify whether other accounts or hosts show similar patterns from the same source (indicating a broader campaign, not an isolated attempt).

### Step 3 — Containment
- **If attempts only, no success:** Block the source IP at the firewall/security group level. No account action needed unless the account is showing signs of prior compromise.
- **If a successful logon occurred:** 
  1. Disable the compromised account immediately.
  2. Isolate the affected host from the network if follow-on activity is confirmed.
  3. Force a password reset for the account once contained.
  4. Block the source IP.

### Step 4 — Eradication and recovery
1. Confirm the source IP is blocked and no further attempts are succeeding.
2. If an account was compromised, verify no persistence mechanisms were installed (new scheduled tasks, new local admin accounts, new SSH keys).
3. Restore the account with a new password and, where available, enforce MFA before re-enabling.

### Step 5 — Documentation and reporting
1. Complete a full incident report using the standard IR report structure (detection, triage, investigation, containment, root cause, recommendations).
2. Map the incident to its MITRE ATT&CK technique(s).
3. If client-facing, prepare a plain-language summary: what happened, what was affected, what was done, and what's recommended going forward.

## 5. Escalation criteria

Escalate to senior SOC personnel or the client immediately if:
- A successful logon is confirmed following brute-force attempts
- The compromised account has elevated/administrative privileges
- Evidence of lateral movement or persistence is found

## 6. Post-incident recommendations (standard set)

- Enforce account lockout policies after N failed attempts
- Enforce MFA on all externally-facing authentication points
- Review and restrict SSH access to known IP ranges where feasible
- Ensure logging coverage exists for all authentication endpoints (this incident type is only detectable if logs are actually being collected)

---

*This SOP is a living document — update thresholds and escalation contacts as the environment changes.*
