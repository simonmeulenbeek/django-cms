# Select langage python on debian buster
FROM python:3.7.6-buster

MAINTAINER Etienne Merenda

# Avoid some complication
ENV PYHTONUNBUFFERED 1

RUN apt-get update

# Add some packages for Pillow
RUN apt-get install libxml2-dev libxslt-dev libffi-dev gcc curl
RUN apt-get install tk-dev tcl-dev

# Create app folder
RUN mkdir /app
WORKDIR /app

# Copy app directory in app container
COPY ./app /app

# Add requirements
COPY ./requirements.txt app/requirements.txt

# install requirements
RUN pip install --no-cache-dir -r app/requirements.txt

# Add script in app folder
ADD https://raw.githubusercontent.com/EtienneMerenda/django-cms/dockerbuild/run.sh /app

# Execute the script
CMD sh /app/run.sh

# Create user for more security on app
# RUN adduser --disabled-password --quiet user
# USER user
