@echo off
REM Script to start the Django project on Windows

REM --- 1. Activate the Virtual Environment ---
REM The 'venv' folder should be at the root of the project
REM The activation script is at venv\Scripts\activate.bat
echo Activating Virtual Environment...
call .venv\Scripts\activate.bat

REM --- 2. Check Activation Status ---
if exist .venv\Scripts\activate.bat (
    echo Virtual Environment Activated.
) else (
    echo ERROR: Virtual Environment not found at .venv/Scripts. Did you create it?
    goto end
)

REM --- 3. Run the Django Server ---
echo Starting Django Development Server...
REM manage.py is expected to be in the same folder as this script
python manage.py runserver

REM --- 4. Deactivate (optional, but good practice) ---
:end
echo Server stopped. Deactivating Virtual Environment...
deactivate

pause