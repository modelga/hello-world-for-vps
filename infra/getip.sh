./state.sh list | grep server_ip | xargs -I {} ./state.sh show {} | grep address | awk '{print $3}' | sed s/\"//g