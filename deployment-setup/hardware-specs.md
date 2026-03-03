# 🛠️ Hardware Specifications & Deployment Rig

> **Project:** Hidden-Gateway Connectivity Audit  
> **Location:** Hall Area, SMKN 1 Bukittinggi  
> **Status:** Field-Ready

Dokumentasi ini merinci infrastruktur fisik dan logika yang digunakan untuk menjalankan *Rogue Access Point* secara *portable* dan *stealth*.

---

### 💻 1. Host Machine & Virtualization
Unit utama yang menjalankan sistem operasi audit dan manajemen gateway.

| Component | Specification |
| :--- | :--- |
| **Model** | ASUS VivoBook X415JAB |
| **Processor** | Intel(R) Core(TM) i3-1005G1 (4 CPUs) |
| **Memory** | 12GB DDR4 |
| **OS Host** | Windows 11 Home Single Language |
| **Hypervisor** | VirtualBox v7.x |
| **VM OS** | **MikroTik CHR (Cloud Hosted Router)** |
| **VM Role** | DHCP Server, DNS Proxy, Captive Portal Engine |

---

### 📡 2. Networking Interface (Downstream)
Perangkat transmisi sinyal untuk menyebarkan SSID jebakan di area Hall.

* **Access Point:** Huawei EchoLife HG8145V5 (GPON ONT).
* **Mode:** Wireless Bridge Mode.
* **Target SSID:** `@Wifi-Siswa-Smk` (Open Authentication).
* **Frequencies:** Dual-band (2.4GHz & 5GHz) untuk stabilitas koneksi target.
* **Backbone:** Cat5e UTP Patch Cable (Physical connection ke Host RJ45).

---

### 📲 3. Upstream Connectivity (Data Exfiltration)
Jalur keluar internet tersembunyi untuk mengirim data hasil tangkapan ke Telegram Bot.

* **Outbound Device:** Android Smartphone (Personal Device).
* **Connection Method:** **USB Tethering** (RNDIS Interface).
* **Function:** Menyediakan jalur internet terisolasi bagi MikroTik VM agar dapat berkomunikasi dengan API Telegram tanpa menggunakan jaringan sekolah.

---

### 🔋 4. Power & Portability
Modifikasi daya untuk operasional mandiri tanpa ketergantungan pada stopkontak (PLN).

* **Main Power:** Powerbank Lenyes (High Capacity).
* **Power Delivery:** DC-to-USB Step Up Adapter (5V to 12V Output).
* **Autonomy:** Menyuplai daya penuh ke ONT Huawei selama durasi audit (Estimasi 4-6 jam).

---

### 🎒 5. Stealth Deployment Setup
Strategi penyamaran perangkat agar tidak memicu kecurigaan.

* **Physical Integration:** Semua komponen disusun modular di dalam **Ransel Sekolah Standar**.
* **Heat Management:** Penempatan laptop diatur menghadap ventilasi tas untuk menjaga sirkulasi udara VM.
* **Operational Mode:** *Lid-closed operation* aktif; sistem tetap *running* meskipun laptop dalam keadaan tertutup di dalam tas.

---