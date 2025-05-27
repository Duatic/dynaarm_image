# duatic_docker_image

Starting command:
```
docker run -it --net=host --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --env="XAUTHORITY=/root/.Xauthority" ghcr.io/duatic/duatic_docker_image
```
