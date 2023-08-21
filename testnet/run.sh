eval $(ssh-agent)
ssh-add /root/.ssh/id_rsa
git pull

index_str='3s'

for folder in *; do

    if [ -d "$folder" ]; then
       cd $folder && ./change.sh $index_str && cd ../
    fi

done

git add .
git commit -m 'update'
git push
