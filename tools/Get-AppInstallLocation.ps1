function Get-AppInstallLocation($softwareName) {
    $uninstallPath = @(
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )
    
    $app = Get-ItemProperty $uninstallPath -ErrorAction SilentlyContinue | 
           Where-Object { $_.DisplayName -like $softwareName }
    
    if ($app -and $app.InstallLocation) {
        return $app.InstallLocation
    }
    
    return $null
}