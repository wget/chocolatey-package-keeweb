$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.5.6/KeeWeb-1.5.6.win.ia32.exe'
$url64bit   = 'https://github.com/keeweb/keeweb/releases/download/v1.5.6/KeeWeb-1.5.6.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64bit

    softwareName  = 'keeweb*'

    checksum      = '385176064f55ff30efd543cff624c3548d1bb2eabab6a00625dcc517dc2960ab'
    checksumType  = 'sha256'
    checksum64    = '6413145f57316b9405200e100f9d4dd26874632684cca361bb5f2e7a9b204d60'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
