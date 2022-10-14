IMAGE_NAME=kbarszczyk/keycloak_prebuilt_example
IMAGE_VERSION=0.0.5

build:
		docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .
		docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):latest

push:
		docker push $(IMAGE_NAME):$(IMAGE_VERSION)
		docker push $(IMAGE_NAME):latest
