yc compute instance create \
    --name reddit-full \
    --hostname reddit-full \
    --cores 2 \
    --platform-id standard-v3 \
    --memory=2 \
    --create-boot-disk image-id=fd8fjhg22bvevkjrlbam,size=10GB \
    --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --metadata serial-port-enable=1 \
    --ssh-key ~/.ssh/appuser.pub
