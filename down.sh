#!/bin/bash



file="/home/peyn/stock/"
for i in {21..24}    # 修改需要下载的日期
do
    wget -O "$file$i".dat "http://market.finance.sina.com.cn/downxls.php?date=2016-11-"$i"&symbol=sz300326"   #修改需要下载的月份以及上市公司代码
    iconv  -f gb18030 -t utf-8 "$file$i".dat -o "$file$i"new.dat
    rm "$file$i".dat
    sed -e 's/买盘/buy/g' -e 's/卖盘/sell/g' -e 's/中性盘/unde/g' -e '1d' "$file$i"new.dat > "$file$i".dat
    rm "$file$i"new.dat
    sort -k 2n -k 6 "$file$i".dat -o "$file$i".dat
done

