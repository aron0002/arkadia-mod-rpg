# Arkadia MOD RPG

## Co to jest?

Przeznaczeniem Arkadia MOD RPG jest rozbudowanie funkcji MUDa o dodatkowe elementy, ktorych brakuje w grze.
Technicznie rzecz biorac to plugin do mudletowych skryptow dla arkadia.rpg.pl.
Celem pluginu jest dodanie nowych elementow do gry i dzieki temu wzbogacenie gry o nowe funkcje pozwalajace bardziej rozbudowac RPG w grze.
MOD RPG ma byc zintegrowalny z arkadia, na tyle aby nie bylo widac roznicy ze jest to tylko dodatek.

Arkadia MOD RPG to wstepny prototyp, wiec nie ma sie wiele co spodziewac i trzeba liczyc sie z jakimis bledami.

Chodzilo mi glownie aby pokazac kilka drobnych mozliwosci w jakim kierunku mozna rozwinac gre bez bycia wizem.
Co z tego wyjdzie to sie zobaczy.


## Instalacja i deinstalacja

### Instalacja

```
/zainstaluj_plugin https://codeload.github.com/aron0002/arkadia-mod-rpg/zip/master
```
Nie ma obecnie automatycznej aktualizacji.

### Deinstalacja

```
/odinstaluj_plugin arkadia-mod-rpg
```


## Co zawiera plugin?

Plugin na chwile obecna dodaje graczom stan "nastroj" oraz ceche "zamoznosc".

### Cecha 'zamoznosc'
Zamoznosc to po prostu stan pieniedzy (w depozytach) jaka posiadamy w grze. Po zmianach ilosci monet w depozytach i uzyciu aliasa '/depozyt' aktualizuje sie poziom zamoznosci.
Ta cecha i jej progres pojawi sie po uzyciu komendy 'cechy'

### Stan 'nastroj'
Nastroj odzwieciedla sapomoczuie postaci. Na chwile obecna wplyw na nia maja kilka emocji arkowach uzytych przez gracza.
Oprocz tego jest ona powiazana z 'zamoznoscia', czyli wydawanie pieniedzy bedzie ja zmniejszac, a zarabianie zwiekszac.
Ten stan pojawi sie po uzyciu komendy 'stan'.

## Mozliwosci rozwoju

Na chwile obecna plugin pozwala dodawac (kodowo) nowe informacje, stany, jak i cechy postaci.
Jak narazie nic sie nigdzie bezposrednio nie zapisuje i plugin dziala praktycznie bezinwazyjnie na gre.

W zalozeniach jest dodananie mozliwosci ustawienia sobie wlasnych celow dla wirtualnych stanow/cech, tak aby kazdy gracz mogl sobie je sam wybierac.
Pomyslow na wirtualne "mierzalne" stany/cechy postaci moze byc wiele. Przyklady:
 - ilosc znalezionych ziol (jakiegos rodzaju) na sesje/pore roku itp. 
 - ilosc zarobionych pieniedzy na jakis okres czasu
 - ilosc danych/przyjetych lekcji nauczania jezyka
 
Wszystkie zmiany dotyczacych wirtualnych cech moga wplywac np. na nastroj czy inny wymyslony atrybut postaci.
