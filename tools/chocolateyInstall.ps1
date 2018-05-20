$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.6.1/KeeWeb-1.6.1.win.ia32.exe'
$url64bit   = 'https://github.com/keeweb/keeweb/releases/download/v1.6.1/KeeWeb-1.6.1.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64bit

    softwareName  = 'keeweb*'

    checksum      = 'cad99d525629bb2d4cc41e1b36b0bafed92afc060c03a7e840585c4098cd99be'
    checksumType  = 'sha256'
    checksum64    = 'c9146e73e99595e9d9b5bb77ff978d2777c4ba19530da9d48d62c74ed619958e'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
