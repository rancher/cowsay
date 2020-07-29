run: image
	docker run --rm rancher/cowsay Howdy

image:
	docker build -t rancher/cowsay .

push: image
	docker push rancher/cowsay
