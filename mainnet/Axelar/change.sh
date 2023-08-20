# Axelar

json_file=$(curl -H GET https://s3.eu-central-1.amazonaws.com/w3coins.io/snapshots/cosmos-mainnet/cosmos_snapsot_latest.json | jq '.')

echo $json_file | jq '.'

height=$(echo $json_file| jq -r '.latest_block_height')


start_seconds=$(echo $(echo $json_file| jq -r '.latest_block_time') | cut -d'T' -f2 | cut -d'.' -f1)
end_seconds=$(echo $(echo $json_file| jq -r '.earliest_block_time') | cut -d'T' -f2 | cut -d'.' -f1)

start_seconds=$(date -d "$start_time" +%s)
end_seconds=$(date -d "$end_time" +%s)

date_time=$(( (end_seconds - start_seconds) / 3600))

echo $date_time

data_link=https://s3.eu-central-1.amazonaws.com/w3coins.io/snapshots/cosmos-mainnet/cosmos_snapsot_latest.json

sudo tee ./axelar.md > /dev/null << EOF
|     Block   |     Age     |   Download  |
| ----------- | ----------- | ----------- |
|   $height   |  $date_time hour | [Snapshot]($data_link)  |
EOF
