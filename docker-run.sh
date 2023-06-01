#!/bin/bash

docker run -it --rm -v ${PWD}:/build builder:latest "$@"
