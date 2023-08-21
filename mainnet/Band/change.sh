
index_str=${1:-"3s"}
data_link="https://s3.eu-central-1.amazonaws.com/w3coins.io/snapshots/band-mainnet/band_snapsot_latest.json"
snap_link="https://s3.eu-central-1.amazonaws.com/w3coins.io/snapshots/band-mainnet/band_snapsot_latest.tar.lz4"
memory=$(curl -sI $snap_link | grep -i Content-Length | awk '{print  $2 / (1024^3)}')

json_file=$(curl -H GET $data_link | jq '.')
echo $json_file | jq '.'

height=$(echo $json_file| jq -r '.latest_block_height')


echo "Get time"
start_seconds=$(echo $(echo $json_file| jq -r '.latest_block_time') | cut -d'T' -f2 | cut -d'.' -f1)
#end_seconds=$(echo $(echo $json_file| jq -r '.earliest_block_time') | cut -d'T' -f2 | cut -d'.' -f1)
utc_time=$(date -u +"%T")
start_seconds=$(date -d "$start_time" +%s)
end_seconds=$(date -d "$utc_time" +%s)
date_time=$(( (end_seconds - start_seconds) / 3600))

echo $date_time


changed_str="|   $height   |  $date_time hour | [Snapshot ($(printf '%.1f' $memory) GB)]($snap_link)  |"


sed -i "$index_str>.*>$changed_str>" snapshot.md

