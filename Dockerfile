FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y build-essential unzip wget python3 python3-pip python3-dev \
    python3-distutils xdotool locales kicad xvfb \
    imagemagick librsvg2-bin &&\
    pip3 install --no-compile kibot &&\
    pip3 install PcbDraw scons &&\
    rm -rf /usr/share/doc &&\
    wget https://github.com/spielhuus/sconstool-kicad/archive/refs/heads/main.zip &&\
    unzip main.zip &&\
    mkdir -p /usr/share/scons/site_scons/site_tools &&\
    mv sconstool-kicad-main/kicad /usr/share/scons/site_scons/site_tools &&\
    rm -rf sconstool-kicad-main &&\
    apt-get purge -y build-essential unzip wget python3-pip python3-dev &&\
    apt-get autoremove -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# set locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"

CMD ["/bin/bash"]