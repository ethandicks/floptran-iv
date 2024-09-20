0 rem 0d 04 0a 00 9e 28 31 30 33 39 29 00 00 00
1 poke 59467,16
2 poke 59464,0
3 poke 59466,10
5 let a=13
10 print "{clr}";tab(a);"sine wave{down}"
50 let z=0
60 let o=1
62 let s=0.25
64 let e=40
68 let f=18
110 b=z:t=z
112 let i=3
114 let j=2.5
120 k=sin(t)
122 k=k*f
124 k=k+f
126 k=int(k)
128 l=k+e
129 poke 59464,l
130 print tab(k);
140 if b goto 180
150 print "sine"
160 b=o
154 goto 200
180 print "wave"
190 b=z
200 t=t+s
222 if not t>e goto 120
224 t=j
226 goto 120
