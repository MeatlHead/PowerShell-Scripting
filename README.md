# PowerShell-Scripting
## Prerequisites

1. **PowerShell 5.1 or later**: Ensure you have PowerShell 5.1 or later installed on your Windows 11 machine.
2. **Administrative Privileges**: The script needs to be run with administrative privileges.
3. **Internet Access**: Ensure your machine has internet access to install the `PSWindowsUpdate` module if it's not already installed.

## Steps to Run the Script

### 1. Download the Script

Save the script to a file named `Windows11DriverUpdater.ps1`.

### Additional Notes:
- Open the `Windows11DriverUpdater.ps1` file on any text editor.
- Replace `<YourUsername>` in the log file path with your actual username.
- The `Set-ExecutionPolicy RemoteSigned -Scope Process -Force` command allows running the script in the current PowerShell session.
- You might need to adjust the execution policy settings if you encounter any issues.

# Open PowerShell as Administrator
To run the script, you need to open PowerShell with administrative privileges:

Click on the Start menu.
Type PowerShell.
Right-click on Windows PowerShell and select Run as administrator.

## Setting PowerShell Execution Policy to RemoteSigned
The PowerShell execution policy determines which scripts can be run on your system. By default, PowerShell restricts running scripts for security reasons. Setting the execution policy to RemoteSigned allows you to run scripts that you create locally and those that are downloaded from the internet (only if they are signed by a trusted publisher).

## Steps to Set the Execution Policy to RemoteSigned
Open PowerShell as Administrator:

Click on the Start menu.
Type PowerShell in the search bar.
Right-click on Windows PowerShell and select Run as administrator.

Set the Execution Policy:

Once PowerShell is open with administrative privileges, type the following command and press Enter:

 >> Set-ExecutionPolicy RemoteSigned -Scope Process -Force 
 ## Set-ExecutionPolicy: 
 This cmdlet changes the user preference for the PowerShell script execution policy.
 RemoteSigned: This parameter allows running scripts created locally without any restrictions and scripts downloaded from the internet if they are signed by a trusted publisher.
 -Scope Process: This parameter ensures that the execution policy is set for the current PowerShell session only. When you close this session, the execution policy will revert to its default state.
 -Force: This parameter forces the command to execute without prompting for user confirmation.

Verify the Execution Policy:

You can verify that the execution policy has been set correctly by running on a PowerShell Console:
>> Get-ExecutionPolicy -List
### This command will display the execution policies for different scopes. You should see RemoteSigned set for the Process scope..
# Run the WindowsDriversUpdater Script
Navigate to the directory where you saved the Windows11DriverUpdater.ps1 script. Use the following command to run the script:

### Now type this on PowerShell to Run the drivers updater script 
>> .\Windows11DriverUpdater.ps1
## Follow the On-Screen Instructions
## The script will:

Check for available driver updates.
List the available updates on the console.
Ask if you want to update the drivers.
If you choose to update, the script will:

## Show progress on the console.
Log the information to a file located at C:\Users\<YourUsername>\driver_update_log.txt.
Log File
The log file will contain entries with timestamps for each step of the process, including any installed updates.

## Troubleshooting
Ensure you have an active internet connection.
Make sure to run PowerShell as an administrator.
If the PSWindowsUpdate module is not found, the script will attempt to install it. Ensure you have permissions to install PowerShell modules.
