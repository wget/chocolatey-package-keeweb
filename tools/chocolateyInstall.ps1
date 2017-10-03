$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.5.2/KeeWeb-1.5.2.win.ia32.exe'
$url64      = 'https://github.com/keeweb/keeweb/releases/download/v1.5.2/KeeWeb-1.5.2.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64

    softwareName  = 'keeweb*'

    checksum      = '53d955f699ce0d387f6f9a111206a3c11815beaaeb6b9a6e9783bd3fafa051b3'
    checksumType  = 'sha256'
    checksum64    = '97ab70d79081d07d1d677d19bbcd6f91d5f27e1f6abe8d01825abff580c23553'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
