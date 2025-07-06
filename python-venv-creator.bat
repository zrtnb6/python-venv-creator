@echo off
setlocal enabledelayedexpansion

:: 检查 Python 是否可用
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到 Python，请确保已安装并添加到环境变量。
    exit /b 1
)

:: 获取项目文件夹名称，不能为空
:input_folder
set /p folder_name=请输入要创建的项目文件夹名称: 
if "!folder_name!"=="" (
    echo [错误] 无效字符，请重新输入。
    goto input_folder
)

:: 创建项目目录（如不存在）
if not exist "%folder_name%" (
    mkdir "%folder_name%"
)

cd /d "%folder_name%"

:: 获取虚拟环境名称，不能为空
:input_venv
set /p venv_name=请输入虚拟环境名称: 
if "!venv_name!"=="" (
    echo [错误] 无效字符，请重新输入。
    goto input_venv
)

:: 创建虚拟环境
python -m venv "%venv_name%"

:: 激活虚拟环境（如果成功）
if exist "%venv_name%\Scripts\activate.bat" (
    call "%venv_name%\Scripts\activate.bat"
)

:: 自动关闭窗口
exit
