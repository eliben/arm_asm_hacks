#!/bin/bash

set -o nounset
set -o errexit

gcc -o hello hello.s
gcc -o neon_test1 neon_test1.s

