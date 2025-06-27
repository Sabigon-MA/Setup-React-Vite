@echo off
chcp 65001

:: PowerShell スクリプトのパス
set scriptPath=%~dp0Create-ReactVite.ps1

:: 実行
powershell -NoProfile -ExecutionPolicy Bypass -File "%scriptPath%"

pause
