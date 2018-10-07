#!/bin/sh

export volsize="10Gi"
export GUID=`hostname|awk -F. '{print $2}'`

mkdir /root/10gpvs

for volume in pv{26..50} ; do

cat << EOF > /root/10gpvs/${volume}

apiVersion: v1
kind: PersistentVolume
metadata:
 name: ${volume}
spec:
 accessModes:
 - ReadWriteMany
 capacity:
   storage: ${volsize}
 nfs: 
   path: /srv/nfs/user-vols/${volume}
   server: support1.${GUID}.internal
 persistentVolumeReclaimPolicy: Retain
 
EOF

echo "Created def file for ${volume}";

oc create -f  /root/10gpvs/${volume}

done;
