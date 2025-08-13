print('this supposed to give periodic orbtis for positive f. Hopefully stable')
a=loadbd('star')
print('The starting branch looks like')
print a
print [a(66)['kf'],a(66)['f'],a(66)['k1cat']]
print('check the stability at home!')
print('we can find the loci of the Hopf bifurcation in two pars')
b=run(a('HB1'),ICP=['k1cat','kf'],ISW=2,UZSTOP={'f':[0],'kf':[0]},NMX=20,NPR=1)

b2=run(b,IRS=68,DS='-')
plot(b+b2)

# we can find periodic orbits

c=run(a('HB1'),IPS=2,ICP=['f','PERIOD'],NMX=12000,NPR=1200)
#are they stable?
