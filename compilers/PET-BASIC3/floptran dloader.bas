    5 input"data file name";c$
    6 print"loading offset? 0{left}{left}{left}";:inputo
   10 open1,8,2,c$+",s,r":input#1,pc:print"begin at ";pc
   15 ifpc=0thenprint"bad read":close1:end
   20 get#1,a$:input#1,a:ifa>=0thenpokepc+o,a:pc=pc+1:goto20
   30 print"end at"pc-1
   40 get#1,a$:input#1,pc:ifpc<0thenclose1:end
   50 get#1,a$:input#1,a:pokepc+o,a:get#1,a$:input#1,a:pokepc+o+1,a:goto40
