FROM debian:buster

WORKDIR /godot

# Change apt-get branch to testing as mingw-w64 v8 is needed
RUN echo 'deb http://deb.debian.org/debian testing main' >> /etc/apt/sources.list

RUN apt update -y
RUN apt install -y gcc

RUN apt install -y mingw-w64 python3 python3-pip
RUN pip3 install scons


COPY . .

#CMD ["scons","-j6 platform=windows tools=yes target=release_debug bits=64"gcc]






