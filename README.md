# restful-api-python-flask
### Build and run docker container with Flask RESTful API

Change directory `cd restful-api-python-flask`

To check locally before building docker, run 
``` 
pip3 install -r requirements.txt
python3 app.py
```

Build image `docker build -t restful-api .` 
  
Run container in detached mode and publish port 5000 `docker run -d -p 5000:5000 restful-api`
  
API should be accessible on port 5000 `curl -i localhost:5000/api/v1.0/get_ndays/MSFT/5`
