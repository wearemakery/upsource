# Upsource Docker

This image contains Jetbrains [Upsource](https://www.jetbrains.com/upsource/). It's based on [openSUSE](https://hub.docker.com/_/opensuse/).

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
  -e "HOSTNAME=<hostname>" \
  --name upsource wearemakery/upsource
```
