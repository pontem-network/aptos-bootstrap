## 1. Set environment in .env
```
cp .env.example .env
```
Specify the required commit, like:
```
COMMIT=39bdd6acf1bcf523970b6be057f884a848712c7c
```
To use local binaries, specify the path to them in .env:
```
NODE_BIN_PATH=/some/dir/aptos-node
FAUCET_BIN_PATH=/some/dir/aptos-faucet
``` 
## 2. Build image
For a full build:
```
docker-compose build
```
The image contains `aptos-node`, `aptos-faucet` and `aptos (aptos-cli)`

For use with local binaries:
```
docker-compose -f docker-compose.dev.yml build
```
## 3. Start Local Testnet
```
docker-compose up -d
```
For use with local binaries:
```
docker-compose -f docker-compose.dev.yml up -d
```
## Access to node and faucet:
Node rest API - http://127.0.0.1:8080

Node metrics - http://127.0.0.1:9101

Faucet - http://127.0.0.1:8000

## How to use aptos-cli:
```
docker exec -it aptos-validator aptos <args>
```