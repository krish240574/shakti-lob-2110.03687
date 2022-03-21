 ols:{(.+x)0}
 o:+(`$,/',/+$(`ap`as`bp`bs),/:\:$!30)!`csv?1:"ob.csv"
 m:+(`t`ot`oid`sz`p`d)!`csv?1:"msg.csv"
 o: o,'(sav:[[]sav:+/'+o ca:((.+o)0) -3+\30#4])
 o: o,'(sbv:[[]sbv:+/'+o cb:((.+o)0) -1+\30#4])

 m:m,'td:[[]td:@[m`d;&-29=m`d;-1]]
 o:o,'(select ot from m),'td:[[]td:@[m`d;&-29=m`d;-1]]
 i:&2=o`ot;

/ Condition 1  - threshold is 0.2 for now
 c1a:i,'(0.2*o[i]`sav)<max'+o[i]ca; / max of 30-level volumes > cum. volume for ask
 c1b:i,'(0.2*o[i]`sbv)<max'+o[i]cb; / max of 30-level volumes > cum. volume for bid

/ Condition 2 - delta of prices > threshold( 1.0 for now )
 ap:(+o (cols o)[-4+\30#4])[i] / ask prices
 bp:(+o (cols o)[-2+\30#4])[i] / bid prices
 mid:[[]p:((min'ap)+(max'bp))%2.0] / mid-price
 
 apd:100*(ap-mid`p)%mid`p; bpd:100*(bp-mid`p)%mid`p
/ max of 30-level delta of price > threshold
 c2la:1<max'apd; c2lb:1<max'bpd
 
 / Condition 3
 kp:(m`p)[&~(m`t)=(0,-1_m`t)]
 kp:log abs 1_(0,-1_kp)%kp
 kp:@[kp;&-0w=kp;0.0]
 akp:avg kp

 kt:(m`t)[&~(m`t)=(0,-1_m`t)]
 kt:1_(kt -(0,-1_kt))
 pv:sqrt((+/(kp-akp)*(kp-akp)%kt)/(-1+#kt)) /trigger this when 1&2 are encountered, window of the last 1000 points for PV calc.

