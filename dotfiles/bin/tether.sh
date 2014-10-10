interface=$(ip link | grep enp0s20u | cut -d ':' -f 2 | cut -d ' ' -f 2)
sudo dhcpcd $interface
