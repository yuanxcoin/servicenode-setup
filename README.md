
# Gyuanx service node easy setup guide



## Installation

Building the service node is so easy, get a VPS, login to your new VPS and simple run the `service-node.sh by using the below format
```shell
bash service-node.sh
```

### Pull this script from github
`git clone https://github.com/yuanxcoin/service-node-setup  servicenode`

### Go into newly created folder

`cd servicenode`

### Run install script

`bash gyuanx.sh install`

### To start service node

`bash gyuanx.sh start`

### To stop service node

`bash gyuanx.sh stop`

## Additional commands:

### To check service status:

`bash gyuanx.sh status`

### To check how it is working:

`bash gyuanx.sh logging`

### To generate staking transaction:

`bash gyuanx.sh prepare_registration`

### To upgrade node:

`bash gyuanx.sh git_pull`
 then
`bash gyuanx.sh update_daemon`
