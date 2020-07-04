# get anaconda install file
if [ ! -e ~/Anaconda3-2020.02-Linux-x86_64.sh ]; then
  scp boychaboy@163.239.199.230:/home/boychaboy/.installs/Anaconda3-2020.02-Linux-x86_64.sh .
  echo "Anaconda install file copied"
fi
if [ -e ~/Anaconda3-2020.02-Linux-x86_64.sh ] || [ ! -d ~/anaconda3 ]; then
  chmod 750 Anaconda3-2020.02-Linux-x86_64.sh
  echo "Start Anaconda install..."
  ./Anaconda3-2020.02-Linux-x86_64.sh
fi

