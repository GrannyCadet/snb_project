#!/bin/bash
# TODO 
# 	option to remove zones

replace () {
	sed -i "s/$1/$2/g" $3
}

tld="faka"
sld="local"
fqdn="$tld.$sld"

echo " 
zone "FQDN" IN { type master;
        file \"TLD.forward.zone\";
        allow-update { none; };
};
" > /etc/named/template

if [ -e /etc/named/$fqdn ]; then
	rm /etc/named/$fqdn
fi

cp /etc/named/template /etc/named/$fqdn

replace "FQDN" $fqdn "/etc/named/$fqdn"
replace "TLD" $tld "/etc/named/$fqdn"

echo "
include \"/etc/named/$fqdn\";
" >> /etc/named.conf

#sudo systemctl restart named.service
