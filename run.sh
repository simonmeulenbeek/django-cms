#!/bin/bash

read -p "Project Name: " projectname
djangocms -w -f -p ./app $projectname
python manage.py runserver 0.0.0.0:8000
