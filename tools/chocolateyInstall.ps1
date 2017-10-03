$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.5.1/KeeWeb-1.5.1.win.ia32.exe'
$url64      = 'https://github.com/keeweb/keeweb/releases/download/v1.5.1/KeeWeb-1.5.1.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64

    softwareName  = 'keeweb*'

    checksum      = '72770fb2177f170c42f745ddb0cb6f90a1120c91f520aee7307082c9bf85bd40'
    checksumType  = 'sha256'
    checksum64    = '94d696e909a9302f1c8d2269fe06689b8dfeb1b49ade73eaad803e8f63dd3c6a'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
