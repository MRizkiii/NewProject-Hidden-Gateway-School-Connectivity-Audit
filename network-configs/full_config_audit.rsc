# mar/03/2026 13:57:45 by RouterOS 6.49.19
# software id = 
#
#
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
add dns-name=inetsmkn1bkt.net hotspot-address=22.22.22.1 login-by=\
    cookie,http-chap,http-pap name=hsprof1
/ip pool
add name=dhcp_pool0 ranges=22.22.22.2-22.22.22.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip hotspot
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=hotspot1 \
    profile=hsprof1
/ip address
add address=22.22.22.1/24 interface=ether2 network=22.22.22.0
/ip dhcp-client
add interface=ether1
add interface=ether1
add disabled=no interface=ether1
/ip dhcp-server network
add address=22.22.22.0/24 gateway=22.22.22.1
/ip dns
set servers=22.22.22.1
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=22.22.22.0/24
/ip hotspot user
add name=admin
/ip hotspot walled-garden
add dst-host=*.gstatic.com server=hotspot1
add dst-host=api.telegram.org server=hotspot1
add dst-host=*.wikimedia.org server=hotspot1
add dst-host=*.googleapis.com server=hotspot1
