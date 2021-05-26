FROM alpine:latest

RUN \
   apk add \
   curl \
   python3 \
   py3-pip \
   py3-boto \
   py3-dateutil \
   py3-httplib2 \
   py3-jinja2 \
   py3-paramiko \
   py3-setuptools \
   py3-yaml \
   openssh-client \
   bash \
   zip \
   tar 

RUN  cd /usr/local/bin && \
   ln -s /usr/bin/python3 python && \
   pip3 install --upgrade pip

RUN mkdir /etc/ansible /ansible
RUN mkdir ~/.ssh

# Over rides SSH Hosts Checking
RUN echo "host *" >> ~/.ssh/config &&\
    echo "StrictHostKeyChecking no" >> ~/.ssh/config

RUN \
  curl -fsSL https://releases.ansible.com/ansible/ansible-latest.tar.gz -o ansible.tar.gz

RUN \
  tar -xzf ansible.tar.gz -C ansible --strip-components 1 && \
  rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

RUN \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

RUN \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -fr awscliv2.zip

# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PATH /ansible/bin:$PATH
ENV PYTHONPATH /ansible/lib


