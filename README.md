## Testing setup for jackal workspace
## Step 0
Ensure you have docker installed on your local computer, install the devcontainers extension in vscode.

## Step 1
Open desired folder in vscode --> reopen in container and let it build!
- the folder opened will be mounted into the container, changes made here will be reflected to your local device

## Step 2
robot.yaml is stored in root of local directory, therefore must point simulation to correct location
```
ros2 launch clearpath_gz simulation.launch.py setup_path:=/workspaces/jackal_ws
```
Teleop:
```
ros2 run teleop_twist_keyboard teleop_twist_keyboard --ros-args -p stamped:=true -r cmd_vel:=/j100_0000/cmd_vel
```

## Extra
Image used as reference in Dockerfile : https://hub.docker.com/r/osrf/ros/ [https://hub.docker.com/r/osrf/ros/]
