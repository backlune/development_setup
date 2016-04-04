import-module icore.dev
new-item alias:handle -value 'H:\My Dev Tools\Handle\Handle.exe'
new-item alias:icore-admin -value F:\ETWork\Bin\Admin.exe
new-item alias:icore-runcomp -value F:\ETWork\Bin\RunCompTool.exe
new-item alias:icore-wf -value F:\ETWork\Bin\WorkflowDesigner.exe
new-item alias:icore-dev -value F:\ETWork\Bin\Editor.exe
#new-item alias:opencover -value C:\Users\bacemi\AppData\Local\Apps\OpenCover\OpenCover.Console.exe
new-item alias:mpv -value 'F:\Development\NModel\bin\mpv.exe'
new-item alias:otg -value 'F:\Development\NModel\bin\otg.exe'
new-item alias:mp2dot -value 'F:\Development\NModel\bin\mp2dot.exe'
new-item alias:ct -value 'F:\Development\NModel\bin\ct.exe'
new-item alias:gacutil -value 'C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6 Tools\gacutil.exe'
new-item alias:installutil -value 'C:\Windows\Microsoft.NET\Framework\v4.0.30319\InstallUtil.exe'

function Start-iCoreServer { Start-Service (Get-Service "iCoreMgmtSvc") }
New-Alias -Name icore-start -Value Start-iCoreServer

function Stop-iCoreServer { Stop-Service (Get-Service "iCoreMgmtSvc") }
New-Alias -Name icore-stop -Value Stop-iCoreServer