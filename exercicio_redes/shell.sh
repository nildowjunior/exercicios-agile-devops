#cria os namespaces
ip netns add green
ip netns add yellow

#para executar um comando na namespace
#ip netns exec green ip link

# para criar o cabo
#ip link add veth-green type veth peer name veth veth-yellow

#ip -n green addr add 192.168.15.1/24 dev veth-green
#ip -n green addr add 192.168.15.2/24 dev veth-yellow

#ip -n green link set veth-green up
#ip -n yellow link set veth-yellow up

#cria a bridge e deixa de pé
brctl addbr v-net-0 **

#Cria os cabos
ip link add veth-green type veth peer name veth-green-br
ip link add veth-yellow type veth peer name veth-yellow-br

#ligando os cabos nas namespaces
ip link set veth-green netns green
ip link set veth-yellow netns yellow

#ligando os cabos na bridge
ip link set veth-green-br master v-net-0
ip link set veth-yellow-br master v-net-0

#subindo as interfaces
ip link set veth-green-br up
ip link set veth-yellow-br up

# atribuindo ips e levantando as interfaces
ip -n green addr add 192.168.15.10/24 dev veth-green
ip -n green link set veth-green up

ip -n yellow addr add 192.168.15.11/24 dev veth-yellow
ip -n yellow link set veth-yellow up

#atribuindo ip para a bridge
ip addr add 192.168.15.5/24 dev v-net-0
ip link set v-net-0 up

#atribuindo link default para permitir conexão externa
ip netns exec green ip route add default via 192.168.15.5 dev veth-green
ip netns exec yellow ip route add default via 192.168.15.5 dev veth-yellow

#trafego namespace para fora - NAT
iptables -t nat -A POSTROUTING -s 192.168.15.0/24 -j MASQUERADE

#host externo acessando
iptables -t nat -A POSTROUTING -dport 80 --to-destination 192.168.15.13 -j DNAT



