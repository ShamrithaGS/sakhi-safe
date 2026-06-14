@echo off
echo 🚀 Sakhi-Safe Quick Demo Setup (Windows)
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python not found. Please install Python 3.9+
    exit /b 1
)

echo ✅ Python found
echo.

REM Install ML Engine dependencies
echo 📦 Installing ML Engine dependencies...
cd ml_engine
pip install -r requirements.txt
echo ✅ Dependencies installed
echo.

REM Start ML Engine
echo 🚀 Starting ML Engine on http://localhost:5000...
echo Press Ctrl+C to stop
echo.
python app.py
