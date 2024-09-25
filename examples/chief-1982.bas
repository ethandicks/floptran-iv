3 let a=15
4 print "{clr}";
5 print tab(a);
6 print "CHIEF{down}{down}"
8 poke 59468,14
10 print "   I am Chief Numbers Freek, the great  Indian math God."
20 print "Are you ready to take the test you      called me out for? ";
30 gosub 600
40 if not a goto 60
50 print "{down}Shut up paleface with wise tongue."
60 print "{down}   Take a number and add 3. divide this by 5 and multiply by 8. divide ";
70 print "this by 5and add 5. finally, subtract 1."
80 print "{down}what do you have";
90 input b
100 let a=-4
101 c=b+a
102 let a=3.125
103 c=c*a
104 let a=3
105 c=c-a
110 print "I'll bet your number was";c;"."
115 print "Was I right? ";
120 gosub 600
130 if not a goto 500
140 print "{down}What was your original number";
150 input d 
155 let a=3 
157 e=d+a
160 let a=5
162 f=e/a
170 let a=8
172 g=f*a
180 let a=5
182 b=g/a
184 b=b+a
190 let h=1
192 c=b-h
200 print "So you think you're so smart, eh?"
210 print "Now watch."
230 print d;
232 print "plus 3 equals";
234 print e;
236 print "{left}.  This divided"
238 print "by 5 equals";
239 print f;
240 print "{left};this times 8 equals";
242 print g;
244 print "{left}."
245 print "If we divide by 5 and add 5, we get";
247 print b
250 print "which, minus 1 equals";
252 print c;
254 print "{left}."
260 print "Now do you believe me? ";
260 gosub 600 
290 if not a goto 500
295 print "{clr}      You have made me MAD."
300 print "There must be great lightning bolt."
330 let c=6
332 let a=21
334 a=c+a
340 print tab(a);
342 print "x x"
350 c=c-h
352 if c goto 332
360 let a=21
362 print tab(a);
364 print "x xxx"
370 a=a-h
372 print tab(a);
374 print "x   x"
380 a=a-h
382 print tab(a);
384 print "xxx x"
390 let c=8
392 let a=12
394 a=c+a
400 print tab(a);
402 print "x x"
410 c=c-h
412 if c goto 392
420 let a=12
422 print tab(a);
424 print "xx"
430 a=a-h
432 print tab(a);
434 print "x"
440 a=a-h
442 print tab(a);
444 print "*"
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
