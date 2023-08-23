    5 input"data file name";c$
    6 print"loading offset? 0{left}{left}{left}";:inputo
   10 open1,8,2,c$+",s,r":input#1,a$:pc=val(a$):print"begin at ";pc
   15 ifpc=0thenprint"bad read":close1:end
   20 input#1,a$:a=val(mid$(a$,2)):ifa>=0thenpokepc+o,a:pc=pc+1:goto20
   30 print"end at"pc-1
   40 input#1,a$:pc=val(mid$(a$,2)):ifpc<0thenclose1:end
   50 input#1,a$:pokepc+o,val(mid$(a$,2))
   60 input#1,a$:pokepc+o+1,val(mid$(a$,2)):goto40
