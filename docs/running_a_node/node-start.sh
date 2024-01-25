#!/bin/sh
set -e

COMMUNE_NODE_DIR="${COMMUNE_NODE_DIR:-/commune-node}"

/subspace/target/release/node-subspace \
    --base-path "$COMMUNE_NODE_DIR" --chain "$COMMUNE_NODE_DIR/specs/main.json" \
    --rpc-external --rpc-cors=all \
    --port 30333 --rpc-port 9944 \
    --bootnodes \
        /ip4/142.93.240.200/tcp/50050/p2p/12D3KooWQu3CFWst45eT2r3yoYLwRcvu1QQfnaeBDFLXFbHuSSUF \
        /ip4/165.227.45.26/tcp/50050/p2p/12D3KooWD4iZ7zQPPP7heJEqpKPDErMjoecxkqm5uz7DvKUDUW6e \
        /ip4/165.22.186.112/tcp/50050/p2p/12D3KooWCth3StvR7mseAuBGxyHuM8aMq84CKd2HE5VTmy1jMFa1 \
        /ip4/165.227.42.26/tcp/50050/p2p/12D3KooWFwVi7vhc3rhHpUE2JbpwRtue1PWxUwabJj16vAvegu5d \
        /ip4/165.227.45.61/tcp/50050/p2p/12D3KooWLNDR6MofBvaDXUYiPFZvNLpsR6WpvpHWoNapGSbPtyzA \
        /ip4/165.227.45.63/tcp/50050/p2p/12D3KooWN1wQGNjjEbGzy7UAkT8F9QxZ28TUTm6u17FQ4Gu74hDu \
        /ip4/67.207.85.224/tcp/50050/p2p/12D3KooWMHBQ6Kj8aEcPZHGSz4uQtJoJtbLsbGFkGF8roNQMyLkw \
        /ip4/134.122.30.80/tcp/50050/p2p/12D3KooWPs7E9EPHyX4JLGCJYYxKof2aobd3KsJHjtPQ3s9Rdmc8 \
        /ip4/142.93.113.142/tcp/50050/p2p/12D3KooWNfqrY9VrwueBe7DJNn3kzqskiiphnNotAnsnESVqkjz4 \
        /ip4/67.207.85.117/tcp/50050/p2p/12D3KooWDPeSBSgaF2dHr8JsAcARXfGwWsPmfD7ViTncatLW4a9j \
        /ip4/165.227.37.247/tcp/50050/p2p/12D3KooW9y9A6bVxqRMcpUTM1A99dbfLV213tmARiVGdoTbsge6y \
        /ip4/165.227.33.226/tcp/50050/p2p/12D3KooWQgKoc5a9Buk3jBqTcHyzxqinjipzDzpjuaWP4ShzZmVZ \
        /ip4/165.227.33.226/tcp/50052/p2p/12D3KooWNqyXj3sLtohUG3Nx4xDQP5jbduc8jVMkZ74PTtS8LL2g \
        /ip4/142.93.240.200/tcp/50052/p2p/12D3KooWJHE2wkQxCsrii7ffGvFkMYnkZVNK4FVJi1PHyyNBEx6m \
        /ip4/165.22.186.112/tcp/50052/p2p/12D3KooWBmGPx5uhaCropWEjHxB51EJsA5RBiTPVrFVpCoNs83UH \
        /ip4/165.227.45.63/tcp/50052/p2p/12D3KooWHXBn3GCoNnR3xv6ywFuWCXHSd1f2sjGrFWm3y9sUPfkP \
        /ip4/142.93.113.142/tcp/50052/p2p/12D3KooWQy2628LzUChZ5ckqxdASZ6o8L6FXzXtBg93ZhhHgJk2q \
        /ip4/165.227.42.26/tcp/50052/p2p/12D3KooWHygMc8oZKDAxMQh3RsFAQmTMp5tJ2HRw62YunAEp95c4 \
        /ip4/67.207.85.224/tcp/50052/p2p/12D3KooWKMmvUy8pUZ2ERs8pjFGuDmckJ6AngG4J62o1M1tBAXVU \
        /ip4/165.227.37.247/tcp/50052/p2p/12D3KooWADQGKNjSupVAc9ZzW8AaCcwPRmpNSDwaRJ465bvHoVDW \
        /ip4/67.207.85.117/tcp/50052/p2p/12D3KooWDc3dEoFjN4r2z1hvxTWLrGztbJPepJa1fgjyrXN5ekCi \
    "$@"
