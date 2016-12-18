#!/usr/bin/env python3
# coding=utf-8
from bs4 import BeautifulSoup
import requests
import io
html = requests.get(
    'http://www.xiact.com.cn/ddsearch03.aspx?id=AWBA&no=32444226965')
html.encoding = "utf-8"
soup = BeautifulSoup(html.text, "lxml")
soup.prettify()
with open('test.txt', mode='w', encoding='utf-8') as abc:
    for sth in soup.body.stripped_strings:
        print(sth, file=abc)
with open('test.txt', mode='r', encoding='utf-8') as abc:
    lines = len(abc.readlines())
if lines > 2:  # 判断号码是否有误，错误的号码网页爬取只有一行
    with open('test.txt', mode='r') as abc:  # 对内容进行部分删除
        list = list(abc)
    for i in range(22):
        del list[0]
    for i in range(35):
        del list[-1]
    for i in range(19):
        del list[5]
    with open('test.txt', mode='w', encoding='utf-8') as abc:
        for k in list:
            abc.write(k)
else:
    print('号码错误，请重输')
