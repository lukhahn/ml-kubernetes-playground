APP_NAME = ml-model-api
IMAGE_NAME = $(APP_NAME):latest
KUSTOMIZE_DIR = kubernetes/base

INGRESS_URL = https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml


.PHONY: all train build deploy infer clean

train:
	python train.py

build: train
	docker build -t $(IMAGE_NAME) .

deploy:
	kubectl apply -f $(INGRESS_URL)
	kubectl apply -k $(KUSTOMIZE_DIR)

infer:
	python infer.py

clean:
	kubectl delete namespace ingress-nginx
	kubectl delete -k $(KUSTOMIZE_DIR)
