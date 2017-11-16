import-module icore.dev
Import-VSVars 2017
$env:Platform=""

# Install-Module z -AllowClobber
Import-Module z
#Install-Module posh-git -AllowClobber
Import-Module posh-git

new-item alias:handle -value 'H:\My Dev Tools\Handle\Handle.exe'
new-item alias:icore-admin -value F:\ETWork\Bin\Admin.exe
new-item alias:icore-runcomp -value F:\ETWork\Bin\RunCompTool.exe
new-item alias:icore-wf -value F:\ETWork\Bin\WorkflowDesigner.exe
new-item alias:icore-dev -value F:\ETWork\Bin\Editor.exe
new-item alias:icore-api -value F:\ETWork\Bin\WebAPIEditor.exe
new-item alias:icore-sin -value F:\ETWork\Bin\Tests\SInTEST.exe
#new-item alias:opencover -value C:\Users\bacemi\AppData\Local\Apps\OpenCover\OpenCover.Console.exe
new-item alias:mpv -value 'F:\Development\NModel\bin\mpv.exe'
new-item alias:otg -value 'F:\Development\NModel\bin\otg.exe'
new-item alias:mp2dot -value 'F:\Development\NModel\bin\mp2dot.exe'
new-item alias:ct -value 'F:\Development\NModel\bin\ct.exe'
new-item alias:gacutil -value 'C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6 Tools\gacutil.exe'
new-item alias:installutil -value 'C:\Windows\Microsoft.NET\Framework\v4.0.30319\InstallUtil.exe'

function Start-iCoreServer { Start-Service (Get-Service "iCoreMgmtSvc") }
function Stop-iCoreServer { Stop-Service (Get-Service "iCoreMgmtSvc") }

function Start-SAS{ Start-Service (Get-Service "iCoreSASvc") }
function Stop-SAS { Stop-Service (Get-Service "iCoreSASvc") }

function Start-iCore { 
	Start-Service (Get-Service "iCoreMgmtSvc") 
	Start-Service (Get-Service "iCoreSASvc")
}

function Stop-iCore 
{ 
	Stop-Service (Get-Service "iCoreSASvc") 
	Stop-Service (Get-Service "iCoreMgmtSvc")
}


function Clear-iCoreReg { 
	Find-iCoreComRegistrations | Tee-Object -Variable reg
 
	$reg | Foreach-Object { $_.RegistryKey } | Remove-Item -Force -Recurse 
}
New-Alias -Name icore-clearreg -Value Clear-iCoreReg

function Fix-iCoreJuncation{
	$Branch = Select-iCoreBranch

	Update-iCoreJunctions $Branch -Force
}
New-Alias -Name icore-fixjuncation -Value Fix-iCoreJuncation

function ServicingToMain { Switch-iCoreBranch -CurrentBranchName Servicing.4.00 -TargetBranchName Main -Force }
function ServicingToHotfix { Switch-iCoreBranch -CurrentBranchName Servicing.4.00 -TargetBranchName Hotfix.4.00.0 -Force }
function MainToServicing { Switch-iCoreBranch -CurrentBranchName Main -TargetBranchName Servicing.4.00 -Force }
function MainToHotfix { Switch-iCoreBranch -CurrentBranchName Main -TargetBranchName Hotfix.4.00.0 -Force }
function HotfixToServicing { Switch-iCoreBranch -CurrentBranchName Hotfix.4.00.0 -TargetBranchName Servicing.4.00 -Force }
function HotfixToMain { Switch-iCoreBranch -CurrentBranchName Hotfix.4.00.0 -TargetBranchName Main -Force }

function Which-iCoreBranch { Get-Item 'F:\ETWork\Bin\Project Templates\' | Select-Object -ExpandProperty Target }