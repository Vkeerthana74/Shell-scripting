# 📊 Azure Resource Usage Script

![Version](https://img.shields.io/badge/version-v0.0.1-blue)
![Author](https://img.shields.io/badge/author-Keerthana-orange)
![Platform](https://img.shields.io/badge/platform-Linux-green)
![Status](https://img.shields.io/badge/status-Production%20Ready-brightgreen)

A **Bash script** to list Azure resources on a Linux machine, including **Resource Groups, NSGs, VNets, VMs, and Entra Users**.  
Automatically installs **Azure CLI** if missing and configures it for easy usage.

---

## ⚡ Features
- ✅ Checks & installs Azure CLI on Linux  
- ✅ Logs into Azure using **device code**  
- ✅ Lists:
  - Resource Groups  
  - Network Security Groups (NSGs)  
  - Virtual Networks (VNets)  
  - Virtual Machines (VMs)  
  - Entra Users  

- ✅ Can be automated using **cron jobs**

---

## 🚀 Usage

1. Make script executable
bash

chmod +x azure_usage.sh
2. Run manually
./azure_usage.sh


Follow the device code login when prompted.

⏰ Automate with Cron Job
1. Open crontab
crontab -e

2. Add cron schedule (every 5 minutes)
*/5 * * * * /home/keerthana/azure_usage.sh >> /home/keerthana/azure_usage.log 2>&1

3. Verify cron execution
grep CRON /var/log/syslog | tail -n 20

4. Check script output
tail -f /home/keerthana/azure_usage.log


Tip: Cron uses minimal PATH. Add at top of script if needed:

export PATH=/usr/bin:/usr/local/bin:$PATH


Important: Run az login --use-device-code manually once to cache credentials for cron jobs.

📝 Notes

Logs all output and errors to /home/keerthana/azure_usage.log

Works on Linux machines (Ubuntu/Debian)

Designed for repeated automation using cron

output images:

<img width="940" height="201" alt="image" src="https://github.com/user-attachments/assets/80b11db5-cc6d-49de-8f9f-2a6f742c1183" />
<img width="940" height="342" alt="image" src="https://github.com/user-attachments/assets/9f1f51a6-0026-42c8-8b62-8e42b09a141a" />
<img width="940" height="394" alt="image" src="https://github.com/user-attachments/assets/763c5e21-ffae-489e-9bf2-1c2c640a17ab" />
