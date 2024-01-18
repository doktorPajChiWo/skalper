#! /usr/bin/env python
# sysctl net.ipv4.icmp_echo_ignore_all=1

from scapy.all import *


def handle_load(load):
    try:
        return "c:" + open("./data/%s" %load,"r").read().strip()
    except:
        return 

def handle_ping(pkt):
    if (pkt[2].type == 8):
        try:
            dst=pkt[1].dst
            src=pkt[1].src
            seq = pkt[2].seq
            id = pkt[2].id
            load=pkt[3].load
            print("payload from %s: %s" % (src, load))
            reply = IP(src=dst, dst=src)/ICMP(type=0, id=id, seq=seq)/handle_load(load)
            send(reply,verbose=False)
        except:
            pass


if __name__=="__main__":
    iface = "enp1s0"
    filter = "icmp and icmp[0]=8"
    sniff(iface=iface, prn=handle_ping, filter=filter)