# docker-plasma5

This Dockerfile will build a plasma5 desktop based on Kubuntu-next repo.

# Try plasma5 beside your current desktop

## Start a second X server

    startx -display :1 -- :1 vt8

* You can change `vt8` with any tty available.
* Also, if your X server is already running on `:1`, increment this value as you want.

## Allow access to your X server

Assuming your new `$DISPLAY` value for this X server instance is `:1` :

    DISPLAY=':1' xhost +

## Run Plasma5 in Docker

    docker build -t plasma5 .

    DISPLAY=':1' docker run \
        --rm=true \
        -e DISPLAY="$DISPLAY" \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        plasma5

Then go to `tty8`, Plasma5 is starting !
