@echo off
setlocal enabledelayedexpansion

:: ��� Python �Ƿ����
python --version >nul 2>&1
if errorlevel 1 (
    echo [����] δ��⵽ Python����ȷ���Ѱ�װ����ӵ�����������
    exit /b 1
)

:: ��ȡ��Ŀ�ļ������ƣ�����Ϊ��
:input_folder
set /p folder_name=������Ҫ��������Ŀ�ļ�������: 
if "!folder_name!"=="" (
    echo [����] ��Ч�ַ������������롣
    goto input_folder
)

:: ������ĿĿ¼���粻���ڣ�
if not exist "%folder_name%" (
    mkdir "%folder_name%"
)

cd /d "%folder_name%"

:: ��ȡ���⻷�����ƣ�����Ϊ��
:input_venv
set /p venv_name=���������⻷������: 
if "!venv_name!"=="" (
    echo [����] ��Ч�ַ������������롣
    goto input_venv
)

:: �������⻷��
python -m venv "%venv_name%"

:: �������⻷��������ɹ���
if exist "%venv_name%\Scripts\activate.bat" (
    call "%venv_name%\Scripts\activate.bat"
)

:: �Զ��رմ���
exit
