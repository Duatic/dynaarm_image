# duatic_docker_image

## Start docker container

```
docker run -it --net=host --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --env="XAUTHORITY=/root/.Xauthority" ghcr.io/duatic/duatic_docker_image
```

## Usage

### Mock Mode

To start the robot with mocked hardware, run:

```bash
ros2 launch dynaarm_single_example mock.launch.py
```

### Real Hardware

To start the robot with real hardware, run:

```bash
ros2 launch dynaarm_single_example real.launch.py ethercat_bus:=YOUR INTERFACE NAME HER
```


