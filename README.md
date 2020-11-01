# todo-on-rails

A simple TODO api written on Ruby on rails with Docker and Kubernetes

## Requirements

- Docker (`19.03.13`)
- Docker Compose (`1.27.4`)
- Kubernetes (`1.18.8`)

## Development Mode

Build Docker image using:

```bash
$ docker-compose build api
```

Run the application:

```bash
$ docker-compose up
```

Run pending migrations

```bash
docker exec -it todo-api rails db:migrate
```

Then access the application at `http://localhost:3000`

## Kubernetes

### Services

```bash
# Postgresql Service
kubectl create -f kube/services/postgres.service.yml

# Rails TODO api service
kubectl create -f kube/services/api.service.yml
```

### Deployments

```bash
# Postgres Deployment
kubectl create -f kube/deployment/postgres.deploy.yml

# Rails TODO api Deployment
kubectl create -f kube/deployment/api.deploy.yml
```

### Ingress

```bash
kubectl create -f kube/ingresses/ingress.yml
```

**Note:** 

If your are running Kubernetes on localhost / Docker for Desktop / WSL2 , setup ingress nginx controller:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml
```

Also, update your hosts (`etc/hosts`) with following:

```
127.0.0.1 todo.local
```

And then access the app via: http://todo.lcoal
