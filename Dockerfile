FROM python:3.12-slim

LABEL org.opencontainers.image.source=https://github.com/Arpit1033/Django-Blog-CMS.git

WORKDIR /home/app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

WORKDIR /home/app/django_project

RUN python manage.py collectstatic --noinput

CMD ["gunicorn", "django_project.wsgi:application", "--bind", "0.0.0.0:8000"]