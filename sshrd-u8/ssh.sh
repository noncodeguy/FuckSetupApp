oscheck=$(uname)
"$oscheck"/iproxy 2222 22 &>/dev/null &
"$oscheck"/sshpass -p 'alpine' ssh -o HostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=no -p2222 root@localhost "$1"
