# JdbcMsSql - SIARD 2.2 MS SQL Server JDBC Wrapper

This package contains the JDBC Wrapper for MS SQL Server for SIARD 2.2.

## Getting started (for devs)

A running instance of Microsoft SQL Server is needed to run the tests - start one with:

```shell
docker-compose up -d
```

Run all tests

```shell
./gradlew clean test
```

Create a release

```shell
./gradlew clean build
```

