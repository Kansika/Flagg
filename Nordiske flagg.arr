use context essentials2021

#Funskjonen under lager en formel for flaggene, slik at man ikke trenger å skrive den samme koden flere ganger.(Kap 5.2.1). Når alle verdier og proposijoner er satt inn og formelen er ferdig, trenger man kun å skrive fargene man ønsker på flagget.

fun
  nordisk-flagg(kors-v-i, kors-l-i, kryss-v-y, kryss-l-y, main): 
  #Lagde forkortelse for de ulike verdiene, betydning: 
  #kors-v-i= Kors-vannrett-innerste
  #kors-l-i= kors-loddrett-innerste
  #kryss-v-y= kryss-vannrett-yterste
  #kryss-l-y= kryss.loddrett-yterste
  
  
  frame(
    overlay-xy(rectangle(400, 25, "solid", kors-v-i), 0, -115,
      #Bruker overlay-xy funksjonen for å overlappe figurene og for å plassere dem innefor rammen.
      #den blå vannrette linjen i norske flagget --->>
        
      overlay-xy(rectangle(22, 250, "solid", kors-l-i), 
        -132, 0, 
        #den blå lodrette linjen i norske flagget 
        
      
        overlay-xy(rectangle(400, 55, "solid", kryss-v-y), 
          0, -100,
          #den hvite vannrette linjen i norske flagget 
          
        overlay-xy(rectangle(52, 250, "solid", kryss-l-y), 
                -117, 0,
            #den hvite loddrette linjen i norske flagget 
            
              rectangle(400, 250, "solid", main))))))
  #main er bakgrunnen og den dekker hele figuren. Jeg satte den bakerst og puttet korset over, slik at den illustrerer de 4 boksene i flaggene.
end

NO = nordisk-flagg("dark-blue", "darkblue", "white", "white", "fire-brick" )

SE = nordisk-flagg( "gold", "gold", "gold", "gold","steelblue")

DK = nordisk-flagg("white", "white", "white", "white", "crimson")

IS = nordisk-flagg("crimson", "crimson", "white", "white", "navy")

FI = nordisk-flagg("darkblue", "darkblue", "darkblue", "darkblue", "white")

FRO = nordisk-flagg("red", "red", "dodger-blue","dodger-blue", "white")

AAL= nordisk-flagg( "crimson", "crimson","gold", "gold","steelblue")



NO
SE
DK
IS
FI
FRO
AAL