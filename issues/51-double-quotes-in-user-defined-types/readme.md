# about

steps and data to reproduce the reported issue (https://github.com/sfa-siard/SiardGui/issues/50)

## database setup

```shell
docker-compose up -d --build
```

See build.properties for connection details

Trying to download the database with SIARD-GUI-2.2.12 fails as described by user snfs-seifert