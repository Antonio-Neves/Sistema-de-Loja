# Django Store Management System - Installation Guide

## Installation Steps

### 1. Download Python Manager
https://www.python.org/downloads/


### 2.1 Install Python and Sublime Text

```
py install 3.14
```

### 2.2 Install Python and Sublime Text
https://www.sublimetext.com/


### 2.3 Install PostgreSql and PgAdmin

https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

https://www.pgadmin.org/download/pgadmin-4-windows/


### 3. Change Password in .env file


### 4. Create DB

systemstore_db


### 5. Create and activate virtual environment

    ### GOTO system folder

```
# Create virtual environment
python -m venv .venv

# Activate (Windows)
.venv\Scripts\activate

# Activate (Linux/Mac)
source venv/bin/activate
```

### 6. Install dependencies
```
pip install django pillow waitress whitenoise dj-database-url python-decouple psycopg2-binary 
```

### 7. Change path in file, run_waitress.bat

### 8. Run migrations
```
python manage.py makemigrations
python manage.py migrate

python manage.py collectstatic
```

### 9. collect static files
```
python manage.py collectstatic
```

### 10. Create superuser
```
python manage.py createsuperuser
```

### 10. Create system users

Remember to mark team menber in admin

### 11. Configure NSSM


### 12. Change debug to True

