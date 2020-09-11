#!/bin/bash
#
# A Linux Shell Script to automate rule and status changes for 
# IPTABLES Firewall.
#
# -------------------------------------------------------------------------
# Usage:
#   sudo ./fw.sh [close|open|part]
#     close: All INPUT traffic is dropped
#     open: All INPUT traffic is accepted
#     part: All INPUT traffic is dropped except for 22-23/tcp
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

FW="/sbin/iptables"
IF="enp1s0"

if [$1 == "close"]; then
    $FW -P INPUT DROP

if [$1 == "open"]; then
    $FW -P INPUT ACCEPT
