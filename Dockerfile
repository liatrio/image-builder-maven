FROM maven:3.8.6-eclipse-temurin-8-alpine

RUN apk update && apk add git \
			  make \
	       && apk add curl=7.85.0-r0 libcurl=7.85.0-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
	       && rm -rf /var/lib/apt/lists/*
