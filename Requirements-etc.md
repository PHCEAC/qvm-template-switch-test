# Motivation and Requirements

## Motivation

* it is impossible to change template on a running qube.
* For sys-usb, with usb keyboard and mouse, 
  it is not possible to do anything after 
  shutting down the qube.
* Simple scripted shutdown+change+restart creates a risk that
  the qube will not restart, and user is locked out.
* In the manner of display modifications, a reversible
  test phase is desirable.

## Requirements

* automatic revert after a delay unless:
  * skip by user choice at runtime
  * command line option (see below)
* robust against ctrl-c, ctrl-d, ctrl-z
  * sig Int: immediate reversion
  * stop: allow timeout.
* shell independent (no bashisms)
* --target option to choose as I'm
* --timeout to set wait duration.
* --apply-change option to skip the revert phase.
* commandline parm to select new tpl, or choose
  latest version from available.
* warn if minimal?
* prompt for "revert" or "accept"

## Proposed impl

* Two possibilities for protection of user from
  lockout:
  * create clone of sys-usb, remove autostart attribute
    , test switch to the clone.In case of lockout, user 
    can reboot to return to previous.
  * Sequence shutdown modify restart, with a 
    delay before automatic restart.
  * will go the sequence route.
* determine revert tpl from running system.
* launch bg task for timeout revert.

