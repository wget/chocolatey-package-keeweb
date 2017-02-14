$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.4.0/KeeWeb-1.4.0.win.ia32.exe'
$url64      = 'https://github.com/keeweb/keeweb/releases/download/v1.4.0/KeeWeb-1.4.0.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64

    softwareName  = 'keeweb*'

    checksum      = '72d314a368ca82a60ad0f30ea2032dbee3b3331051debf3e6c85efb19a920999caad388b4a8a8e0d94214e16a72973fa31e01470688707addbad628b42fd4336'
    checksumType  = 'sha512'
    checksum64    = '11fc7fb1e473a583c72bb30ef30d249cc881983036fd6ae756af7f681830c3a9ae926dd6bfb608bf3f7fd9250932ea736d76d18cd07e1a1c3f14f24f9f3eae1e'
    checksumType64= 'sha512'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
