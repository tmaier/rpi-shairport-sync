# Shairport-sync Docker Container for Raspberry Pi

Run the following command to start the docker container:

```sh
docker run -d \
  --name shairport \
  --net host \
  --device /dev/snd \
  -e AIRPLAY_NAME=Schlafzimmer \
  --restart=always
  tmaier/rpi-shairport-sync
```

## References / Influences

* Uses also alpine linux: https://github.com/patrickse/rpi-shairport-sync
* start.sh: https://github.com/kevineye/docker-shairport-sync
* docker-airplay: https://github.com/amitgandhinz/docker-airplay

