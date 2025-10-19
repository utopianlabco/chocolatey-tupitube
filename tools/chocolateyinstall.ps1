$packageName = 'tupitube.desk'
$softwareName = 'TupiTube*'
$url = 'https://tupitube.com/installers/tupitube_desk_0.2.23_64bit.msi'
$checksum = '859F1F480864A71ACD05C4122B3A093DE5D60823171021376522B7B9A9B74954'
$checksumType = 'sha256'
$silentArgs = '/qn /norestart'
$validExitCodes = @(0, 3010, 1605, 1614, 1641)

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $packageName
    fileType       = 'msi'
    url            = $url
    silentArgs     = $silentArgs
    validExitCodes = $validExitCodes
    softwareName   = $softwareName
    checksum       = $checksum
    checksumType   = $checksumType
}

Install-ChocolateyPackage @packageArgs

# Optional verification
$installLocation = Get-AppInstallLocation $softwareName
if ($installLocation) {
    Write-Host "TupiTube Desk installed successfully to: $installLocation"
} else {
    Write-Warning "Could not verify TupiTube Desk installation location"
}