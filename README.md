# docker-kicad-ci

[Docker](https://docker.io/) recipe for [sconstool-kikad](https://github.com/spielhuus/sconstool-kicad) project

### Create an image 

```
docker pull ghcr.io/spielhuus/docker-kicad-ci:main
docker run --name docker-kicad-ci -itd \
           -v /PROJECT_HOME:/workspace \
           ghcr.io/spielhuus/docker-kicad-ci:main
```

### Usage

This image can be used to create your own images which include necessary dependencies.

Try the base image within the running container:

```bash
cd /workspace
scons
```

### Credits:

* https://docker.io

### License 

[Boost Software License](http://www.boost.org/LICENSE_1_0.txt) - Version 1.0 - August 17th, 2003


