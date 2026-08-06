# SOC Detection Lab — Wazuh SIEM & Incident Response

![Status](https://img.shields.io/badge/status-in%20progress-yellow)

A home-lab SOC environment built to practice and demonstrate real detection
engineering and incident response — not just tool familiarity.

## Overview

This project deploys Wazuh SIEM across monitored Windows and Linux endpoints,
implements custom correlation rules mapped to MITRE ATT&CK, simulates real
attacker behavior with Atomic Red Team, and documents the full incident
response lifecycle from detection through containment and reporting.

## Workflow

![Architecture diagram](architecture-diagram.png)

## What this project covers

- Wazuh SIEM deployment monitoring Windows + Linux endpoints
- Custom correlation rules mapped to MITRE ATT&CK techniques
- Simulated attacks (Atomic Red Team) with full incident response documentation
- IR playbook / SOP authored from scratch

## Roadmap

- [ ] Wazuh manager + agent deployment, log ingestion confirmed
- [ ] Custom detection rules (planned set documented in `detection-rules/PLANNED.md`)
- [ ] Attack simulation + incident report
- [x] IR playbook / SOP

## Why this project

Built to go deeper than SIEM dashboard familiarity — into writing detection
logic, tuning for false positives, and documenting incidents the way a real
SOC team would.
