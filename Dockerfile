FROM maven:3.8.6-jdk-8

RUN apt-get update && \
    apt-get install -y \
		git \
		curl \
		make && \
    rm -rf /var/lib/apt/lists/*

