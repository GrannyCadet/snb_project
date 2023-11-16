#!/bin/bash
#

tld="drankenkas"
sld="com"
fqdn="$tld.$sld"

echo " 
zone "FQDN" IN { type master;
        file \"TLD.forward.zone\";
        allow-update { none; };
};
" > /etc/named/template

rm /etc/named/$fqdn
cp /etc/named/template /etc/named/$fqdn

sed -i "s/FQDN/$fqdn/g" "/etc/named/$fqdn"
sed -i "s/TLD/$tld/g" "/etc/named/$fqdn"

echo "
include \"/etc/named/$fqdn\";
" >> /etc/named.conf

sudo systemctl restart named.service
