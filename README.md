# 📡 Project Hidden-Gateway: Field Connectivity Audit
> **Location:** Hall Area, SMKN 1 Bukittinggi  
> **Status:** Operational / Field-Proven  
> **Infrastructure:** Isolated Hybrid Architecture (MikroTik CHR + RNDIS Uplink)

---

## ⚡ Executive Summary
This is **not a simulation**. This repository documents a successful physical deployment of a rogue-style (but ethical) gateway architecture. The project transitions from theoretical GNS3/Lab environments into a **Live Field Deployment** using a specialized hardware stack to monitor, route, and audit network traffic independently from the institutional backbone.

The primary objective was to establish a high-performance, portable access point capable of handling real-client traffic while maintaining a 100% isolated upstream to bypass local network restrictions and filtering.

---

## 🛠️ The Tactical Hardware Stack
Deployment performed using a modular "Backpack Rig" configuration:

| Component | Technical Specification | Role |
| :--- | :--- | :--- |
| **Host Controller** | ASUS VivoBook X415JAB (12GB DDR4) | Virtualization & Data Processing |
| **Core Router** | **MikroTik CHR v6.49.19** (VirtualBox) | Logic, Routing, & DHCP Engine |
| **Upstream Link** | Samsung Mobile (USB Tethering / RNDIS) | Isolated Data Exfiltration (WAN) |
| **Downstream AP** | Huawei EchoLife HG8145V5 (Bridge Mode) | Wireless Signal Distribution (LAN) |
| **Power Source** | Lenyes High-Cap Powerbank + 12V Step-Up | Off-Grid Operational Autonomy |

---

## 🌐 Network Topology & Logic
The architecture utilizes a **Dual-Adapter Bridge Strategy** to ensure zero-leakage between the school's network and our audit gateway.

### 1. Logical Flow
`[Clients]` ⮕ `[Huawei ONT (SSID: @Wifi-Siswa-Smk)]` ⮕ `[Ethernet Cat5e]` ⮕ `[Laptop RJ45]` ⮕ `[MikroTik CHR (ether2)]` ⮕ `[NAT/Masquerade]` ⮕ `[MikroTik CHR (ether1)]` ⮕ `[Samsung RNDIS]` ⮕ `[Public Internet]`

### 2. IP Addressing Scheme
* **Gateway IP:** `22.22.22.1/24` (Custom non-standard scheme to avoid detection/collision).
* **DHCP Pool:** `22.22.22.2` – `22.22.22.254`.
* **DNS:** `8.8.8.8` | `1.1.1.1` (Redundant Global Resolvers).
* **Firewall:** Src-NAT Masquerade enabled on `ether1-WAN`.

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