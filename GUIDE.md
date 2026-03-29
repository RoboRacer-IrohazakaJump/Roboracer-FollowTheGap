# Running the Algorithm Code
## Environment Setup
1. First, you need to pull [AutoDRIVE Simulator docker image](https://hub.docker.com/r/autodriveecosystem/autodrive_roboracer_sim) from DockerHub
```
docker pull autodriveecosystem/autodrive_roboracer_sim:2025-cdc-tf-practice
```
2. Next, you need to pull [AutoDRIVE Devkit docker image](https://hub.docker.com/r/autodriveecosystem/autodrive_roboracer_api) from DockerHub (or you can try using our docker image)
```
# Using AutoDRIVE Devkit docker image
docker pull autodriveecosystem/autodrive_roboracer_api:2025-cdc-tf-practice
# Our submitted docker image
docker pull hatsuharuyasa/autodrive_submission:phase-1
```
## Container Execution
1. Enable display forwarding for simulator, and run the simulator container at `entrypoint`
```
xhost local:root
docker run --name autodrive_roboracer_sim --rm -it --entrypoint /bin/bash --network=host --ipc=host -v /tmp/.X11-unix:/tmp.X11-umix:rw --env DISPLAY --privileged --gpus all autodriveecosystem/autodrive_roboracer_sim:2025-cdc-tf-practice
```
3. Enable display forwarding for devkit, and run the devkit container at `entrypoint`
```
xhost local:root
docker run --name autodrive_roboracer_api --rm -it --entrypoint /bin/bash --network=host --ipc=host -v /tmp/.X11-unix:/tmp.X11-umix:rw --env DISPLAY --privileged --gpus all hatsuharuyasa/autodrive_submission:phase-1
```
## GUI Mode Opeartions
1. Launch AutoDRIVE Simulator in `graphics` mode (camera rendering will be enabled)
```
./AutoDRIVE\ Simulator.x86_64
```
3. Launch AutoDRIVE Devkit in `graphics` mode (RViz rendering will be enabled)
```
ros2 launch autodrive_roboracer bringup_graphics.launch.py
```
If you run both containers on the same machine, just hit the `connection` button in the simulator GUI menu panel, then the status next to it will become `Connected!`. Once the connection has been established, you can choose between `Manual` and `Autonomous` driving modes for the `Driving Mode`.
