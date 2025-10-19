$packageName = 'tupitube.desk'
$softwareName = 'TupiTube*'
$silentArgs = '/qn /norestart'
$validExitCodes = @(0, 1605, 1614, 1641)  # MSI uninstall success codes

$uninstallKey = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

# Find the installed software
$app = Get-ItemProperty $uninstallKey -ErrorAction SilentlyContinue | 
       Where-Object { $_.DisplayName -like $softwareName }

if ($app) {
    Write-Host "Found $packageName installation: $($app.DisplayName)"
    
    if ($app.QuietUninstallString) {
        $uninstallString = $app.QuietUninstallString
    } elseif ($app.UninstallString) {
        $uninstallString = $app.UninstallString
    } else {
        $uninstallString = "msiexec.exe /x `"$($app.PSChildName)`""
    }

    # Ensure we're using msiexec for silent uninstall
    if ($uninstallString -match 'msiexec') {
        $packageArgs = @{
            packageName    = $packageName
            fileType       = 'MSI'
            silentArgs     = $silentArgs
            validExitCodes = $validExitCodes
            file           = ''
        }

        # Extract the MSI product code if available
        if ($app.PSChildName -match '^{[A-Z0-9-]+}$') {
            $packageArgs.silentArgs = "/x `"$($app.PSChildName)`" $silentArgs"
        } elseif ($app.PSChildName) {
            $packageArgs.silentArgs = "/x `"$($app.PSChildName)`" $silentArgs"
        }

        try {
            Write-Host "Uninstalling $packageName..."
            Uninstall-ChocolateyPackage @packageArgs
        } catch {
            Write-Warning "Failed to uninstall using Chocolatey functions: $_"
            # Fallback to direct uninstall
            Start-Process -FilePath "msiexec.exe" -ArgumentList "/x `"$($app.PSChildName)`" $silentArgs" -Wait
        }
    } else {
        Write-Warning "Non-MSI uninstall string found: $uninstallString"
        Write-Warning "Attempting direct execution..."
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$uninstallString`"" -Wait
    }
} else {
    Write-Warning "$packageName not found in installed programs. It may have been uninstalled already."
}