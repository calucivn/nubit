HƯỚNG DẪN CHẠY NODE WORKER ALLORA
I. Cài mới
1. Faucet Allora
https://faucet.edgenet.allora.network/

export pass=[thay-pass] && wget -O faucetallora.sh https://raw.githubusercontent.com/calucivn/nubit/main/faucetallora.sh && chmod +x faucetallora.sh && ./faucetallora.sh && rm -rf faucetallora.sh

3. Chạy node
2.1. Lệnh này có thể chạy cùng lúc trên nhiều vps để tiết kiệm thời gian

wget -O allora0.sh https://raw.githubusercontent.com/hiepntnaa/general/main/allora0.sh && chmod +x allora0.sh && ./allora0.sh

2.2. Lệnh này nên chạy dưới 2 vps cùng lúc.

wget -O allora.sh https://raw.githubusercontent.com/hiepntnaa/general/main/allora.sh && chmod +x allora.sh && ./allora.sh && wget -O docker-allora.sh https://raw.githubusercontent.com/hiepntnaa/general/main/docker-allora.sh && chmod +x docker-allora.sh

- Đợi 1 lúc rồi nhập WALLET_SEED_PHRASE


3. Check logs 
3.1. 
docker logs -f worker-basic-eth-pred
3.2.

wget -O logs-allora.sh https://raw.githubusercontent.com/hiepntnaa/general/main/logs-allora.sh && chmod +x logs-allora.sh && ./logs-allora.sh  && rm -rf logs-allora.sh

# Kết quả trả về sẽ có định dạng như bên dưới là node đang chạy tốt

{"code":"200","request_id":"876a58bf-2cad-49ff-a722-86a5da444528","results":[{"result":{"stdout":"{\"infererValue\": \"2908.09263675852\"}\n\n","stderr":"","exit_code":0},"peers":["12D3KooWM99J9Qc9QhsBXiezdJKr9Y6MJN3LDL8XfcBDbCn1qtAp"],"frequency":100}],"cluster":{"peers":["12D3KooWM99J9Qc9QhsBXiezdJKr9Y6MJN3LDL8XfcBDbCn1qtAp"]}}

# Nếu kết quả ko đúng định dạng thì chạy bước 3

3. Rebuild docker

./docker-allora.sh

# Chạy xong thì check logs như phần 2. 

II. Đối với những node đã cài trước 13h30 09/07/24
1. Tải file docker-allora

wget -O docker-allora.sh https://raw.githubusercontent.com/hiepntnaa/general/main/docker-allora.sh && chmod +x docker-allora.sh

2. Check logs bằng lệnh wget, nếu kết quả ko đúng định dạng:

./docker-allora.sh


# HƯỚNG DẪN CHẠY WORKER 1 - 2 - 7

docker rm -f $(docker ps -aq) && docker network prune -f && docker volume prune -f 

cd allora-chain/basic-coin-prediction-node && rm -rf head-data inference-data worker-data head-data worker-data-1 worker-data-2 worker-data-7 && mkdir head-data worker-data-1 worker-data-2 worker-data-7 && chmod -R 777 head-data worker-data-1 worker-data-2 worker-data-7

cd && wget -O allora2.sh https://raw.githubusercontent.com/hiepntnaa/general/main/allora2.sh && chmod +x allora2.sh && ./allora2.sh

crontab -l | grep -v '/root/.autoallora.sh' | crontab - && wget -O .autoallora.sh https://raw.githubusercontent.com/hiepntnaa/general/main/.autoallora.sh && chmod +x .autoallora.sh && (crontab -l ; echo "*/5 * * * * /root/.autoallora.sh") | crontab -


# Nếu 1 trong 3 worker bị lỗi thì rebuild

./docker-allora.sh


# HƯỚNG DẪN CHẠY WORKER 1 - 2 - 7 -10 -11

docker rm -f $(docker ps -aq) && docker network prune -f && docker volume prune -f 

cd allora-chain/basic-coin-prediction-node && rm -rf head-data inference-data worker-data head-data worker-data-1 worker-data-2 worker-data-3 worker-data-4 worker-data-5 worker-data-6 worker-data-7 worker-data-8 worker-data-9 worker-data-10 worker-data-11 && mkdir worker-data-1 worker-data-2 worker-data-3 worker-data-4 worker-data-5 worker-data-6 worker-data-7 worker-data-8 worker-data-9 worker-data-10 worker-data-11 && chmod -R 777 worker-data-1 worker-data-2 worker-data-3 worker-data-4 worker-data-5 worker-data-6 worker-data-7 worker-data-8 worker-data-9 worker-data-10 worker-data-11

cd && wget -O allora2.sh https://raw.githubusercontent.com/calucivn/general-th/main/allora2.sh && chmod +x allora2.sh && ./allora2.sh

crontab -l | grep -v '/root/.autoallora.sh' | crontab - && wget -O .autoallora.sh https://raw.githubusercontent.com/hiepntnaa/general/main/.autoallora.sh && chmod +x .autoallora.sh && (crontab -l ; echo "*/5 * * * * /root/.autoallora.sh") | crontab -

network_height=$(curl -s -X 'GET' 'https://allora-rpc.testnet-1.testnet.allora.network/abci_info?' -H 'accept: application/json' | jq -r .result.response.last_block_height) && \
curl --location 'http://localhost:6000/api/v1/functions/execute' --header 'Content-Type: application/json' --data '{
    "function_id": "bafybeigpiwl3o73zvvl6dxdqu7zqcub5mhg65jiky2xqb4rdhfmikswzqm",
    "method": "allora-inference-function.wasm",
    "parameters": null,
    "topic": "1",
    "config": {
        "env_vars": [
            {
                "name": "BLS_REQUEST_PATH",
                "value": "/api"
            },
            {
                "name": "ALLORA_ARG_PARAMS",
                "value": "ETH"
            },
            {
                "name": "ALLORA_BLOCK_HEIGHT_CURRENT",
                "value": "'"${network_height}"'"
            }
        ],
        "number_of_nodes": -1,
        "timeout": 10
    }
}' | jq
