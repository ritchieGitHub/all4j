#!/bin/bash
cd /root/indiforjava-ci/
CURRENT_SHA=`git ls-remote http://git.code.sf.net/p/indiforjava/code.git master |cut -f1`
LAST_SHA=`cat /root/indiforjava-ci/current_sha.txt`
if [ "$CURRENT_SHA" != "$LAST_SHA" ];
then
	git pull
	echo $CURRENT_SHA > current_sha.txt
	git add current_sha.txt
	git commit -m 'build'
	git push origin master
fi
