#
# Dockerfile for Production
#

# the base image for this is an alpine based nginx image
FROM nginx:alpine

RUN apk update && apk add openssl
RUN apk add --no-cache py-pip curl \
    && apk add --virtual=build sudo tar bash \
    gcc libffi-dev musl-dev openssl-dev make python3-dev \
    && pip install wheel \
    && pip install azure-cli==2.19.1 \
    && apk del --purge build
