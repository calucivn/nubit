HƯỚNG DẪN CHẠY NODE WORKER ALLORA
I. Cài mới
1. Faucet Allora
https://faucet.edgenet.allora.network/
2. Chạy node
2.1. Lệnh này có thể chạy cùng lúc trên nhiều vps để tiết kiệm thời gian

wget -O allora0.sh https://raw.githubusercontent.com/calucivn/nubit/main/depend?token=GHSAT0AAAAAACUVWAQSP4ZG55R4FMTDBWKCZUOMURQ && chmod +x allora0.sh && ./allora0.sh

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
