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
45 print "test +, -, *, /"
46 print "a=";o;"+";o;"b=";a;"*";a;"c=";b;"-";o;"d=";c;"/";a;"e=";a;"^";b
47 print "a=";a;"b=";b;"c=";c;"d=";d:rem ---
255 end
