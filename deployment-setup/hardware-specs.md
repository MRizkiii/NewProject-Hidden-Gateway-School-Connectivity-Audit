# 🛠️ Hardware Specifications & Deployment Rig

> **Project:** Hidden-Gateway Connectivity Audit  
> **Location:** Hall Area, SMKN 1 Bukittinggi  
> **Status:** Field-Ready

Dokumentasi ini merinci infrastruktur fisik yang digunakan untuk menjalankan *Rogue Access Point* secara *portable* dan *stealth*.

---

### 💻 1. Host Machine (Audit Controller)
Unit utama yang bertanggung jawab atas manajemen trafik dan pengumpulan data.

| Component | Specification |
| :--- | :--- |
| **Model** | ASUS VivoBook X415JAB |
| **Processor** | Intel(R) Core(TM) i3-1005G1 (4 CPUs) |
| **Memory** | 12GB DDR4 |
| **Operating System** | Windows 11 Home Single Language |
| **Virtualization** | VirtualBox with MikroTik CHR (Cloud Hosted Router) |

---

### 📡 2. Networking Interface
Perangkat transmisi sinyal untuk menjangkau target di area Hall.

* **Access Point:** Huawei EchoLife HG8145V5 (GPON ONT)
* **Mode:** Bridge / Wireless Access Point
* **Target SSID:** `@Wifi-Siswa-Smk`
* **Frequencies:** Dual-band (2.4GHz & 5GHz) untuk stabilitas koneksi target.
* **Backbone:** Cat5e UTP Patch Cable (High-speed local connection).

---

### 🔋 3. Power & Portability
Modifikasi daya untuk operasional tanpa sumber listrik statis (PLN).

* **Main Power:** Powerbank Lenyes (High Capacity).
* **Power Delivery:** DC-to-USB Step Up Adapter (Convert 5V to 12V Output).
* **Autonomy:** Mampu menyuplai daya ke ONT Huawei selama sesi audit berlangsung.

---

### 🎒 4. Stealth Deployment Setup
Strategi penyamaran perangkat di lapangan.

* **Integration:** Semua komponen (Laptop, ONT, Powerbank) disusun secara modular di dalam **Ransel Sekolah Standar**.
* **Heat Management:** Penempatan perangkat diatur untuk menjaga sirkulasi udara laptop saat menjalankan VM di dalam tas.
* **Operational Mode:** *Lid-closed operation* pada Windows 11 agar laptop tetap aktif saat tas tertutup rapat.

---