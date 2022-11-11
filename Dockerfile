#FROM ubuntu:latest

FROM tiangolo/uwsgi-nginx-flask:latest

# Install requirements
WORKDIR /app
COPY . /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 8000

ENTRYPOINT ["python3"]
CMD ["app.py"]