# WSGI service environment

FROM sourcepole/qwc-uwsgi-base:alpine-v2022.01.26

# Required for pip with git repos
RUN apk add --no-cache --update git
# Required for building some python packages
RUN apk add --no-cache --update postgresql-dev g++ python3-dev

# maybe set locale here if needed

ADD . /srv/qwc_service
RUN pip3 install --no-cache-dir -r /srv/qwc_service/requirements.txt

ENV SERVICE_MOUNTPOINT=/qwc_admin
