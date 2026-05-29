# ProveIT 2024 - Simulink Control Plant 🚀

Acest repository conține soluția dezvoltată pe parcursul unui hackathon tehnic de 24 de ore (ProveIT 2024). Proiectul se axează pe proiectarea, modelarea și simularea unui sistem complex ("plant") în mediul Simulink, având ca scop principal implementarea și validarea unui algoritm de control robust. [1]

## 📌 Descrierea Proiectului

Sistemul modelează comportamentul unui echipament de conversie a puterii și integrează tehnici de procesare a semnalelor, mașini de stări pentru managementul operării și o buclă de control avansată. La nivelul algoritmului de control, arhitectura utilizează un controler de tip PI (Proporțional-Integral) cu performanțe specifice: bucla interioară este acordată la o lățime de bandă de 1200 rad/s, în timp ce bucla exterioară operează la 120 rad/s, sistemul având o marjă de fază de 85°. Aceste caracteristici asigură o stabilitate ridicată și un răspuns dinamic optim în regim tranzitoriu. [2]

## 📂 Structura Repository-ului și Fișiere

- **`PFC_Plant_2022b_final.slx`**: Modelul principal Simulink. Reprezintă sistemul final, integrând toate subsistemele (procesarea semnalelor, controlul și logica stărilor) într-un model unificat, cel mai probabil orientat spre Power Factor Correction (PFC).
- **`Signal_Processing.slx`**: Subsistem independent ce conține algoritmul de filtrare și extragere a caracteristicilor semnalelor brute.
- **`State_machine.slx`**: Modelul care descrie logica de control secvențial al stărilor prin care poate trece sistemul în timpul operării.
- **`preh.m`**: Script MATLAB responsabil cu inițializarea parametrilor, setarea variabilelor de mediu și definirea constantelor (ex. frecvențe, câștiguri, timpi de eșantionare) necesare înainte de a rula modelele `.slx`.

## ⚙️ Etapele Dezvoltării

Arhitectura proiectului a fost împărțită în 3 direcții majore:

### 1. Procesarea Semnalelor (Signal Processing)
În această etapă s-a dezvoltat un subsistem de la zero, utilizând exclusiv blocuri elementare din Simulink pentru a menține un control strict asupra operațiilor matematice și a eficienței computaționale. Componentele principale includ:
- **Identificator de frecvență a rețelei (Grid Frequency Identifier):** Monitorizează semnalul de intrare pentru a asigura sincronizarea corectă cu rețeaua.
- **Modul RMS:** Un subsistem dedicat care calculează continuu valoarea efectivă (Root Mean Square) a semnalelor de interes.
- **Filtru Trece-Bandă Discret:** Esențial pentru atenuarea zgomotelor de înaltă frecvență și extragerea doar a componentelor de semnal relevante.

### 2. Mașina de Stări (State Machine)
Pentru un management sigur al operării, s-a implementat un subsistem logic ce monitorizează condițiile procesului și dictează starea curentă de funcționare. Ieșirea acestui modul este un mesaj/flag care asignează sistemul într-una din următoarele 4 stări:
- **Idle:** Sistemul este alimentat, dar se află în așteptare.
- **Pre-charge:** Mod de pre-încărcare, crucial pentru limitarea supracurenților de pornire (inrush currents) și protejarea componentelor.
- **Charging:** Regimul nominal de funcționare activă / încărcare.
- **Error:** Mod de protecție declanșat în momentul detectării unei anomalii în rețea sau în interiorul plant-ului.

### 3. Identificarea Sistemului (System Identification)
*Etapă aflată în dezvoltare.* Implică obținerea unui model matematic precis al plant-ului (funcție de transfer) pe baza răspunsului la diverse semnale de test. Această identificare este necesară pentru o acordare cât mai fină a parametrilor regulatorului și pentru testarea limitelor de stabilitate. [3]

## 🛠️ Tehnologii și Instrumente Utilizate
- **MATLAB** (Scripting, procesare de date)
- **Simulink** (Proiectare bazată pe model, utilizarea blocurilor elementare, subsisteme)

---
**Referințe:**
[1] Documentația generală și obiectivele tehnice ale hackathon-ului ProveIT 2024.
[2] Parametrii specifici de design și stabilitate ai arhitecturii controlerului PI (BW interior/exterior și marja de fază).
[3] Concepte standard pentru modelarea, simularea și identificarea sistemelor de control automat.
