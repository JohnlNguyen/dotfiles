FROM ubuntu:19.04

RUN apt-get update
RUN apt-get install -y build-essential

ADD . .

CMD make install
CMD make show-os