# Planned detection rules

Rules to be implemented once the Wazuh lab is deployed. Each maps to a
specific MITRE ATT&CK technique and a realistic SOC use case.

## 1. SSH brute force
- **Trigger:** 5+ failed SSH logins from the same source within 2 minutes
- **Why:** Classic external brute-force pattern, high real-world frequency
- **MITRE ATT&CK:** T1110 — Brute Force

## 2. Windows failed logon spike
- **Trigger:** Repeated Event ID 4625 (failed logon) from one account/source
- **Why:** Windows-side equivalent of the SSH rule; covers RDP/local auth attacks
- **MITRE ATT&CK:** T1110 — Brute Force

## 3. New local admin account created
- **Trigger:** Event ID 4720 (account created) + 4732 (added to admin group)
- **Why:** Common persistence technique after initial compromise
- **MITRE ATT&CK:** T1136.001 — Create Account: Local Account

## 4. Sudo privilege use by non-standard user
- **Trigger:** `sudo` invocation by an account not on an expected allowlist
- **Why:** Flags privilege escalation attempts or compromised low-priv accounts
- **MITRE ATT&CK:** T1548.003 — Abuse Elevation Control Mechanism: Sudo

## 5. Suspicious PowerShell execution
- **Trigger:** PowerShell invoked with `-enc` (base64-encoded command) flag
- **Why:** Common technique to obfuscate malicious commands from casual log review
- **MITRE ATT&CK:** T1059.001 — Command and Scripting Interpreter: PowerShell

## 6. Unexpected outbound connection from server host
- **Trigger:** Server VM initiates a connection to an unexpected external endpoint
- **Why:** Simulates C2 beacon detection — servers shouldn't reach out unprompted
- **MITRE ATT&CK:** T1071 — Application Layer Protocol (C2)

## 7. Log source stopped reporting
- **Trigger:** No events from a previously active agent for X minutes
- **Why:** Detects an attacker disabling logging to cover tracks
- **MITRE ATT&CK:** T1562.001 — Impair Defenses: Disable or Modify Tools

## 8. Custom log parser (stretch goal)
- **Trigger:** N/A — this is a decoder, not an alert rule
- **Why:** Demonstrates the "create and maintain custom parsers" requirement directly —
  a log format Wazuh doesn't parse out of the box, written and tested manually
- **MITRE ATT&CK:** N/A (infrastructure, not detection)

---

Status: none implemented yet. This file exists to document the detection
strategy before build — implementation will move each rule into its own file
under `detection-rules/` with the actual rule config once written.
