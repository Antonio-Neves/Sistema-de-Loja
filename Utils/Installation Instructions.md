# Django Store Management System - Installation Guide

## Installation Steps

### 1. Download Python Manager
https://www.python.org/downloads/

### 2. Install Python

```
py install 3.14
```

### 2. Install PostgreSql and PgAdmin

https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

https://www.pgadmin.org/download/pgadmin-4-windows/

### 3. Change Password in .env file

### 4. Create DB

systemstore_db

### 5. Create and activate virtual environment

```
# Create virtual environment
python -m venv venv

# Activate (Windows)
venv\Scripts\activate

# Activate (Linux/Mac)
source venv/bin/activate
```

### 4. Install dependencies
```
pip install django pillow waitress whitenoise dj-database-url python-decouple psycopg2-binary 
```

### 5. Change path in file, run_waitress.bat

### 7. Run migrations
```
python manage.py makemigrations
python manage.py migrate
```

### 8. Create superuser
```
python manage.py createsuperuser
```

### 9. Run development server
```
python manage.py runserver
```