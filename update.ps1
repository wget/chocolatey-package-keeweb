import-module au

$releases = 'https://github.com/keeweb/keeweb/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.url32)'"
            "(^[$]url64bit\s*=\s*)('.*')" = "`$1'$($Latest.url64)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.checksum32)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.checksum64)'"
        }
    }
}

function global:au_GetLatest {

    $downloadedPage = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $baseUrl = $([System.Uri]$releases).Authority
    
    $url32 = $downloadedPage.links | ? href -match '32.exe$' | select -First 1 -expand href
    if ($url32.Authority -cnotmatch $baseUrl) {
        $url32 = 'https://' + $baseUrl + $url32
    }
    $url32SegmentSize = $([System.Uri]$url32).Segments.Length
    $filename32 = $([System.Uri]$url32).Segments[$url32SegmentSize - 1]
    
    $url64 = $downloadedPage.links | ? href -match '64.exe$' | select -First 1 -expand href
    if ($url64.Authority -cnotmatch $baseUrl) {
        $url64 = 'https://' + $baseUrl + $url64
    }
    $url64SegmentSize = $([System.Uri]$url64).Segments.Length
    $filename64 = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]
    
    $version = [regex]::match($url32,'/[A-Za-z]+-([0-9]+.[0-9]+.[0-9]+).*exe').Groups[1].Value
    
    $verifyUrl = $releases + '/download/VERSION/Verify.sha256'
    $verifyUrl = $verifyUrl -Replace 'VERSION',"v$version"
    $downloadedPage = Invoke-WebRequest -Uri $verifyUrl -UseBasicParsing
    $downloadedPage = [System.Text.Encoding]::UTF8.GetString($downloadedPage.Content)
    $downloadedPage = $downloadedPage.Split([Environment]::NewLine)
    
    foreach ($line in $downloadedPage) {
    
        $parsed = $line -split ' |\n' -replace '\*',''
        
        if ($parsed[1] -cmatch $filename32) {
            $hash32 = $parsed[0]
        }
        if ($parsed[1] -cmatch $filename64) {
            $hash64 = $parsed[0]
        }
    }
    return @{
        version = $version;
        url32 = $url32;
        checksumType32 = 'SHA256';
        checksum32 = $hash32;
        
        url64 = $url64;
        checksumType64 = 'SHA256';
        checksum64 = $hash64;
    }
}

update -ChecksumFor none
