# JdbcMsSql - SIARD 2.2 MS SQL Server JDBC Wrapper

This package contains the JDBC Wrapper for MS SQL Server for SIARD 2.2.

## Getting started (for devs)
For building the binaries, Java JDK (1.8 or higher) and Ant must
have been installed. Adjust build.properties to your local configuration

A running instance of Microsoft SQL Server is needed to run the tests - start one with:

```shell
docker-compose up -d
```

Run all tests

```shell
ant test
```

Create a release

```shell
ant release
```

This task increments the version number in the project [MANIFEST.MF](./src/META-INF/MANIFEST.MF)


## Documentation
[./doc/manual/user/index.html](./doc/manual/user/index.html) contains the manual for using the binaries.
[./doc/manual/developer/index.html](./doc/manual/user/index.html) is the manual for developers wishing
build the binaries or work on the code.

More information about the build process can be found in
[./doc/manual/developer/build.html](./doc/manual/developer/build.html)

