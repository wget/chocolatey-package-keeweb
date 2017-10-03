$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.5.4/KeeWeb-1.5.4.win.ia32.exe'
$url64      = 'https://github.com/keeweb/keeweb/releases/download/v1.5.4/KeeWeb-1.5.4.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64

    softwareName  = 'keeweb*'

    checksum      = '6b767e2e19ea6d2617c401bef43c3f42760dc4edb491f792f860a0037d52014f'
    checksumType  = 'sha256'
    checksum64    = 'd0c05e113014daedad6f5699cdb90ba0a6caac3f641f9737062d396d75ad5ce8'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
