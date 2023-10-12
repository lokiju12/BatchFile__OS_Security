@echo off

:: 방산 보안 규정 준수를 위한 취약점 해소를 위한 스크립트

:: 기본 공유 설정 해제
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0x0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0x0 /f

:: 기본 공유 삭제
net share C$ /delete
net share D$ /delete
net share ADMIN$ /delete
net share IPC$ /delete

:: 복구 콘솔에서 자동 로그인을 금지
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" /t REG_DWORD /d 0 /f

:: 시스템 속성의 '원격 지원 연결 허용' 해제
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\echoote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f

:: IIS를 비활성화하는 레지스트리 수정
reg add "HKLM\SOFTWARE\Microsoft\IIS\Parameters" /v "Disable" /t REG_DWORD /d 1 /f

:: IIS 웹 서버 비활성화
dism /online /disable-feature /featurename:IIS-WebServer /norestart

:: IIS 관리 도구 비활성화
dism /online /disable-feature /featurename:IIS-ManagementConsole /norestart

:: IIS 웹 서버 - WWW 서비스 비활성화
dism /online /disable-feature /featurename:IIS-WebServer-Role /norestart

:: IIS 웹 서버 - 관리 도구 및 IIS 6 관리 호환성 비활성화
dism /online /disable-feature /featurename:IIS-LegacySnapIn /norestart

:: IIS 웹 서버 - 웹DAV 및 IIS 6 관리 호환성 비활성화
dism /online /disable-feature /featurename:IIS-WebDAV /norestart


