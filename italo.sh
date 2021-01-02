#! /bin/bash

install_checks () {
sudo apt install git
servicenode_install
}

servicenode_install () {
  sudo apt update && sudo apt upgrade
  sudo apt install build-essential pkg-config libsqlite3-dev qttools5-dev libcurl4-openssl-dev libsystemd-dev libboost-thread-dev libgtest-dev libboost-serialization-dev libboost-program-options-dev libunbound-dev nettle-dev libevent-dev libminiupnpc-dev libunwind8-dev libsodium-dev libssl-dev libreadline-dev libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler python3 g++-8 gcc-8
  if [[ $(lsb_release -rs) == "18.04" ]]; then 
    export CC=gcc-8 CXX=g++-8
  else
    echo "Export Not Needed Ubuntu 20.04"
  fi
  
  git clone --recursive 'https://github.com/italocoin-project/italo.git' italo && cd italo
  git submodule init && git submodule update
  make release

  cd build/Linux/dev/release && sudo cp -r bin ~/
  
  sudo rm /etc/systemd/system/service.service
  sudo cp ~/Italo/service.service /etc/systemd/system/
  sudo systemctl daemon-reload
  sudo systemctl enable service.service
}

prepare_registration () {
  ~/bin/italod prepare_registration
}

start () {
  systemctl start service.service
  echo Service node started to check it works use bash italo.sh logging
}

status () {
  systemctl status service.service
}

stop_the_nodes () {
  echo Stopping XTA node
  sudo systemctl stop service.service
}

logging () {
  sudo journalctl -u service.service -n 1000
}

git_pull () {
  git pull
}

update_daemon () {
  rm -r ~/bin
  servicenode_install
}

case "$1" in
  install ) install_checks ;;
  prepare_registration ) prepare_registration ;;
  start ) start ;;
  stop ) stop_the_nodes ;;
  status ) status ;;
  logging ) logging ;;
  git_pull ) git_pull ;;
  update_daemon ) update_daemon ;;
esac
