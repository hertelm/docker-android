# docker-android

A Docker container that runs an Android Virtual Device (AVD).

## Instructions

Build the container:

 `docker build -t android-test .`

Allow Xhost access:

 `xhost +local:root`

Start the container:

 `docker run --privileged -it -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix android-test`

After terminating the container, forbid Xhost access:

 `xhost -local:root`

## Install and run an APK

When building your APK, make sure it supports the Android Version of your Virtual Device (currently Android 28).
The requirements can be changed in the build.gradle of your application (look for android - defaultConfig - minSdkVersion).

Adapt the Dockerfile as follows:

1. Add a copy instruction for your APK, e.g. `COPY app-debug.apk .`.
1. Replace the last command in the Dockerfile by `CMD bash`.

Build and start the container, then do:

1. Run `tmux` to open a new terminal.
1. Run `emulator -avd Android28` to start the AVD.
1. Wait until the device is loaded, and run `adb install app-debug.apk` (replace with your apk file) to install the application.
1. You can now use the application in the virtual device (search for it using the Google search bar of the phone).
