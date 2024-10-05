0 rem 0d 04 0a 00 9e 28 31 30 33 39 29 00 00 00
3 let a=15:print "{clr}";tab(a);"CHIEF{down}{down}"
8 poke 59468,14
10 print "   I am Chief Numbers Freek, the great  Indian math God."
20 print "{down}Are you ready to take the test you      called me out for? ";
30 gosub 600
40 if not a goto 60
50 print "{down}Shut up paleface with wise tongue."
60 print "{down}   Take a number and add 3. divide this by 5 and multiply by 8. Divide ";
70 print "this by 5and add 5. Finally, subtract 1."
80 print "{down}what do you have";
90 input b
100 let a=-4
101 c=b+a
102 let a=3.125
103 c=c*a
104 let a=3
105 c=c-a
110 print "{down}I'll bet your number was";c;"{left}."
115 print "Was I right? ";
120 gosub 600
130 if not a goto 500
140 print "{down}What was your original number";
150 input k
155 let a=3 
157 f=k+a
160 let a=5
162 g=f/a
170 let a=8
172 h=g*a
180 let a=5
182 b=h/a
184 b=b+a
190 let o=1
192 c=b-o
200 print "{down}So you think you're so smart, eh?"
210 print "Now watch."
230 print k;"plus 3 equals";f;"{left}.  This divided"
235 print "by 5 equals";g;
240 print "{left}; this times 8 equals";h;"{left}."
245 print "If we divide by 5 and add 5, we get";b
250 print "which, minus 1 equals";c;"{left}."
260 print "{down}Now do you believe me? ";
260 gosub 600 
290 if not a goto 500
295 print "{clr}      You have made me MAD."
300 print "There must be great lightning bolt."
330 let c=6
332 let a=21
334 a=c+a
340 print tab(a);"x x"
350 c=c-o
352 if c goto 332
360 let a=21
362 print tab(a);"x xxx"
370 a=a-o
372 print tab(a);"x   x"
380 a=a-o
382 print tab(a);"xxx x"
390 let c=8
392 let a=12
394 a=c+a
400 print tab(a);"x x"
410 c=c-o
412 if c goto 392
420 let a=12
422 print tab(a);"xx"
430 a=a-o
432 print tab(a);"x"
440 a=a-o
442 print tab(a);"*"
450 print "{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}{CBM-T}";
480 goto 520
500 print "{down}Bye!!!"
520 return
600 let a=89
610 poke 167,0
620 get c
630 if not c goto 620
640 poke 167,1
650 a=c-a
660 print chr$(c)
670 return
