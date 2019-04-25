FROM node:8.12-alpine

# Install python
RUN apk --no-cache add python3 python3-dev ca-certificates bash && \
    apk add --no-cache gcc musl-dev && \
    update-ca-certificates && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

# Install glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    apk add --no-cache glibc-2.25-r0.apk && \
    rm -f glibc-2.25-r0.apk

ENV STAGE docker
WORKDIR /opt/app

# Install NPM dependencies
COPY package.json .
RUN npm i

# Install pip dependencies
COPY requirements.txt .
RUN pip3 install --upgrade pip && \
    apk add --no-cache --virtual .build-deps &&\
    pip3 install -r requirements.txt && \
    apk --purge del .build-deps

# Install test pip dependencies
COPY tests/requirements.txt tests/
RUN pip3 install -r tests/requirements.txt

COPY tests tests/
COPY tox.ini .
COPY .pylintrc .
COPY .flake8 .

COPY serverless.yml .
COPY apps apps/

COPY docker/run-tests.sh /
RUN chmod +x /run-tests.sh

CMD ["npm", "run", "start"]
