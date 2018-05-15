## Build & Run
```
docker build -t bfergerson/grakn:1.2.0 .
docker run -it --publish 9160:9160 --publish 4567:4567 --name grakn bfergerson/grakn:1.2.0
```
