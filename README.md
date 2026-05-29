# ProveIT 2024 - Simulink PFC Control Plant

## 📌 Descrierea Proiectului
Acest proiect a fost dezvoltat în cadrul competiției de 24 de ore ProveIT 2024. Scopul principal este dezvoltarea software-ului de control și simularea unui circuit de corecție a factorului de putere (PFC) pentru aplicații auto (de exemplu, încărcătoare la bord pentru vehicule electrice). Sistemul a fost conceput și simulat utilizând mediul de dezvoltare MATLAB & Simulink.

## 📂 Structura Repository-ului
Arhitectura aplicației este structurată în următoarele fișiere principale:

* **`PFC_Plant_2022b_final.slx`**: Modelul principal de simulare, care integrează comportamentul convertorului PFC și aplică algoritmii de control.
* **`Signal_Processing.slx`**: Un modul dedicat procesării semnalelor. Construit cu ajutorul blocurilor elementare, acesta extrage și filtrează informațiile vitale (ex. frecvența rețelei, calcul RMS, filtru trece-bandă discret).
* **`State_machine.slx`**: Subsistemul care definește design-ul logic al aplicației. Implementează mașina de stări a sistemului, gestionând tranzițiile și erorile pe parcursul operării.
* **`preh.m`**: Scriptul de inițializare MATLAB, utilizat pentru declararea parametrilor, limitelor de siguranță și a mediului de lucru înainte de execuția modelelor Simulink.

## ⚙️ Obiective Tehnice și Funcționalități
Proiectul vizează atingerea a trei direcții majore conform cerințelor competiției:

### 1. Design Arhitectural și Logic (Mașina de Stări)
* Implementarea stărilor de bază de funcționare (ex. *Idle*, *Charging*).
* Gestiunea și manipularea eficientă a erorilor de sistem (Error Handling).
* Definirea interfețelor și validarea comportamentului.

### 2. Identificarea Sistemului
* Înțelegerea modului de operare a convertorului PFC.
* Identificarea funcției de transfer pentru o corectă caracterizare a sistemului (Plant Identification).

### 3. Algoritmul de Control
* Controlul curentului alternativ (AC), esențial pentru funcția de corecție a factorului de putere.
* Controlul și reglajul tensiunii de pe magistrala de curent continuu (DC Link).
* Optimizarea buclei de control (Closed Loop Control Design).

## 📊 Specificații și Limite de Operare (Boundary Definition)
Sistemul a fost proiectat respectând strict următoarele condiții tehnice impuse:

* **Putere maximă**: 11 kW
* **Domeniu tensiune de intrare AC**: 185 - 265 V
* **Domeniu frecvență AC**: 45 - 65 Hz
* **Curent maxim de intrare AC**: 16 A RMS
* **Domeniu tensiune DC**: 600 - 800 V
* **Curent maxim DC**: 18 A
* **Temperatură ambientală de operare**: -40 °C ... +85 °C
* **Temperatură maximă admisă a plant-ului**: 150 °C
