# Specify the URL of the SSM Agent installer
$installerUrl = "https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/windows_amd64/AmazonSSMAgentSetup.exe"

# Specify the path where you want to save the installer
$installerPath = "C:\Path\To\Save\AmazonSSMAgentSetup.exe"

# Download the SSM Agent installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Run the installer
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Verify the installation
if (Test-Path "C:\Program Files\Amazon\SSM\amazon-ssm-agent.exe") {
    Write-Host "SSM Agent installed successfully."
} else {
    Write-Host "SSM Agent installation failed. Please check for errors."
}