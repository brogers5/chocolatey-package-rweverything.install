Import-Module au

function Get-InstallScript($Url, $Destination)
{
    if (!(Get-Command "innounp.exe" -ErrorAction SilentlyContinue))
    {
        Write-Information "innounp is not available on PATH, installing..."
        choco install innounp 
    }

    $tempFilePath = New-TemporaryFile
    Invoke-WebRequest -Uri $Url -OutFile $tempFilePath
    $tempDirectoryPath = New-TemporaryFile |
    ForEach-Object {
        Remove-Item $_;
        New-Item -ItemType Directory -Path $_ 
    }
    Expand-Archive -Path $tempFilePath -Destination $tempDirectoryPath -Force
    Remove-Item $tempFilePath -Force

    $installerFileName = Get-ChildItem -Path $tempDirectoryPath -Filter "*.exe" -Recurse

    $installScriptFileName = "install_script.iss"
    innounp -x $installerFileName $installScriptFileName
    Move-Item -Path $installScriptFileName -Destination $destination -Force
    Remove-Item $tempDirectoryPath -Recurse -Force
}

function global:au_BeforeUpdate ($Package)  {
    Set-DescriptionFromReadme -Package $Package -ReadmePath ".\DESCRIPTION.md"
}

function global:au_AfterUpdate ($Package) {
    Get-InstallScript -Url $($Latest.Url32) -Destination ".\install_script_x86.iss"
    Get-InstallScript -Url $($Latest.Url64) -Destination ".\install_script_x64.iss"
}

function global:au_SearchReplace {
    @{
        "DESCRIPTION.md" = @{
            "/tree/v.*\/" = "/tree/v$($Latest.Version)/"
        }
        "$($Latest.PackageName).nuspec" = @{
            "<packageSourceUrl>[^<]*</packageSourceUrl>" = "<packageSourceUrl>https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)</packageSourceUrl>"
        }
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.Url32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')" = "`$1'$($Latest.Url64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $uri = 'http://rweverything.com/changelog/'
    $userAgent = "Update checker of Chocolatey Community Package 'rweverything.install'"
    $page = Invoke-WebRequest -Uri $uri -UserAgent $userAgent -UseBasicParsing

    $version = [Version] [Regex]::Matches($page.Content, "<strong>v(.*) \d{1,2}/\d{1,2}/\d{4}?</strong>").Groups[1].Value

    return @{ 
        Url32 = "http://rweverything.com/downloads/RwV$($version.Major).$($version.Minor).zip"
        Url64 = "http://rweverything.com/downloads/RwX64V$($version.Major).$($version.Minor).zip"
        Version = $version
    }
}

Update-Package -NoReadme