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
    $FW -F
    $FW -P INPUT DROP

if [$1 == "open"]; then
    $FW -F
    $FW -P INPUT ACCEPT
    
if [$1 == "part"]; then
    $FW -F
    $FW -P INPUT DROP
    $FW -A INPUT -p tcp --destination-port 22 -j ACCEPT
    $FW -A INPUT -p tcp --destination-port 23 -j ACCEPT
