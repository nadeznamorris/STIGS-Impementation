# 🛡️ Windows 10 STIG Implementation Project

This project demonstrates how I translate **Security Technical Implementation Guides (STIGs**) into practical, testable implementations on **Windows 10**.

The goal is to:

- ✅ Understand what each STIG requires
- ✅ Explain why it matters for security posture (how attackers could abuse misconfigurations)
- ✅ Show how to check compliance (manual & PowerShell methods)
- ✅ Provide a PowerShell script that applies the STIG in a lab environment

This project is part of my journey as a SOC Analyst in training, focusing on hardening, compliance, and attack-defense thinking.

---

## 📂 Project Structure

Each folder in this repo contains:

`implement.ps1` → PowerShell script for the STIG

`README.md` → Explanation, attack-defense context, verification steps

Example:

```
STIGS/
│
├── WN10-AU-000500/
│   ├── implement.ps1
│   └── README.md
│
├── WN10-CC-000145/
│   ├── implement.ps1
│   └── README.md
```

---

## 🔒 Implemented STIGs

- [WN10-AU-000500](https://github.com/nadeznamorris/STIGS-Impementation/tree/main/STIGS/WN10-AU-000500) : The Application event log size must be configured to 32768 KB or greater
- [WN10-CC-000145](https://github.com/nadeznamorris/STIGS-Impementation/tree/main/STIGS/WN10-CC-000145) : Users must be prompted for a password on resume from sleep (on battery)
- [WN10-CC-000185](https://github.com/nadeznamorris/STIGS-Impementation/tree/main/STIGS/WN10-CC-000185) : The default autorun behavior must be configured to prevent autorun commands
- [WN10-CC-000310](https://github.com/nadeznamorris/STIGS-Impementation/tree/main/STIGS/WN10-CC-000310) : Users must be prevented from changing installation options
- [WN10-SO-000255](https://github.com/nadeznamorris/STIGS-Impementation/tree/main/STIGS/STIG%20WN10-SO-000255) : User Account Control must automatically deny elevation requests for standard users
- WN10-UR-000070`: Deny access to this computer from the network

*(More STIGs will be added as I continue the project.)*

---

## 🚀 Why this project matters

Hardening systems with STIGs reduces the attack surface and strengthens overall security posture.
By practicing these implementations, I:

* Learn how attackers might exploit weak configurations
* Build familiarity with Windows user rights and security policies
* Gain hands-on skills in PowerShell scripting and policy enforcement
* Develop the blue team mindset needed for SOC operations

---

## ⚠️ Disclaimer

* These implementations are for learning and demonstration purposes in a lab environment.
* In enterprise environments, STIGs are usually enforced with Group Policy Objects (GPOs) or configuration management tools.

---
