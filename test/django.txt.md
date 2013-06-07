# Running Django through Node.js via FastCGI

This is for testing the module, not necessarily a long-term production site.

This process is useful to run a real-world web application, with minimal dependencies. It only needs Python, which is probably already installed.

## Install Django

Clone this project and change to the directory, `cd fastcgi/test`, then run this script

    wget -O Django-1.5.1.tar.gz https://www.djangoproject.com/download/1.5.1/tarball/
    tar xzf Django-1.5.1.tar.gz
    python Django-1.5.1/setup.py install --prefix="$PWD/django"
    export PYTHONPATH="$PWD/django/lib/python2.7/site-packages:$PYTHONPATH"
    wget http://pypi.python.org/packages/source/f/flup/flup-1.0.3.dev-20110405.tar.gz
    easy_install --prefix=/Users/jhs/src/nj/fastcgi/test/django ./flup-1.0.3.dev-20110405.tar.gz

## Create Project

    cd django
    ./bin/django-admin.py startproject testapp

Now edit `testapp/testapp/settings.py` and make these changes:

1. Above the first line, insert `import os`
1. Add `sqlite3` to the value for `'ENGINE'`
1. For `'NAME'` set the value to `os.path.dirname(__file__) + '/db.sql3'`
1. Look for `INSTALLED_APPS` and uncomment `'django.contrib.admin'` and `'django.contrib.admindocs'`

Edit `testapp/testapp/urls.py`:

1. Uncomment the line, `from django.contrib import admin`
1. Uncomment the next line, `admin.autodiscover()`
1. Uncomment both the `admin/doc/` and also `admin/` lines

Run `./testapp/manage.py syncdb` and answer the prompts

1. Create an admin? `yes`
1. Username: `admin`
1. Email address: `nobody@example.com`
1. Password (and confirmation): `admin`

Django should now run via `./testapp/manage.py runserver` and respond to http://localhost:8000/admin. Log in as admin/admin. Remember to kill it when done.

## Run over FastCGI

Change back to this project root.


