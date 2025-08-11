# I do not know how much I believe this. There seems to be a HB for a positive value of f.
a=run('erk',DS='-',NMX=350,NPR=50)
 #there are 2 hb. One occurs for f>0. We can chase that in a 2 par. continuation
b=run(a('HB2'),ISW=2,ICP=['f','kf'])
b1=run(b,IRS=11,DS='-')
b=b+b1; relabel(b)
#following the periodic
c=run(a('HB2'),IPS=2,ICP=['f','PERIOD'],NMX=60,NPR=6)



