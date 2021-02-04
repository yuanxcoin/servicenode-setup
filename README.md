
# Gyuanx service node easy setup guide



## Installation

Building the service node is so easy, get a VPS, login to your new VPS and simple run the `service-node.sh by using the below format


### Pull this script from github
`git clone https://github.com/yuanxcoin/servicenode-setup`

### Go into newly created folder

`cd servicenode-setup`

```shell
bash service-node.sh
```
Once the build is completed, simply run the storage server any were. Run each in ```screen```

```shell
gyuanx-storage your-ip-address 8080  --lmq-port 11111
```

```shell
gyuanxd --service-node --storage-server-port 11115 --service-node-public-ip your-ip-address
```
構建服務節點是如此簡單，獲得一個VPS，登錄到您的新VPS，並使用以下service-node.sh運行"service-node.sh"
