Import-VSVars 2017
$env:Platform=""

# Install-Module z -AllowClobber
Import-Module z
#Install-Module posh-git -AllowClobber
Import-Module posh-git



### Development Tools ###
new-item alias:handle -value 'C:\tools\Handle\Handle.exe'
new-item alias:gacutil -value 'C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.1 Tools\gacutil.exe'
new-item alias:installutil -value 'C:\Windows\Microsoft.NET\Framework\v4.0.30319\InstallUtil.exe'
new-item alias:asminfo -value 'C:\tools\AsmInfo.exe'


### Testing tools ###
#new-item alias:opencover -value C:\Users\bacemi\AppData\Local\Apps\OpenCover\OpenCover.Console.exe
new-item alias:mpv -value 'F:\Development\NModel\bin\mpv.exe'
new-item alias:otg -value 'F:\Development\NModel\bin\otg.exe'
new-item alias:mp2dot -value 'F:\Development\NModel\bin\mp2dot.exe'
new-item alias:ct -value 'F:\Development\NModel\bin\ct.exe'

