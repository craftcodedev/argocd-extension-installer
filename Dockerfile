FROM alpine:3.18.4

ARG USER=ext-installer
ENV HOME /home/$USER

RUN apk update && apk add file curl
RUN apk add --update bash

RUN adduser -D $USER
USER $USER
WORKDIR $HOME

ADD install.sh .

RUN chmod +x install.sh

ENTRYPOINT ["./install.sh"]