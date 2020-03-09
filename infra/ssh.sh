git secret reveal
IP=`terraform output ip`

terraform output private_key > key.rsa
chmod 600 key.rsa
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$IP -i key.rsa
rm key.rsa 
git secret hide -d