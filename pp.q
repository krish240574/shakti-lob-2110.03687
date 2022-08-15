nl:30
k)co:(`$,/',/+$(`ap`as`bp`bs),/:\:$!nl)
k)cav:co -3+\nl#4; cbv:co -1+\nl#4; cap:co -4+\nl#4; cbp:co -2+\nl#4

/ Read order book and pre-processed message csvs here
o:(120#"F";enlist",")0:`:../SPY/ob.csv
m:("FISIFIII";enlist",")0:`:../SPY/m.csv
/ z-score normalisation of bp,price and volume
k)ap:+o cap;bp:+o cbp;av:+o cav; bv:+o cbv;
k)dap:dev'ap;dbp:dev'bp;dav:dev'av;dbv:dev'bv;
k)map:avg'ap;mbp:avg'bp;mav:avg'av;mbv:avg'bv;
k)nap:(ap[-1_1+!#ap]-map[-1_!#ap])%dap[-1_!#ap];nbp:(bp[-1_1+!#bp]-mbp[-1_!#bp])%dbp[-1_!#bp]
k)nav:(av[-1_1+!#av]-mav[-1_!#av])%dav[-1_!#av];nbv:(bv[-1_1+!#bv]-mbv[-1_!#bv])%dbv[-1_!#bv]

k)p:m`p;s:m`sz;np:(p[-1_1+!#p]-avg p)%dev p;ns:(s[-1_1+!#s]-avg s)%dev s
oc:`ot`td
t:select ot,td from m
ohc:ohc:raze {`$raze each string each x,/:asc distinct t[x]}each oc 
ohv:flip "i"$'(,/)each flip{k:t c x;flip (k=/:asc distinct k)}each til count c:cols t:select ot,td from m

/ final dataset contains normalised order book values and anomaly indicator binary column
f:(flip cap!flip nap),'(flip cbp!flip nbp),'(flip cav!flip nav),'(flip cbv!flip nbv),'(1_flip ohc!ohv),'1_select an from m
.Q.gc[]


