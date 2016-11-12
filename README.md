# Upsource Docker

This image contains Jetbrains [Upsource](https://www.jetbrains.com/upsource/). It's based on [Zulu](https://hub.docker.com/r/azul/zulu-openjdk-debian/).

# Usage

```
docker create --name upsource-data \
  -v /opt/Upsource/conf \
  -v /opt/Upsource/data \
  -v /opt/Upsource/logs \
  -v /opt/Upsource/backups \
  busybox /bin/true
```

```
docker run -d \
  --volumes-from upsource-data \
  -p 8080:8080 \
  --name upsource wearemakery/upsource
```
