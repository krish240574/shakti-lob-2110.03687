 co:(`$,/',/+$(`ap`as`bp`bs),/:\:$!30)
 o:+co!`csv?1:"ob.csv"
 m:+(`t`ot`oid`sz`p`d)!`csv?1:"msg.csv"
 cav:co -3+\30#4; cbv:co -1+\30#4; cap:co -4+\30#4; cbp:co -2+\30#4

 m:m,'td:[[]td:@[m`d;&-29=m`d;-1]]
 i:&2=m`ot;

 c1a:(0.2*+/o[i]cav)<|/(o[i]cav); c1b:(0.2*+/o[i]cbv)<|/(o[i]cbv);

 ap:(o i)cap; bp:(o i)cbp

 mid:((&/ap)+|/bp)%2.0 

 c2la:1<|/'100*((+ap)-mid)%mid; c2lb:1<|/'100*((+bp)-mid)%mid

 ia:i@&c1a & c2la             
 ib:i@&c1b & c2lb

 ana:(+m `t`p)[ia-\:!200]; anb:(+m `t`p)[ib-\:!200]

f:{ 
 c:&~x[;0]=0,-1_x[;0];
 kp:x[;1]@c;
 akp:avg kp:log abs 1_(0,-1_kp)%kp;
 kt:x[;0]@c;
 kt:1_(kt -(0,-1_kt));
 sqrt((+/(kp-akp)*(kp-akp)%abs kt)%(-1+#kt)) }

 m:m,'[[]an:@[(&#m);?,/(ia@&1<f'ana)-\:!200;1]]
 "m.csv"1:`csv@m




