docker-scribe
=============

Docker image for Scribe.

Scribe is no longer supported so it's hard to keep newest OS support.

Setup:

```git clone git@github.com:jakon89/docker-scribe.git```
```cd docker-scribe```
```docker build -t scribe .```
```docker run -it -d -p 1463:1463 scribe bin/bash```

At this point Scribe is available on port 1463.
Logs files are rotated every minute to /var/lib/scribe/
