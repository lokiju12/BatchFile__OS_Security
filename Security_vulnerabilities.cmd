@echo off

:: ��� ���� ���� �ؼ��� ���� ����� �ؼҸ� ���� ��ũ��Ʈ

:: �⺻ ���� ���� ����
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0x0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0x0 /f

:: �⺻ ���� ����
net share C$ /delete
net share D$ /delete
net share ADMIN$ /delete
net share IPC$ /delete

:: ���� �ֿܼ��� �ڵ� �α����� ����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" /t REG_DWORD /d 0 /f

:: �ý��� �Ӽ��� '���� ���� ���� ���' ����
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\echoote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f

:: IIS�� ��Ȱ��ȭ�ϴ� ������Ʈ�� ����
reg add "HKLM\SOFTWARE\Microsoft\IIS\Parameters" /v "Disable" /t REG_DWORD /d 1 /f

:: IIS �� ���� ��Ȱ��ȭ
dism /online /disable-feature /featurename:IIS-WebServer /norestart

:: IIS ���� ���� ��Ȱ��ȭ
dism /online /disable-feature /featurename:IIS-ManagementConsole /norestart

:: IIS �� ���� - WWW ���� ��Ȱ��ȭ
dism /online /disable-feature /featurename:IIS-WebServer-Role /norestart

:: IIS �� ���� - ���� ���� �� IIS 6 ���� ȣȯ�� ��Ȱ��ȭ
dism /online /disable-feature /featurename:IIS-LegacySnapIn /norestart

:: IIS �� ���� - ��DAV �� IIS 6 ���� ȣȯ�� ��Ȱ��ȭ
dism /online /disable-feature /featurename:IIS-WebDAV /norestart


