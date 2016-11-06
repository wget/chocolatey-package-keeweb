$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.3.3/KeeWeb-1.3.3.win.ia32.exe'
$url64      = 'https://github.com/keeweb/keeweb/releases/download/v1.3.3/KeeWeb-1.3.3.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64

    softwareName  = 'keeweb*'

    checksum      = '75efca4447b53d2e9473948af9b53676cef302eeafb3b095d2d75cbe9a42fef45adf78d3b69b2cc35173557dd55b3fc9500c672c46cff4d882fa246400a47fc5'
    checksumType  = 'sha512'
    checksum64    = '998c1a0ce950c890135b993d58834b024e351e274f2d0113ebcababde87ff132beaecdf9ff6d05dcbb649628c5c098f7eeffb088cd1d9750929185dc31d48226'
    checksumType64= 'sha512'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
