ssh-keygen -f ~/.ssh/id_rsa_224
ssh-keygen -f ~/.ssh/id_rsa_228
ssh-keygen -f ~/.ssh/id_rsa_229
ssh-keygen -f ~/.ssh/id_rsa_230
ssh-keygen -f ~/.ssh/id_rsa_231
ssh-keygen -f ~/.ssh/id_rsa_nipa
ssh-keygen -f ~/.ssh/id_rsa_nipa2

ssh-copy-id -i ~/.ssh/id_rsa_224.pub boychaboy@163.239.199.224
ssh-copy-id -i ~/.ssh/id_rsa_228.pub boychaboy@163.239.199.228
ssh-copy-id -i ~/.ssh/id_rsa_229.pub boychaboy@163.239.199.229
ssh-copy-id -i ~/.ssh/id_rsa_230.pub boychaboy@163.239.199.230
ssh-copy-id -i ~/.ssh/id_rsa_231.pub boychaboy@163.239.27.43
ssh-copy-id -i ~/.ssh/id_rsa_nipa.pub -p 16022 boychaboy@14.49.44.196
ssh-copy-id -i ~/.ssh/id_rsa_nipa2.pub -p 16022 boychaboy@49.50.165.52


echo "Next step:"
echo ">    cp ~/boy-shell/.ssh/config ~/.ssh/"
