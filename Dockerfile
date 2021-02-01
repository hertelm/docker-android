FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
RUN apt-get install unzip
RUN unzip commandlinetools-linux-6858069_latest.zip
RUN apt-get install -y openjdk-8-jre
RUN apt-get install -y --fix-missing android-sdk
ENV PATH=/cmdline-tools/bin:$PATH
ENV SDKROOT=/usr/lib/android-sdk
RUN echo y | sdkmanager --sdk_root=$SDKROOT "platform-tools" "platforms;android-28" "emulator"
RUN echo y | sdkmanager --sdk_root=$SDKROOT "system-images;android-28;google_apis;x86"
RUN apt-get install make
COPY Makefile Makefile
ENV PATH=/usr/lib/android-sdk/emulator:$PATH
RUN cd /usr/lib/android-sdk/emulator && echo no | avdmanager create avd -n Android28 -k "system-images;android-28;google_apis;x86"
CMD emulator -avd Android28

## --- Instructions ---
## Step 1: Build the container
# docker build -t android-test .
## Step 2: Run the container
# docker run --privileged -it -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix android-test

