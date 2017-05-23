# Time-of-Day (TOD) RFC868 server

[![Build Status](https://travis-ci.org/egorse/tod-server.svg?branch=master)](https://travis-ci.org/egorse/tod-server)

Trivial UDP only Time-of-Day (TOD) RFC868 server.
By default listen to 37/UDP.

You may build docker container by ```docker build -t tod-server:local .```
and run by ```docker run -p 37:37/udp tod-server:local```.

In more complex setup just bring in the interface as by default server listen
on all interfaces.

See also https://hub.docker.com/r/egorse/tod-server/
