#!/bin/sh

export GUID=`hostname|awk -F. '{print $2}'`
export volsize="5Gi"

mkdir /root/5gpvs


for volume in pv{1..25} ; do

cat << EOF > /root/5gpvs/${volume}

apiVersion: v1
kind: PersistentVolume
metadata:
 name: ${volume}
spec:
 accessModes:
 - ReadWriteOnce
 capacity:
   storage: ${volsize}
 nfs: 
   path: /srv/nfs/user-vols/${volume}
   server: support1.${GUID}.internal
 persistentVolumeReclaimPolicy: Recycle
 
EOF

echo "Created def file for ${volume}";

oc create -f /root/5gpvs/${volume}

done;

