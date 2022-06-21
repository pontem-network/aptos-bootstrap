## 1. Set environment in .env
```
cp .env.example .env
```
Specify the required commit, like:
```
COMMIT=39bdd6acf1bcf523970b6be057f884a848712c7c
```
## 2. Build image
```
docker-compose build
```
The image contains `aptos-node`, `aptos-faucet` and `aptos (aptos-cli)`
## 3. Start Local Testnet
```
docker-compose up -d
```
## Access to node and faucet:
Node rest API - http://127.0.0.1:8080

Node metrics - http://127.0.0.1:9101

Faucet - http://127.0.0.1:8000