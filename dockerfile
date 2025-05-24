FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install \
    ffmpeg \
    python3.4
RUN apt-get clean

RUN apt-get -y install \
    python3-pip
RUN apt-get clean
RUN apt-get -y install \
    git
RUN apt-get clean
COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN python3 -m pip install -r requirements.txt

COPY . /app
