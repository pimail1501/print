
#!/bin/sh
####批量下载煎蛋的美女图
file="/home/peyn/lazywarm/dl"
rm $file
for i in {2100..2189}
do

    curl "http://jandan.net/ooxx/page-"$i"#comments" | sed -e 's/ /\n/g' | grep -n "large" | sed -r 's/.*"(.+)".*/\1/' >> $file
done

wget -P /home/peyn/lazywarm/ -i $file
