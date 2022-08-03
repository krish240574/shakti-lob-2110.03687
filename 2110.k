nl:30
exc:{x[&~x=y]}

co:(`$,/',/+$(`ap`as`bp`bs),/:\:$!nl)
o:+co!`csv?1:"../SPY/ob.csv"
m:+(`t`ot`oid`sz`p`d)!`csv?1:"../SPY/msg.csv"
cav:co -3+\nl#4; cbv:co -1+\nl#4; cap:co -4+\nl#4; cbp:co -2+\nl#4
 

m:m,'td:[[]td:@[m`d;&-29=m`d;-1]]
i:&2=m`ot

th:0.005
c1a:(m[i]`sz)>th*+/'+o[i]cav[!25]
c1b:(m[i]`sz)>th*+/'+o[i]cbv[!25]

ap:(o i)cap; bp:(o i)cbp
mid:((&/ap)+|/bp)%2.0 
c2la:(avg k)<k:abs|/'((+ap)-mid)%mid 
c2lb:(avg k)<k:abs|/'((+bp)-mid)%mid

ia:i@&c1a & c2la 
ib:i@&c1b & c2lb 
ta:_(min ia)%10
tb:_(min ib)%10
ana:(+m `t`p)[ia-\:!ta]
anb:(+m `t`p)[ib-\:!ta]

f:{ 
 c:&~x[;0]=0,-1_x[;0];
 kp:x[;1]@c;  akp:avg kp:log abs 1_(0,-1_kp)%kp;
 kt:x[;0]@c;  kt:1_(kt -(0,-1_kt));
 sqrt((+/(kp-akp)*(kp-akp)%abs kt)%(-1+#kt))}

th:avg k:f':ana
m:m,'[[]an:@[&#m;?,/(ia@&th<k)-\:!ta;1]]
"../SPY/m.csv"1:`csv@m


wsz:42
w:{t:(!x)+\:!y;(t;last't)}[1+(#m)-wsz;wsz]
xts:(+o co[!#co])@w 0 
yts:(m`an)[last'w 0]
