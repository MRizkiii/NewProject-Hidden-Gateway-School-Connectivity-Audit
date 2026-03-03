# 📡 Portable Network Gateway Deployment & Field Connectivity Audit
### Real-World Implementation Using MikroTik CHR

**Location:** SMKN 1 Bukittinggi  
**Project Type:** Independent Field Deployment  
**Status:** Operational & Documented  

---

## 1. Project Overview

This repository documents a real-world deployment of a portable network gateway architecture using MikroTik CHR in a virtualized environment.

The objectives of this project:

- Transition from simulation-based labs (GNS3 / VirtualBox) into physical deployment
- Design an isolated network infrastructure
- Route real client traffic through a controlled gateway
- Document the architecture for reproducibility and audit purposes

This deployment was executed using actual hardware in a live environment.

---

## 2. Architecture Summary

The system uses a dual-interface gateway model:

- One interface dedicated to upstream internet connectivity (WAN)
- One interface dedicated to downstream client distribution (LAN)
- NAT translation between networks
- Independent IP addressing scheme

This architecture ensures traffic isolation and independent routing control.

---

## 3. Hardware & Software Stack

| Component | Specification | Role |
|------------|---------------|------|
| Host Machine | ASUS VivoBook (12GB RAM) | Virtualization & Processing |
| Router OS | MikroTik CHR v6.49.19 | Routing, NAT, DHCP |
| Virtualization | Oracle VirtualBox | RouterOS Environment |
| Upstream Link | Samsung USB Tethering (RNDIS) | WAN Connectivity |
| Downstream AP | Huawei EchoLife HG8145V5 (Bridge Mode) | Wireless Distribution |
| Power | Portable Powerbank + 12V Step-Up | Mobile Operation |

---

## 4. Logical Network Topology

```
              Public Internet
                     |
              Samsung (USB Tethering)
                     |
               ether1 (WAN - DHCP Client)
               MikroTik CHR VM
               ether2 (LAN - 22.22.22.1/24)
                     |
             Huawei ONT (Bridge Mode)
                     |
                Wireless Clients


```


---

## 5. IP Addressing & Core Configuration

### WAN (ether1)
- DHCP Client Enabled
- Internet source from Samsung RNDIS interface

### LAN (ether2)
- Static IP: 22.22.22.1/24
- DHCP Pool: 22.22.22.2 – 22.22.22.254
- DNS Servers: 8.8.8.8, 1.1.1.1

### NAT Configuration
- Chain: srcnat
- Action: masquerade
- Out Interface: ether1

This configuration allows downstream traffic to be translated and routed through the isolated upstream connection.

Full export script available in:

`network-configs/full-export.rsc`

---

## 6. Deployment Workflow

1. Deploy MikroTik CHR inside VirtualBox.
2. Bridge Adapter 1 to Samsung USB RNDIS (WAN).
3. Bridge Adapter 2 to laptop Ethernet (LAN).
4. Configure Huawei ONT in Bridge Mode.
5. Assign static IP 22.22.22.1/24 to ether2.
6. Enable DHCP Server on LAN interface.
7. Enable NAT (masquerade) on WAN interface.
8. Connect clients and validate internet routing.

---

## 7. Field Deployment Considerations

- Windows power settings adjusted for closed-lid operation.
- Portable power configuration implemented.
- ONT configured strictly as Layer 2 bridge.
- Custom IP scheme used to avoid address conflict.

This ensured stable operation outside a laboratory setup.

---

## 8. Repository Structure

### 📁 deployment-setup/
- `hardware-specs.md`
- `vm-config.txt`

### 📁 network-configs/
- `full-export.rsc` (RouterOS full export script)

### 📁 hotspot-portal/
- `login.html` (Custom hotspot interface)

### 📁 audit-evidence/
- `hall-environment/`
- `hardware-setup/`
- `logs/`

Photos and field documentation will be added to validate physical implementation.

---

## 9. Technical Challenges Encountered

- USB RNDIS detection in VirtualBox
- DHCP negotiation delay on WAN
- ONT bridge configuration validation
- Power stability during extended runtime
- IP conflict prevention

All issues were resolved during deployment.

---

## 10. Learning Outcomes

This project demonstrates applied competency in:

- MikroTik RouterOS configuration
- NAT and traffic routing
- DHCP server deployment
- Virtualized network infrastructure
- Layer 2 bridge configuration
- Field troubleshooting
- Technical documentation

This marks the transition from simulation-only learning to real-world networking implementation.

---

## 11. Disclaimer

This project was conducted strictly for educational and technical research purposes.

All configurations were performed in an isolated and controlled environment.

---

**Developed by:** MRizkiii  
SMKN 1 Bukittinggi – Network Engineering Student