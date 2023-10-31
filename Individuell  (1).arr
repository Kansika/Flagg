use context essentials2021
del1= (overlay-xy(square(100, "solid","red"), 110, 0, rectangle(30, 250, "solid", "blue")))
#variabelen "del1" er navnet på definsjoner eller en klasse. Alt som står i parantesen er definisjoner.

del2= (overlay-xy(del1, 150, 0, rectangle(180, 100, "solid", "red")))
#overlay gjør det enklere å overlappe ulike definisjoner.

#overlay-xy hjelper oss å plassere variabelen ved hjelp av x- og y-verdi som fungerer som kordinater.

del3=(overlay-xy(del2, 0, 110, rectangle(330, 30, "solid", "blue")))

del4= (overlay-xy(del3, 0, 150, square(100, "solid", "red")))

ferdig= (overlay-xy(del4, 150, 150, rectangle(180, 100, "solid", "red")))


ferdig