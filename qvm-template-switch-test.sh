#!/bin/sh
# get the args sorted:
for i in "$@" ; do
case $i in
    -p=*|--prefix=*)
    todo
# todo : get the reversion tpl
# guess : what is target vn
# todo launch revert in background before testing?
# need channel to skip wait.
qvm-shutdown --wait sys-usb
qvm-prefs sys-usb template fedora-43-xfce
qvm-start sys-usb
sleep 3m # cannot assume human readable times?
qvm-shutdown --wait sys-usb
qvm-prefs sys-usb template fedora-42-xfce
qvm-start sys-usb
