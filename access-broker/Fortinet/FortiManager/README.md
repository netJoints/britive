##### FortiManager is a centralized management platform by Fortinet that provides a single point of control for managing Fortinet network security devices, including FortiGate firewalls. It offers features for configuring, monitoring, and analyzing Fortinet appliances across an organization, enabling administrators to manage large deployments more efficiently. 


# Britive + FortiManager JIT Access Broker

This directory contains automation scripts that integrate [Britive](https://www.britive.com/) with **Fortinet FortiManager** to enable **Just-In-Time (JIT) access provisioning and deprovisioning**.

Britive is used as the **access broker**, granting time-bound privileged access. These scripts support:

- ✅ **Checkout**: Automatically create a temporary FortiManager user with a random JIT password.
- ✅ **Check-in**: Automatically log out the user (if active), delete the session, and clean up the account from FortiManager.

---

## 🛠️ How It Works

### 1. `FortiManager_checkout.sh` (not shown here but assumed)

- Creates a user account in FortiManager using sanitized email input.
- Sets a secure temporary JIT password.
- Grants the account a pre-defined admin profile.
- Output: User credentials ready to use for the duration of access.

### 2. `FortiManager_checkin.sh`

- Looks for any **active SSH or API sessions** for the user.
- Kills the session if found.
- Deletes the user account from FortiManager.
- Logs all output to a timestamped log file.

---

## ✅ Benefits

- 🔐 **Zero Standing Privileges**: No permanent admin accounts on FortiManager.
- 📜 **Auditable Events**: Logs each session, kill, and deletion with timestamped output.
- ⚙️ **Automation-Friendly**: Easily used as part of CI/CD or IDP-triggered workflows.
- ⏱️ **JIT Access**: Admins get access only when needed, for the duration required.

---

## 🧪 Sample Output

=== [Tue May 13 11:30:12 PDT 2025] ===
Logged in to FortiManager. Checking for active sessions for user ‘shahzadali’.
Active session found for ‘shahzadali’ with session_id 1111. Killing session…
Deleting user ‘shahzadali’…
Check-in complete. Log saved to: fortimanager_checkin_shahzadali_20250513-113012.log


---

## 🚀 Usage

### Run Check-In Script

```bash
chmod +x FortiManager_checkin.sh
./FortiManager_checkin.sh


Customize (Optional)

Edit the script to inject:
	•	FortiManager host/IP
	•	Admin login credentials
	•	Target username (extracted and sanitized from Britive)



fmg_host="18.144.170.42"
fmg_admin_user="FortiManager_Svc_Account"
fmg_admin_password="********"
jit_username="shahzadali"


Fortinet/
└── FortiManager/
    ├── FortiManager_checkout.sh     # (not shown here, assumed)
    ├── FortiManager_checkin.sh      # Check-in and cleanup logic
    └── README.md                    # This file



Pull requests are welcome! If you’re using Britive and Fortinet in your org, feel free to open issues or suggest improvements.


MIT License. See LICENSE for more details.

