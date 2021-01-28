
# Gyuanx service node easy setup guide



## Installation

### Pull this script from github
`git clone https://github.com/yuanxcoin/service-node-setup  servicenode`

### Go into newly created folder

`cd servicenode`

Building the service node is so easy, get a VPS, login to your new VPS and simple run the `service-node.sh by using the below format
```shell
bash service-node.sh
```
Once the build is completed, simply run the storage server any were

```shell
./gyuanx-storage your-ip-address 8080  --lmq-port 11111
```
