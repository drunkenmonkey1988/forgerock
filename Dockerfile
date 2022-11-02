#FROM ubuntu:latest
#RUN apt-get update
#RUN apt-get install -y -q build-essential python-pip python-dev python-simplejson git
#RUN pip install --upgrade pip
#RUN pip install --upgrade virtualenv
#RUN mkdir deployment
#RUN git clone https://github.com/maciejd/restful-api-python-flask.git /deployment/
#RUN virtualenv /deployment/env/

#RUN /deployment/env/bin/pip install flask
#WORKDIR /deployment
#CMD env/bin/python app.py


FROM python:3.8-slim-buster
FROM ubuntu:latest
EXPOSE port:5000
EXPOSE port:80
WORKDIR /restful-api-python-flask

COPY restful-api-python-flask/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]