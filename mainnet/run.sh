eval $(ssh-agent)
ssh-add /root/.ssh/id_rsa
git pull
git add .
git commit -m 'update'
git push
