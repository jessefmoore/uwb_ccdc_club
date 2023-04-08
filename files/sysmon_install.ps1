# CyberForce 2023 
# dfir-jesseee
#
#
# this needs to be in the FILE folder
#
#
# 
#cmd /K "Powershell.exe Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.10-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.10.msi; msiexec.exe /i ${env:tmp}\wazuh-agent-4.3.10.msi /q WAZUH_MANAGER='192.168.0.46' WAZUH_REGISTRATION_SERVER='192.168.0.46' WAZUH_AGENT_GROUP='default'"
#cmd /K "powershell.exe sleep 10"
#cmd /K "powershell.exe start-service WazuhSvc"
# 10-02-2021 DFIR-Jesseee
# For CyberForce 2021
# Reference https://textkool.com/en/ascii-art-generator?hl=default&vl=default&font=Red%20Phoenix&text=Install%20Sysmon
#
#
#$ASCII = @"
# .___                   __           .__   .__         _________
#|   |  ____    _______/  |_ _____   |  |  |  |       /   _____/___.__.  ______  _____    ____    ____
#|   | /    \  /  ___/\   __\\__  \  |  |  |  |       \_____  \<   |  | /  ___/ /     \  /  _ \  /    \
#|   ||   |  \ \___ \  |  |   / __ \_|  |__|  |__     /        \\___  | \___ \ |  Y Y  \(  <_> )|   |  \
#|___||___|  //____  > |__|  (____  /|____/|____/    /_______  // ____|/____  >|__|_|  / \____/ |___|  /
#          \/      \/             \/                         \/ \/          \/       \/              \/
#                                                                                                        By DFIR-Jesseee
#"@
#
#
#$ASCII

#Iif you can't get the script to run do the Bypasss below
Set-ExecutionPolicy -Scope CurrentUser Bypass -Force
#
Invoke-WebRequest https://github.com/olafhartong/sysmon-modular/archive/refs/heads/master.zip -OutFile "$env:tmp/Sysmon-Mod.zip" -ErrorAction SilentlyContinue
Expand-Archive -LiteralPath $env:tmp\Sysmon-Mod.zip -DestinationPath $env:tmp -ErrorAction SilentlyContinue
cd $env:tmp/sysmon-modular-master
Invoke-WebRequest https://live.sysinternals.com/Sysmon64.exe -OutFile "$env:tmp/sysmon-modular-master/sysmon.exe" -ErrorAction SilentlyContinue
. .\Merge-SysmonXml.ps1
Merge-AllSysmonXml -Path ( Get-ChildItem '[0-9]*\*.xml') -AsString | Out-File sysmonconfig.xml
./sysmon.exe -accepteula -i sysmonconfig.xml
