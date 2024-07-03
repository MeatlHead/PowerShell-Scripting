# Define the path for the log file
$logFile = "$env:USERPROFILE\driver_update_log.txt"

# Function to log messages
function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"
    Add-Content -Path $logFile -Value $logEntry
    Write-Host $logEntry
}

# Initialize the log file
Log-Message "Driver update script started."

# Check if the PSWindowsUpdate module is installed
if (!(Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Log-Message "PSWindowsUpdate module not found. Installing..."
    Install-Module -Name PSWindowsUpdate -Force -SkipPublisherCheck
}

# Import the PSWindowsUpdate module
Import-Module PSWindowsUpdate

# Get the list of available driver updates
$updates = Get-WindowsUpdate -MicrosoftUpdate -Category Drivers

if ($updates.Count -eq 0) {
    Log-Message "No driver updates found."
    exit
}

# Display available updates
Log-Message "The following driver updates are available:"
$updates | ForEach-Object {
    Log-Message $_.Title
}

# Ask the user if they want to update
$answer = Read-Host "Do you want to update these drivers? (yes/no)"

if ($answer -ne "yes") {
    Log-Message "User chose not to update drivers."
    exit
}

# Function to show progress
function Show-Progress {
    param (
        [int]$percentComplete,
        [string]$statusMessage
    )
    Write-Progress -Activity "Updating Drivers" -Status $statusMessage -PercentComplete $percentComplete
}

# Update the drivers
$updateCount = $updates.Count
$currentUpdate = 0

$updates | ForEach-Object {
    $currentUpdate++
    $percentComplete = [math]::Round(($currentUpdate / $updateCount) * 100)
    Show-Progress -percentComplete $percentComplete -statusMessage $_.Title

    # Install the update
    Install-WindowsUpdate -KBArticleID $_.KBArticleID -AcceptAll -AutoReboot

    # Log the update
    Log-Message "Installed: $_.Title"
}

Log-Message "All updates completed."
