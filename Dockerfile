#FROM ubuntu:latest



FROM ubuntu:latest
RUN apt-get update

RUN apt-get install -y -q build-essential python3-pip python3-dev python-simplejson git
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade virtualenv

EXPOSE 5000
EXPOSE 80

RUN mkdir deployment
RUN git clone https://github.com/drunkenmonkey1988/forgerock.git /deployment/
RUN virtualenv /deployment/env/
#RUN /deployment/env/bin/pip install flask
WORKDIR /deployment
RUN pip3 install --no-cache-dir -r requirements.txt
CMD env/bin/python app.py

#FROM python:3.8-slim-buster
#FROM ubuntu:20.04
#RUN apt-get update && apt-get install -y -q build-essential python3-pip python3-dev
#RUN pip install --upgrade pip

#EXPOSE 5000
#EXPOSE 80
#WORKDIR C:\DevOPS\ForgeRock\forgerock


#COPY requirements.txt requirements.txt
#RUN pip install --no-cache-dir -r requirements.txt
#COPY . .
#CMD [ "python app.py", "-m" , "flask", "run", "--host=0.0.0.0" ,]