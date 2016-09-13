#!/usr/bin/env bash
if [[ ! -z ${USER_PASS} ]]; then
  USER_NAME=${USER_NAME-web}
  
  if [[ "www-data" == ${USER_NAME} ]]; then
    chsh -s /bin/bash ${USER_NAME}
  else
    adduser --uid ${USER_UID-1000} --gid ${USER_GID-1000} --quiet --disabled-password --shell /bin/bash --home /home/web --gecos "User" ${USER_NAME} 
  fi
  
  echo ${USER_NAME}":"${USER_PASS} | chpasswd
fi

if [[ ! -z ${ROOT_PASS} ]]; then
  sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
  echo "root:"${ROOT_PASS} | chpasswd
fi

exec $@;