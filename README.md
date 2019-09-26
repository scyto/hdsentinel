# hdsentinel
This is a docker for use with HDSentinel disk diag program NAS and Linux features https://www.hdsentinel.com/index.php
This container currently only support amd64

This container *MUST* be run in --privlileged mode to have access to disks (aka the container has near-root privileges across all containers and the host).

This is not ideal but there seems to be no other way and is less intrusive to a base NAS (like a Synology) where support gets funny if you mess around too much.  If you know of a way to make this container run unpriviledged please let me know!

For command line folks you will need to run with the following command:

          docker run -name=<yourname> --privileged -v <yoursharedvolume>:/etc/hdsentinel scyto/hdsentinel

Make sure the <yyoursharedvolume> is accesible to the windows machine / user you are running the hdsentinel app on.

ToDo
1. allow passing of variables to the crond logging level 
2. allow passing of variables to the hdsentinel command line
3. figure out how to support arm (the base image used only support amd64 due to lack of glibc on mainline alpine)

Note if you want to attach an interactive tty use /bin/sh (not bash)
