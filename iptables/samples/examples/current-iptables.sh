# Generated by iptables-save v1.4.21 on Mon Apr 11 08:35:41 2016
*mangle
:PREROUTING ACCEPT [1086528:1226902099]
:INPUT ACCEPT [242142:333101306]
:FORWARD ACCEPT [844376:893800183]
:OUTPUT ACCEPT [148712:13567400]
:POSTROUTING ACCEPT [993097:907369574]
-A POSTROUTING -o virbr0 -p udp -m udp --dport 68 -j CHECKSUM --checksum-fill
COMMIT
# Completed on Mon Apr 11 08:35:41 2016
# Generated by iptables-save v1.4.21 on Mon Apr 11 08:35:41 2016
*nat
:PREROUTING ACCEPT [941:58275]
-A PREROUTING -p tcp --dport 25533 -j DNAT --to-destination 192.168.122.156:22
:INPUT ACCEPT [853:52025]
:OUTPUT ACCEPT [422:24807]
:POSTROUTING ACCEPT [422:24807]
-A POSTROUTING -s 192.168.122.0/24 -d 224.0.0.0/24 -j RETURN
-A POSTROUTING -s 192.168.122.0/24 -d 255.255.255.255/32 -j RETURN
-A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -p tcp -j MASQUERADE --to-ports 1024-65535
-A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -p udp -j MASQUERADE --to-ports 1024-65535
-A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -j MASQUERADE
COMMIT
# Completed on Mon Apr 11 08:35:41 2016
# Generated by iptables-save v1.4.21 on Mon Apr 11 08:35:41 2016
*filter
:INPUT ACCEPT [12032:5467686]
:FORWARD ACCEPT [183985:187827961]
:OUTPUT ACCEPT [16376:6276136]
COMMIT
# Completed on Mon Apr 11 08:35:41 2016
