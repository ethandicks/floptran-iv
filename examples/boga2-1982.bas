8 let a=13
10 print "{clr}";tab(a);"boga ][{down}{down}{down}"
12 let b=0
14 let c=1 
16 d=c
70 print "  the boga is hiding on a 15 by 15 grid.";
80 print "try to  guess his position using the    hints that i give you.";
100 print "  please remember the boga is also looking for you."
220 e=b
240 f=c
250 g=b
260 let h=15
280 i=h
390 let j=2
400 print "{down}pick your position"
402 input k
404 input l
411 if k<b goto 400
412 if l<b goto 400
413 if h<k goto 400
414 if h<l goto 400
420 print "{down}the boga picks his position."
440 m=rnd(c) 
442 m=m*h
444 m=int(m)
450 n=rnd(c) 
452 n=n*h
454 n=int(n)
460 print "guess #";
462 print f
470 input o:input p
471 if o<b goto 460
472 if p<b goto 460
473 if h<o goto 460
474 if h<p goto 460
480 f=f+c
490 g=g+c
500 let a=10
501 if f=a goto 1040
510 if not m=o goto 540
512 if not n=p goto 540
514 goto 1010 
540 print "{down}he's more to the ";
550 if m=o goto 620
560 if o<m goto 600
570 print "north";
590 goto 620
600 print "south";
620 if n=p goto 700
630 if p<n goto 670
640 print "west."
660 goto 700
670 print "east."
700 print "{down}":if not d goto 730
710 let a=0.5
712 q=i*a
714 q=int(q)
720 r=q
730 print "boga guesses";q;"{left},";r;"{left}."
740 e=e+c
750 print
760 if not q=k goto 780
762 if not r=l goto 780
770 goto 980
780 d=b
790 if q=l goto 880
800 s=c
810 a=j
812 t=r-l
814 t=abs(t)
816 if t<a goto 830
820 gosub 1140
830 if r<l goto 860
840 r=r-s
842 r=abs(r)
844 r=int(r)
850 goto 880
860 r=r+s
862 r=abs(r)
864 r=int(r)
870 if h<r goto 1110
880 if q=k goto 970
890 s=c
900 a=j 
902 t=q-k
904 t=abs(t)
906 if t<a goto 920
910 gosub 1140
920 if q<k goto 950
930 q=q-s
932 q=abs(q)
934 q=int(q)
940 goto 970
950 q=q+s
952 q=abs(q)
954 q=int(q)
960 if h<q gosub 1130
970 goto 460
980 print "the boga found you in";e;"guess";
982 if e=c goto 986
984 print "es";
986 print "."
1000 goto 1050
1010 print "you found the boga in";g;"guess";
1012 if g=c goto 1016
1014 print "es";
1016 print "."
1030 goto 1050
1040 print "you used up all your guesses."
1050 print "the boga was at";m;"{left},";n;"{left}."
1070 end
1110 let a=0.5
1112 r=h*a
1120 goto 880
1130 let a=0.5
1132 q=h*a
1140 s=j
1150 return
