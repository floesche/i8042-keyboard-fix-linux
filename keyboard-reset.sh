#! /bin/sh
## Add USB reset from https://bbs.archlinux.org/viewtopic.php?pid=2017609#p2017609
case $1/$2 in
  pre/*)
    rmmod i8042
    echo "remove i8042"
    for USB in /sys/bus/usb/devices/*/authorized; do
        eval "echo 0 > $USB" 2>/dev/null
    done
    echo "turn off usb"
    ;;
  post/*)
    modprobe i8042 reset=1
    echo "reset keyboard"
    for USB in /sys/bus/usb/devices/*/authorized; do
        eval "echo 1 > $USB" 2>/dev/null
    done
    echo "turn on usb"
    ;;
esac
