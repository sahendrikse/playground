# Specify the URL of the AWS CLI installer for Windows
$installerUrl = "https://awscli.amazonaws.com/AWSCLIV2.msi"

# Specify the path where you want to save the installer
$installerPath = "C:\Path\To\Save\AWSCLIV2.msi"

# Download the AWS CLI installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Optionally, you can verify the download by comparing the file hash
# (Replace the hash value with the expected hash from the AWS documentation)
$expectedHash = "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
$actualHash = Get-FileHash -Path $installerPath -Algorithm SHA256 | Select-Object -ExpandProperty Hash

if ($actualHash -eq $expectedHash) {
    Write-Host "Download verification succeeded. Installer saved to: $installerPath"
    
    # Run the installer with silent mode and force restart if necessary
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $installerPath /qn /forcerestart" -Wait
    Write-Host "Installer executed successfully."
} else {
    Write-Host "Download verification failed. Please verify the integrity of the downloaded file."
}
