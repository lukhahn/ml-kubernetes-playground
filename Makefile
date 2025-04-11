APP_NAME = ml-model-api
IMAGE_NAME = $(APP_NAME):latest
KUSTOMIZE_DIR = kubernetes/base

.PHONY: all train build deploy infer clean

train:
	python train.py

build: train
	docker build -t $(IMAGE_NAME) .

deploy:
	kubectl apply -k $(KUSTOMIZE_DIR)

infer:
	python infer.py

clean:
	kubectl delete -k $(KUSTOMIZE_DIR)
