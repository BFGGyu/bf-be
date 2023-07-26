FROM python:3.9-alpine
RUN pip3 install Django
WORKDIR /
RUN django-admin startproject config
WORKDIR /config/config/
RUN sed -i 's/ALLOWED_HOSTS = \[]/ALLOWED_HOSTS = \["*"]/g' settings.py
WORKDIR /config
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]