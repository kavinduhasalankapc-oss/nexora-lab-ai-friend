@echo off
setlocal
where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter SDK was not found. Install Flutter and add it to PATH first.
  pause
  exit /b 1
)
if "%NEXORA_API_URL%"=="" (
  echo Set NEXORA_API_URL to your deployed HTTPS backend URL first.
  echo Example: set NEXORA_API_URL=https://your-backend-domain
  pause
  exit /b 1
)
call flutter create . --platforms=android
if errorlevel 1 goto fail
call flutter pub get
if errorlevel 1 goto fail
call flutter build apk --release --dart-define=NEXORA_API_URL=%NEXORA_API_URL%
if errorlevel 1 goto fail
echo.
echo APK created at build\app\outputs\flutter-apk\app-release.apk
pause
exit /b 0
:fail
echo Build failed. Check Flutter/Android SDK setup and the error above.
pause
exit /b 1
