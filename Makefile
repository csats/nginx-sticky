
.PHONY: nginx container push

all: nginx container push

nginx: .
	docker run -it -v $(PWD):/host debian:jessie /host/build-nginx.sh

container: .
	docker build -t docker.io/csats/nginx-sticky .

push: .
	docker push docker.io/csats/nginx-sticky:latest
