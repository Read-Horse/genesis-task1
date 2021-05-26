FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN apt install -y \
    gnupg \
    software-properties-common \
    curl \
    wget \
    tar \
    mc \
    unzip && \
    apt clean

RUN \
  wget https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip

RUN \
  unzip terraform_0.15.4_linux_amd64.zip  && \
  rm -fr terraform_0.15.4_linux_amd64.zip && \
  mv terraform /usr/local/bin && \
  mkdir /terraform

RUN \
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -fr awscliv2.zip

WORKDIR /terraform

