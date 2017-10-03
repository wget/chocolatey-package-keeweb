$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.5.3/KeeWeb-1.5.3.win.ia32.exe'
$url64      = 'https://github.com/keeweb/keeweb/releases/download/v1.5.3/KeeWeb-1.5.3.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64

    softwareName  = 'keeweb*'

    checksum      = 'f1bf096473c38b69bd13c01d4558bedcc6b3c3fb98f1f06abc8208e32a2559f5'
    checksumType  = 'sha256'
    checksum64    = '827ff58f120ebf1e3c4b02f255b7f5c22b793f25379f3acc625bbe7368e10338'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
