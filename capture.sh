#!/bin/bash
#
# A Linux Shell Script to automate running a packet capture
#
# -------------------------------------------------------------------------
# Usage:
#   sudo ./capture.sh
#
# -------------------------------------------------------------------------
# Copyright (c) 2020 Jason M. Pittman <jpittman@highpoint.edu>
# This script is licensed under GNU GPL version 3.0 or above
#
# -------------------------------------------------------------------------
# This script is part of the reproduction study of Deng & Deng 2012.
# Visit https://github.com/jasonmpittman/detecting-honeypots-ca for more 
# information.
# -------------------------------------------------------------------------

CAP="/usr/sbin/tcpdump"
IF="enp1s0"

$CAP -i $IF -nnXs 0 -w scap.pcap
