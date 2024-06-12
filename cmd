sudo apt update && sudo apt upgrade -y
tmux
curl -sL1 https://nubit.sh | bash
# ctrl + C để dừng chạy
cd nubit-node

export PATH=$PATH:$(pwd)/bin
NETWORK=nubit-alphatestnet-1
NODE_TYPE=light
PEERS=/ip4/34.222.12.122/tcp/2121/p2p/12D3KooWJJWdaCB8GRMHuLiy1Y8FWTRCxDd5GVt6A2mFn8pryuf3
VALIDATOR_IP=validator.nubit-alphatestnet-1.com
GENESIS_HASH=AD1DB79213CA0EA005F82FACC395E34BE3CFCC086CD5C25A89FC64F871B3ABAE
AUTH_TYPE=admin
store=$HOME/.nubit-${NODE_TYPE}-${NETWORK}/
NUBIT_CUSTOM="${NETWORK}:${GENESIS_HASH}:${PEERS}"

nkey list --p2p.network $NETWORK --node.type $NODE_TYPE && cat mnemonic.txt
#Lưu địa chỉ, public key, seed phrase

wget -O /etc/systemd/system/nubit.service https://raw.githubusercontent.com/hiepntnaa/initia/main/nubit.service

systemctl daemon-reload && systemctl enable nubit && systemctl start nubit

sudo journalctl -u nubit -f -o cat
