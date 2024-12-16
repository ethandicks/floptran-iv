0 rem 0d 04 0a 00 9e 28 31 30 33 39 29 00 00 00
1 rem --- test rem noop dash and direct hex output
10 rem floptran-iv+ test suite for pet
20 let z=0:rem --- test let and dynamic variable table
21 o=1:rem --- test 1 as special variable
30 print "{clr}":rem --- test print single char 
31 print "{home}";:rem --- test semicolon no crlf
32 print "floptran iv+ feature test{down}":rem ---
40 a=o+o:rem ---
41 b=a*a:rem ---
42 c=b-o:rem ---
43 d=c/a:rem ---
44 e=a^b:rem ---
45 print "test +, -, *, /, ^"
46 print "a=";o;"+";o;"b=";a;"*";a;"c=";b;"-";o;"d=";c;"/";a;"e=";a;"^";b
47 print "a=";a;"b=";b;"c=";c;"d=";d:rem ---
50 f=sgn(a):rem ---
51 g=int(d):rem ---
52 h=abs(a):rem ---
53 rem
54 i=fre(0):rem ---
55 j=pos(0):rem ---
56 k=sqr(b):rem ---
57 l=rnd(0):rem ---
57 m=log(a):rem ---
58 n=exp(m):rem ---
59 o=cos(~):rem ---
60 p=sin(~):rem ---
61 r=tan(~):rem ---
62 s=atn(~):rem ---
63 t=peek(0):rem ---
64 print "test math functions"
65 print "sgn(";a;")=";f:rem ---
66 print "int(";d;")=";g:rem ---
67 print "abs(";a;")=";h:rem ---
68 print "usr(0) not tested"
69 print "fre(0)=";i:rem ---
70 print "pos(0)=";j:rem ---
71 print "sqr(";b;")=";k:rem ---
72 print "rnd(0)=";l:rem ---
73 print "log(";a;")=";m:rem ---
74 print "exp(";m;")=";n:rem ---
75 print "cos(~)=";o:rem ---
76 print "sin(~)=";p:rem ---
77 print "tan(~)=";r:rem ---
78 print "atn(~)=";s:rem ---
79 print "peek(0)=";t:rem ---
255 end
