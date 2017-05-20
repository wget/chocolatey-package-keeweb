$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.5.0/KeeWeb-1.5.0.win.ia32.exe'
$url64      = 'https://github.com/keeweb/keeweb/releases/download/v1.5.0/KeeWeb-1.5.0.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64

    softwareName  = 'keeweb*'

    checksum      = '4c9a7353e950606e04823dc9599c20f1842856212444b68e9bfdaf46841a0a0cdabd4561830b72dfcd343d81e68a9669dfe8573a5f63a6f600aee23db142d65b'
    checksumType  = 'sha512'
    checksum64    = '0f7e9d348e6a2816f3f9aab33a7e1a994c5f72b74427b038cb812ebadc7edd2da74bb17ceb57102d4a5a5138fe0eb118d8ff080479034be215c41984d0cc5e33'
    checksumType64= 'sha512'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
