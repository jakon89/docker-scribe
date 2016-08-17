docker-scribe
=============

Docker image(based on Ubuntu 12.04) for Scribe.

Setup:

```git clone git@github.com:jakon89/docker-scribe.git```  
```cd docker-scribe```  
```docker build -t scribe .```  
```docker run -it -d -p 1463:1463 scribe bin/bash```  

At this point Scribe is available on port 1463 from host.  
Logs files are rotated every minute to /var/lib/scribe/
