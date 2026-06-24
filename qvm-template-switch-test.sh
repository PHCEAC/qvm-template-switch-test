#!/bin/sh
qvm-shutdown sys-usb
qvm-prefs sys-usb template fedora-43-xfce
qvm-start sys-usb
sleep 3m
qvm-shutdown sys-usb
qvm-prefs sys-usb template fedora-42-xfce
qvm-start sys-usb
