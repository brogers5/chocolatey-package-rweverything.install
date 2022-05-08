$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'http://rweverything.com/downloads/RwV1.7.zip'
$url64      = 'http://rweverything.com/downloads/RwX64V1.7.zip'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $url
  url64bit       = $url64
  checksum       = '919bafdd66fdbacc7a59c58c167b9bb5b1b3b58c9c2e84991af5c30b397b48e2'
  checksumType   = 'sha256'
  checksum64     = 'ba83e2c947bb65fa81afdad5ca611cb6ca9cc98dde200bd1758f8c59637784ba'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

if ((Get-OSArchitectureWidth -eq 64) -and ($env:chocolateyForceX86 -ne $true))
{
  $extractedDirectory = "Win64"
  $fileName = "SetupRwX64.exe"
}
else
{
  $extractedDirectory = "Win32"
  $fileName = "SetupRw.exe"
}

$extractedDirectoryPath = Join-Path -Path $toolsDir -ChildPath $extractedDirectory

$filePath = Join-Path -Path $extractedDirectoryPath -ChildPath $fileName
$installerArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file           = $filePath
  softwareName   = 'RW-Everything v*'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @installerArgs

Remove-Item -Path $extractedDirectoryPath -Recurse -Force -ErrorAction SilentlyContinue
if (Test-Path -Path $filePath)
{
  Set-Content -Path "$filePath.ignore" -Value $null -ErrorAction SilentlyContinue
}
