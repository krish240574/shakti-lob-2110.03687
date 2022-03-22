cols:{(.+x)0}
 co:(`$,/',/+$(`ap`as`bp`bs),/:\:$!30)
 o:+co!`csv?1:"ob.csv"
 m:+(`t`ot`oid`sz`p`d)!`csv?1:"msg.csv"
 o: o,'(sav:[[]sav:+/'+o ca:co -3+\30#4])
 o: o,'(sbv:[[]sbv:+/'+o cb:co -1+\30#4])

 m:m,'td:[[]td:@[m`d;&-29=m`d;-1]]
 o:o,'(select ot from m),'td:[[]td:@[m`d;&-29=m`d;-1]]
/ i:&2=o`ot;
 i:&2=m`ot;

/ Condition 1  - threshold is 0.2 for now
/c1a:i,'(0.2*o[i]`sav)<max'+o[i]ca; / max of 30-level volumes > cum. volume for ask
 c1a:(0.2*+/o[i]ca)<|/(o[i]ca); / max of 30-level volumes > cum. volume for ask
/c1b:i,'(0.2*o[i]`sbv)<max'+o[i]cb; / max of 30-level volumes > cum. volume for bid
 c1b:(0.2*+/o[i]cb)<|/(o[i]cb); / max of 30-level volumes > cum. volume for ask

/ Condition 2 - delta of prices > threshold( 1.0 for now )
/ ap:(+o (cols o)[-4+\30#4])[i] / ask prices
 ap:(o i)co[-4+\30#4]
/ bp:(+o (cols o)[-2+\30#4])[i] / bid prices
 bp:(o i)co[-2+\30#4]

 mid:((&/ap)+|/bp)%2.0 / mid-price

 apd:100*((+ap)-mid)%mid; bpd:100*((+bp)-mid)%mid
/ max of 30-level delta of price > threshold
 c2la:1<|/'apd; c2lb:1<|/'bpd

 fa:c1a,'c2la
 / ka:i,'&/'fa[;1 2] / if both conditions satisfied(1&2) - trigger condition 3
 ia:i@&&/'fa / if both conditions satisfied(1&2) - trigger condition 3
 / ika:ka[;0][&ka[;1]]
 fb:c1b,'c2lb
 / kb:i,'&/'fb[;1 2] / if both conditions satisfied(1&2) - trigger condition 3
 ib:i@&&/'fb / if both conditions satisfied(1&2) - trigger condition 3
 /ikb:kb[;0][&kb[;1]]
 
 ana:(+m `t`p)[ia-\:!200]
 anb:(+m `t`p)[ib-\:!200]

{c:&~x[;0]=0,-1_x[;0];kp:x[;1]@c;akp:avg kp:log abs 1_(0,-1_kp)%kp;kt:x[;0]@c;kt:1_(kt -(0,-1_kt));sqrt((+/(kp-akp)*(kp-akp)%kt)/(-1+#kt))}':ana



