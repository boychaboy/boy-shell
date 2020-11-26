ssh-keygen -f ~/.ssh/id_rsa_43
ssh-keygen -f ~/.ssh/id_rsa_229
ssh-keygen -f ~/.ssh/id_rsa_230
ssh-keygen -f ~/.ssh/id_rsa_46

ssh-copy-id -i ~/.ssh/id_rsa_43.pub boychaboy@163.239.27.43
ssh-copy-id -i ~/.ssh/id_rsa_229.pub boychaboy@163.239.199.229
ssh-copy-id -i ~/.ssh/id_rsa_230.pub boychaboy@163.239.199.230
ssh-copy-id -i ~/.ssh/id_rsa_46.pub boychaboy@163.239.27.46

echo "Next step:"
echo ">    cp ~/boy-shell/.ssh/config ~/.ssh/"
