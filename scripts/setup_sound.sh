#!/bin/bash
pactl load-module module-null-sink sink_name=VirtualSinkForStuff sink_properties=device.description=VirtualSinkForStuff
pactl load-module module-loopback source=VirtualSinkForStuff.monitor sink=alsa_output.pci-0000_00_1f.3.analog-stereo
pw-link VirtualSinkForStuff:monitor_FL audiorelay-virtual-mic-sink:playback_FL
pw-link VirtualSinkForStuff:monitor_FR audiorelay-virtual-mic-sink:playback_FR
