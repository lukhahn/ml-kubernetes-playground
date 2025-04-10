APP_NAME = ml-model-api
IMAGE_NAME = $(APP_NAME):latest
DEPLOYMENT_FILE = k8s-deployment.yaml

.PHONY: all train build deploy infer clean

train:
	python train.py

build: train
	docker build -t $(IMAGE_NAME) .

deploy:
	kubectl apply -f $(DEPLOYMENT_FILE)

infer:
	python infer.py

clean:
	kubectl delete -f $(DEPLOYMENT_FILE)
