# SSHD
Dockerized OpenSSH Server

## Usage

### Allow access for www-data user
```
docker run -d --restart=always \
-p 2022:22 \
-v /var/www:/var/www \
-e "USER_NAME=www-data" \
-e "USER_PASS=wwwdata1234" \
djocker/sshd
```

### Allow access for user with guid 1000
```
docker run -d --restart=always \
-p 2023:22 \
-v /var/www:/home/john/www \
-e "USER_NAME=john" \
-e "USER_PASS=johndoe1234" \
-e "USER_UID=1000" \
-e "USER_GID=1000" \
djocker/sshd
```

### Allow access for root user
```
docker run -d --restart=always \
-p 2024:22 \
-v /root:/root \
-e "ROOT_PASS=root1234" \
djocker/sshd
```

### Available Variables (all variables are optional)
`USER_NAME` (name of unix user)  
`USER_PASS` (password of unix user)  
`USER_UID` (uid for user, 1000 by default)  
`USER_GID` (gid for user, 1000 by default)  
`ROOT_PASS` (root user password)  

*note: if setted www-data as USER_NAME will use embedded user with uid:33 and guid:33*
