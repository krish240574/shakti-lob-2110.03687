 cols:{(.+x)0}
 o:+(`$,/',/+$(`ap`as`bp`bs),/:\:$!30)!`csv?1:"ob.csv"
 m:+(`t`ot`oid`sz`p`d)!`csv?1:"msg.csv"
 o: o,'(sav:[[]sav:+/'+o ca:((.+o)0) -3+\30#4])
 o: o,'(sbv:[[]sbv:+/'+o cb:((.+o)0) -1+\30#4])

 m:m,'td:[[]td:@[m`d;&-29=m`d;-1]]
 o:o,'(select ot from m),'td:[[]td:@[m`d;&-29=m`d;-1]]

 c1:(0.1*o[i]`sav)<'+(o[i:&2=o`ot])ca

 tmp:select (ap0+bp0)%2 from o where ot=2;
 ap0:[[]ap0:o`ap0]
 bp0:[[]bp0:o`bp0]

 ap:(+o (cols o)[-4+\30#4])[i]
 apd:100*(ap-tmp`bp0)%tmp`bp0

 bp:(+o (cols o)[-2+\30#4])[i]
 bpd:100*(bp-tmp`bp0)%tmp`bp0

 &0<i*|/'(abs bpd)>1


/ c21:100*(ap-tmp`bp0)%(tmp`bp0) / the mid column gets named as bp0
/ c22:100*(bp-tmp`bp0)%(tmp`bp0)




/ i:&2=o`ot 
/ av:+ca!o ca:((.+o)0) 2+-3+\30#4; 
/ av:av[i],'sav:[[]sav:+/'av[i]]
/
/ bv:+cb!o cb:((.+o)0) 2+-1+\30#4; 
/ bv:bv[i],'sbv:[[]sbv:+/'bv[i]]






