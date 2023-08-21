eval $(ssh-agent)
ssh-add /root/.ssh/id_rsa
git pull

index_str='3s'
work_dir_path='/root/gitbook'

for folder in *; do

    if [ -d "$folder" ]; then
       cd work_dir_path/$folder && ./change.sh $index_str && cd ../
    fi

done

cd $work_dir_path
git add .
git commit -m 'updates snapshot mainnet'
git push
