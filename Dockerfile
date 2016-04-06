FROM opensuse

MAINTAINER Gyula Voros <gyulavoros87@gmail.com>

ENV UPSOURCE_VERSION 3.0.4237

VOLUME ["/opt/Upsource/conf", "/opt/Upsource/data", "/opt/Upsource/logs", "/opt/Upsource/backups"]

RUN zypper -n in hostname unzip wget \
  && wget --no-check-certificate -q -P /opt/ https://download.jetbrains.com/upsource/upsource-$UPSOURCE_VERSION.zip \
  && unzip -q -d /opt/ /opt/upsource-$UPSOURCE_VERSION.zip \
  && rm -rf /opt/upsource-$UPSOURCE_VERSION.zip \
  && cd /opt/Upsource/internal/java \
  && rm -rf mac-x64 windows-amd64 \
  && zypper -n rm unzip wget \
  && zypper clean

RUN echo "* - memlock unlimited" >> /etc/security/limits.conf \
  && echo "* - nofile 100000" >> /etc/security/limits.conf \
  && echo "* - nproc 32768" >> /etc/security/limits.conf \
  && echo "* - as unlimited" >> /etc/security/limits.conf

EXPOSE 8080
WORKDIR /opt/Upsource
CMD ["sh", "-c", "bin/upsource.sh configure --listen-port 8080 --base-url $BASE_URL ; bin/upsource.sh run"]
