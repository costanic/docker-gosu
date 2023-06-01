#!/bin/bash

# exit on error
set -e

# set the internal docker user's uid to be the same as
# the group-id of the local directory
if [ "$(id -u)" = "0" ]; then
    # get the group id of the local directory
    LOCALDIR_GID=$(stat -c %g $(pwd))
    useradd --shell /bin/bash --uid ${LOCALDIR_GID} user
    # our Dockerfile maps VOLUME and WORKDIR to /build, so set
    # our user's home directory to the same
    export HOME=/build
fi

exec gosu user "$@"
