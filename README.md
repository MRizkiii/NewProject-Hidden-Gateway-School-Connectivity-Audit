<div align="center">

# 🚀 Portable Network Gateway Deployment  
### Real-World Field Connectivity Implementation

**MikroTik CHR • Virtualized Routing • Independent Upstream Architecture**

SMKN 1 Bukittinggi — Network Engineering Project

</div>

---

## 📌 Project Overview

This repository documents a **real-world portable gateway deployment** built using MikroTik CHR running inside a virtualized environment.

This project represents the transition from simulation-based learning (GNS3 / lab-only environments) to **physical infrastructure deployment handling real client traffic**.

### 🎯 Objectives

- Deploy a dual-interface gateway architecture
- Route live traffic through an isolated upstream
- Implement DHCP, NAT, and DNS control
- Document full configuration for reproducibility
- Validate stability in a field environment

---

## 🧠 System Architecture

The network is designed using a dual-interface isolation model:

- **WAN Interface** → Dedicated upstream connectivity
- **LAN Interface** → Client distribution network
- **NAT Translation** → Controlled outbound routing
- **Independent IP Scheme** → Avoid address conflict

---

## 🌐 Network Topology

```
            ┌────────────────────┐
            │   Public Internet   │
            └──────────┬──────────┘
                       │
            ┌──────────▼──────────┐
            │ Samsung USB Tether  │
            │     (RNDIS WAN)     │
            └──────────┬──────────┘
                       │ ether1
            ┌──────────▼──────────┐
            │   MikroTik CHR VM   │
            │  Routing + NAT +    │
            │       DHCP          │
            └──────────┬──────────┘
                       │ ether2 (22.22.22.1/24)
            ┌──────────▼──────────┐
            │  Huawei ONT Bridge  │
            └──────────┬──────────┘
                       │
                Wireless Clients
```
## 🔢 IP Configuration
* **Gateway IP:** `22.22.22.1/24` (Custom non-standard scheme to avoid detection/collision).
* **DHCP Pool:** `22.22.22.2` – `22.22.22.254`.
* **DNS:** `8.8.8.8` | `1.1.1.1` (Redundant Global Resolvers).
* **Firewall:** Src-NAT Masquerade enabled on `ether1-WAN`.

---
## 🛠 Deployment Workflow

1. Deploy MikroTik CHR inside VirtualBox  
2. Bridge Adapter 1 → Samsung RNDIS (WAN)  
3. Bridge Adapter 2 → Ethernet (LAN)  
4. Configure ONT to Bridge Mode  
5. Assign static LAN gateway IP  
6. Activate DHCP Server  
7. Enable NAT Masquerade  
8. Validate live client traffic  

---

## 📂 Deep-Dive Repository Structure
Organized for reproducibility and forensic audit:

* 📁 **[`audit-evidence/`](./audit-evidence/)**: The "Proof of Work".
    * 🖼️ `hall-environment/`: Visual data of the deployment zone.
    * ⚙️ `hardware-setup/`: Close-up of the "Backpack Rig" and cabling.
    * 📋 `logs/`: Traffic logs and session captures.
* 📁 **[`deployment-setup/`](./deployment-setup/)**: Technical blueprints.
    * 📄 [`hardware-specs.md`](./deployment-setup/hardware-specs.md): Detailed hardware modification.
    * 📄 [`vm-config.txt`](./deployment-setup/vm-config.txt): VirtualBox resource allocation & Adapter UUIDs.
* 📁 **[`network-configs/`](./network-configs/)**: The "Brain".
    * 📄 [`full-export.rsc`](./network-configs/full-export.rsc): Full MikroTik RouterOS script for one-click redeployment.
* 📁 **[`hotspot-portal/`](./hotspot-portal/)**: The "Interface".
    * 🌐 [`login.html`](./hotspot-portal/login.html): Custom-coded responsive portal for client authentication.

---

## 🥷 Operational Stealth Strategy
To maintain a low profile during the audit at the Hall area, the following "Stealth" protocols were implemented:

1. **Lid-Closed Operation:** Windows 11 power management modified to prevent sleep when the laptop lid is closed, allowing the VM to run inside a standard backpack.
2. **Thermal Management:** Peripherals arranged to ensure air intake for the ASUS VivoBook remains unobstructed while concealed.
3. **Physical Masking:** The Huawei ONT is powered via a DC-to-USB adapter, eliminating the need for a wall outlet and allowing for "Mobile Deployment".
4. **SSID Mimicry:** Using `@Wifi-Siswa-Smk` to blend in with existing school infrastructure for seamless client transition.

---

## 📈 Learning Outcomes & Significance
This project proves mastery over:
* **Hybrid Networking:** Bridging physical hardware with virtualized instances.
* **Traffic Engineering:** Managing DHCP, NAT, and DNS in a rogue-environment.
* **Problem Solving:** Converting 5V USB power to 12V DC for networking gear.
* **Field Documentation:** Creating professional-grade technical repositories for real-world scenarios.

---
**⚠️ LEGAL DISCLAIMER:** *This project is for Educational Audit purposes only. All activities were performed within the context of network security research at SMKN 1 Bukittinggi.*

**Developed by:** [MRizkiii](https://github.com/MRizkiii)  
**Location:** Bukittinggi, West Sumatra, Indonesia.