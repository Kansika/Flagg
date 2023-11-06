use context essentials2021
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
#Tabellen fra google docs
include gdrive-sheets
include data-source


ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

#Den tomme strengen ("") blir ikke sett på som en gyldig verdi. Derfor ersattet vi den tomme verdien med "0" for at tabellen blir lesbar i Pyret. (Kap 8.1.2). 



kWh-wealthy-consumer-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer 
    sanitize komponent using string-sanitizer
end

#Sanatize er Pyret som prøver å gjøre googledocs tabellen lesbar i deres program. Den "vasker"/"saniterer" infomasjonen slik at den er forstålige i pyret. 



print(kWh-wealthy-consumer-data)


#Funksjonen under gjøre tekststring til tall. I dette tilfellet gir "fly" en verdi på "30".  
fun energi-to-number(str :: String) -> Number:
  doc: "if str is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
energi-to-number("") is 0
  energi-to-number("12") is 12
end

#"where" så gir vi eksempel på hvordan funksjonen skal svare. Med dennne funksjonen kan CPO se om du har gjort noe endringer på funksjonen som ikke samsvarer med eksemplet. (Kap 5.4)


#Tabell hvor det er tall og ikke string
transformed-table = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

print(transformed-table)


#Denne funksjonen beregner energiforbruket for bilbruken i tabellen  
fun car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
(distance-travelled-per-day / 
                            distance-per-unit-of-fuel) * 
                                        energy-per-unit-of-fuel
where:
  car-energi-per-day(15, 5, 6) is 18
end

distance-travelled-per-day = 15
distance-per-unit-of-fuel = 5
energy-per-unit-of-fuel = 6



#Ny funksjon som viser riktig visualisering av energiforbruk for bil
fun energi-to-number-with-car(str :: String) -> Number:
   cases(Option) string-to-number(str):
    | some(a) => a
    | none => car-energi-per-day(15, 5, 6)
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
end

#Siste versjon 
transformed-table-with-car = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)

print(transformed-table-with-car)

#Siste versjon av bilforbruket visualisert
bar-chart(transformed-table-with-car, "komponent", "energi")


