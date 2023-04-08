# WRCCDC 2021 
# dfir-jesseee
#
# The 192.168.0.46 is the Wazuh Manager Server
#
# this needs to be in the FILE folder
#
#
#[blackteam@ansible files]$ cat invoke_win_Wazuh_agent.ps1 
cmd /K "Powershell.exe Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.10-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.10.msi; msiexec.exe /i ${env:tmp}\wazuh-agent-4.3.10.msi /q WAZUH_MANAGER='192.168.0.46' WAZUH_REGISTRATION_SERVER='192.168.0.46' WAZUH_AGENT_GROUP='default'"
cmd /K "powershell.exe sleep 10"
cmd /K "powershell.exe start-service WazuhSvc"

