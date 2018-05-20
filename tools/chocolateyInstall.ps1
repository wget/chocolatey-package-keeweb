$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.6.2/KeeWeb-1.6.2.win.ia32.exe'
$url64bit   = 'https://github.com/keeweb/keeweb/releases/download/v1.6.2/KeeWeb-1.6.2.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64bit

    softwareName  = 'keeweb*'

    checksum      = 'b7c232313023301ca6b9b2673a6bb5715cafeeaec0ba52f700001d90334fcf53'
    checksumType  = 'sha256'
    checksum64    = 'fe43b13bdeeea2f7cdc918748d3499b42657efb356b0152c13124ad6c7654bb4'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
