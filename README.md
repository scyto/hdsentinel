# docker-hdsentinel
This is a docker for use with HDSentinel disk diag program NAS features https://www.hdsentinel.com/index.php

This container *MUST* be run in --privlileged mode to have access to disks.

This is not ideal but there seems to be no other way and is less intrusive to a base NAS (like a Synology) where support gets funny if you mess around too much.  If you know of a way to make this container run unpriviledged please let me know!

For command line folks you will need to run with the following command:

          docker run -name=<yourname> --priveleged -v <yoursharedvolume>:/etc/hdsentinel scyto/hdsentinel
          
ToDo
1. allow passing of variables to the crond logging level 
2. allow passing of variables to the hdsentinel command line

Note if you want to attach an interactive tty use /bin/sh (not bash)
