# restful-api-python-flask
### Build and run docker container with Flask RESTful API

Change directory `cd restful-api-python-flask`

To check locally before building docker, run 
``` 
pip3 install -r requirements.txt
python3 app.py
```

Build image `docker build -t restful-api2 .` 
  
Run container in detached mode and publish port 8000 `docker run -d -p 8000:8000 restful-api2`
  
API should be accessible on port 8000 `curl -i localhost:8000/api/v1.0/get_ndays/MSFT/5`from within the docker container
We can connect to docker container once it's launched using this command 'docker exec -it container_name /bin/bash"  and above curl command should be able to pull the API

If we are deploying this application in the Minikube , 
Minikube must be installed in local and can be started up using the following commands:

- Minikube start
- Minikube dashboard 
Minikube GUI lives off on 127.0.0.1 - "http://127.0.0.1:55727/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/" and this is where we will be hosting our application 

Application URL - "http://127.0.0.1:8000/api/v1.0/get_ndays/MSFT/5"
to be able to visit the page - port forwarding needs to be enabled from Kubectl 
"kubectl port-forward deploy/restfulapideployment -n default 8000:8000"

Also to add an ingress service and deploy, i can achieve this in public cloud domain with a public IP assigned to K8 pods. 


