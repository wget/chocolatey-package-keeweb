$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.5.5/KeeWeb-1.5.5.win.ia32.exe'
$url64      = 'https://github.com/keeweb/keeweb/releases/download/v1.5.5/KeeWeb-1.5.5.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64

    softwareName  = 'keeweb*'

    checksum      = '720a26f858000fe1fcd92be3ea375a784074412b37b030b2691c00198022dfee'
    checksumType  = 'sha256'
    checksum64    = '5367c5f9e37d747ec6b712cccf979a5b5ee8848280b6e554ad0fe7465d525959'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
