### verify server

```console
cd server
podman build . -t server
podman run --init -p 8888:8888 server
wrk -t1 -c100 -d30s http://127.0.0.1:8888
```