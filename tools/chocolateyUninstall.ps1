$packageName = 'keeweb'
$softwareName = 'keeweb*'
$installerType = 'exe'  

$silentArgs = '/S'
# Seems weird, but actually the uninstaller always returns 2 as exit code 
$validExitCodes = @(2)

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
    $key | % { 
        $file = "$($_.UninstallString)"

        # We still get a warning that the script may not find the uninstaller and advises us to use full path executables, while this is clearly what we are doing here.
        # This seems to be due to this line https://goo.gl/uZWyMq but I don't understand while they are checking against msiexec while this is a simple NSIS exe uninstaller.
        Uninstall-ChocolateyPackage -PackageName $packageName `
                                    -FileType $installerType `
                                    -SilentArgs "$silentArgs" `
                                    -ValidExitCodes $validExitCodes `
                                    -File "$file"
    }
} elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
    Write-Warning "$key.Count matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer the following keys were matched:"
    $key | % {Write-Warning "- $_.DisplayName"}
}
