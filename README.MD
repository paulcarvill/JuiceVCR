# JuiceVCR website

## Running Craft locally

* git clone this repo
* git submodule update --recursive --init
* mkdir vagrant/logs
* vagrant up
* phpMyAdmin: http://localhost:9000
* create a database and add connection details to craft/config/db.php
* website: http://localhost:8080/admin
* optionally, import devsitebackup.sql using phpMyAdmin dashboard
* once website has been created or imported, access it at http://localhost:8080

## Front-end development & build
* npm install
* grunt dev - accessible on http://localhost:8000
* grunt build - accessible on http://localhost:8080

## Deploying the site
* cap production deploy