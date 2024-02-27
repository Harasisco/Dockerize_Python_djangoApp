FROM python:3.11

COPY requirements.txt requirements.txt  
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /code
COPY . .

EXPOSE 8000

CMD ["python3", "mysite/manage.py", "runserver", "0.0.0.0:8000"]
