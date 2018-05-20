$packageName= 'keeweb'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/keeweb/keeweb/releases/download/v1.6.0/KeeWeb-1.6.0.win.ia32.exe'
$url64bit   = 'https://github.com/keeweb/keeweb/releases/download/v1.6.0/KeeWeb-1.6.0.win.x64.exe'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    url64bit      = $url64bit

    softwareName  = 'keeweb*'

    checksum      = '17587ac147d791ea873d1717e02d46fb5a3c57750b8496a67e49656bf2a025e0'
    checksumType  = 'sha256'
    checksum64    = '9bfcae5f9a15daa0183425f667d956f20795d9d50da0d34ceac94a0e8319982e'
    checksumType64= 'sha256'

    #NSIS
    silentArgs    = "/S"
    validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
