FROM nvidia/cuda:12.2.0-runtime-ubuntu20.04

RUN apt-get update -y && apt-get install -y python3.9 python3.9-distutils curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py

WORKDIR /usr/src/Fastchat
COPY . .

RUN pip3 install pydantic==1.10.13
RUN pip3 install -e ".[model_worker,webui]"