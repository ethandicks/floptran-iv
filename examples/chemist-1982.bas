1 print "{clr}";
3 let a=15:print tab(a);"CHEMIST{down}{down}{down}"
5 poke 59468,14
10 print "   The fictitious chemical KRYPTOCYANIC{$a0}acid can only be diluted by the ";
20 print "ratio of7 parts water to 3 parts acid.  If any"
30 print "other ratio is attempted, the acid will become unstable, and then ";
40 print "explode. Giventhe amount of acid, you must decide how much water";
50 print " to add for dilution."
80 let o=1
82 let t=9
84 let s=7
86 let e=3
100 let a=50
102 f=rnd(o)
104 f=f*a
106 f=int(f)
110 a=s*f
112 w=a/e
120 print "{down}";
122 print f;
124 print "liters of acid, how much water";
130 input r
140 d=w-r
142 d=abs(d)
150 let a=20
152 w=w/a
153 a=w-d
154 a=sgn(a)
156 a=a+o
158 if not a goto 200
160 print "{down}Good job! You may breathe now, but don'tinhale the fumes.{down}"
180 goto 100
200 print "{down}SIZZLE!  You have just been desalinated into a mass of protoplasm."
220 t=t-o
230 if not t goto 253
240 print "However, you may try with another life."
250 goto 100
253 print "{down}{down}   Your nine lives have been used, but  you will be long remembered";
254 print " for your    contributions to the field of comic bookchemistry."
255 return
