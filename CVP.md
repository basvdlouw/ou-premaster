1a Java: 5 (Integer)
Haskell: 5 (Integer)

b Bool in Haskell is geen primitief type maar een samengesteld type.
boolean in Java is een primitief type.

c String in Java is een object. Dit type is niet recursief gedefinieerd. 
String in Haskell is een lijst van Characters [Char]. Dit is een recursief type

D class CarProduct {
    private int x;
    private int y;
}

E type DisVer = X Integer | Y Integer

2A Java is statisch getypeerd. Voorbeeld:
int temp = 5;
temp = "String" 

geeft een compile error.

2B Nee deze typen zijn niet equivalent. Bij Java wordt er gecheckt op naam-equivalentie en de gebruikte namen zijn niet equivalent. 

3A Het doel van een expressie is om een waarde te berekenen. Er zijn diverse neveneffecten die kunnen optreden. Er kan een waarde worden aangepast wat niet de bedoeling was, bijvoorbeeld een globale variable. Ook kan er een error optreden tijdens de uitvoering van een expressie waardoor het programma crasht.

B Kopieersemantiek houdt in dat een waarde gekopieerd wordt. 
Bijvoorbeeld:
List<Integer> lista = new ArrayList<>();
lista.add(5);
List<Integer> listb = lista
b heeft nu dezelfde waarde als a gekregen, maar dit is een kopie.
Als we nu dus b aanpassen
listb.remove(5);
Dan heeft a nog steeds de waarde [5] terwijl b een lege lijst is []

Referentiesemantiek houdt in dat een waarde niet gekopieerd wordt, maar dat er een pointer wordt aangemaakt en naar deze waarde toe wijst.
Bijvoorbeeld:
List<Integer> lista = new ArrayList<>();
lista.add(5);
List<Integer> listb = lista

listb is nu een referentie naar lista.
Als we nu dus listb aanpassen
listb.add(10)
dan heeft zowel lista als listb de waarde [5, 10]
listb is namelijk een referentie naar dezeflde lijst.

4a y krijgt de waarde 3. 

b y krijgt de waarde 7.

5a