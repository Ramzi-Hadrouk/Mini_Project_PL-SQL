# Mini Project PL-SQL  Master 1 _ RAMZI HADROUK 
UniversitéFerhat Abbas Sétif 0I <br>
Faculté des sciences, Département Informatique <br>
1ère année Master  <br> 

## Enoncé :
Le but de ce travail est de classer les étudiants de licence selon leurs moyennes obtenues à travers plusieurs épreuves dans plusieurs modules. 
Ensuite un processus d’affectation est effectué pour les orienter selon leurs choix et leurs moyennes en respectant le nombre de places disponibles pour chaque spécialité de master.
On considère le schéma relationnel suivant qui représente des Etudiants de master ainsi que leurs
notes dans différents modules avec les extensions suivantes :
#### ETUDIANT (Rang, Code_E, Nom, Prenom, Moyenne, Specialite)
#### MODULE (Code_M, Intitule, Coefficient)
#### NOTES (#Code_E, # Code_M, Note) 

#### ETUDIANT :
| Rang | Code_E | Nom    | Prenom  | Moyenne | Spécialité |
|------|--------|--------|---------|---------|------------|
|      | 10000  | N1     | p1      |         |            |
|      | 20000  | N2     | p2      |         |            |
|      | 30000  | N3     | p3      |         |            |
|      | 40000  | N4     | p4      |         |            |
|      | 50000  | N5     | p5      |         |            |
|      | 60000  | N6     | p6      |         |            |

#### MODULE:
| Code_M | Intitule                      | Coefficientte|
|--------|-------------------------------|--------------|
|   BDA  |   Base de données Avancée     |     2        |
|   PWA  |   Programmation web Avancée   |     2        |
|   MS   |   Modélisation est simulation |     3        |

#### NOTES :
| Code_E | Code_M | Note |
|--------|--------|------|
| 10000  | BDA    | 20   |
| 10000  | PWA    | 20   |
| 10000  | MS     | 20   |
| 20000  | BDA    | 10   |
| 20000  | PWA    | 10   |
| 20000  | MS     | 6    |
| 30000  | BDA    | 4    |
| 30000  | PWA    | 4    |
| 30000  | MS     | 0    |
| 40000  | BDA    | 20   |
| 40000  | PWA    | 20   |
| 40000  | MS     | 20   |
| 50000  | BDA    | 0    |
| 50000  | PWA    | 0    |
| 50000  | MS     | 0    |
| 60000  | BDA    | 1    |
| 60000  | PWA    | 2    |
| 60000  | MS     | 3    |

## Questions :
* **A-** À l’aide de SQL*Plus, créer les 03 tables (ETUDIANT, MODULE, NOTES) en spécifiant les
contraintes d’intégrité (clé, clés étrangères, …).
* **B-**  Insérez les enregistrements comme indiqué dans l’extension des tables.
* **C-** Ecrire un trigger permettant de vérifier qu’une note insérée doit appartenir à l’intervalle [0,20].
Au cas où la note dépasse l’intervalle, on doit avoir un message d’erreur.
* **D-** Ecrire un curseur permettant de Calculer la moyenne de chaque étudiant dans la table ETUDIANT
(à partir de la table Notes). Le curseur doit également Ordonner la table ETUDIANT selon l’ordre
décroissant des notes en insérant le numéro de rang de chaque étudiant comme suit (Les étudiants
ayant la même moyenne doivent avoir le même rang) :
#### La moyenne = Σ (note * coefficient) / Σ coefficients pour chaque étudiant.

| Rang | Code_E | Nom | Prenom | Moyenne | Spécialité |
| ---- | ------ | --- | ------ | ------- | ---------- |
| 1    | 10000  | N1  | P1     | 20      |            |
| 1    | 40000  | N4  | P4     | 20      |            |
| 3    | 20000  | N2  | P2     | 8.28    |            |
| 4    | 30000  | N3  | P3     | 2.28    |            |
| 5    | 60000  | N6  | P6     | 2.14    |            |
| 6    | 50000  | N5  | P5     | 0       |            |

* **E-** Soit la table choix qui représente les différents choix des étudiants :
#### CHOIX (#Code_E, Choix1, Choix2, Choix3) 

| Code_E | Choix1 | Choix2 | Choix3 |
|-------:|--------|--------|--------|
| 10000  | RSD    | IDTW   | IFIA   |
| 20000  | RSD    | IDTW   | IFIA   |
| 30000  | RSD    | IDTW   | IFIA   |
| 40000  | RSD    | IDTW   | IFIA   |
| 50000  | RSD    | IDTW   | IFIA   |
| 60000  | RSD    | IDTW   | IFIA   |

Créez la table choix et insérez ses enregistrements.
Modifier les notes de l’étudiant 40000 comme suit et recalculez la moyenne :
BDA : 10
PWA : 10
MS : 10
Créez une table **Master** qui a le même schéma que la table ETUDIANT.
Ecrire un **deuxième curseur** qui permet de copiez les enregistrements de la table ETUDIANT dans la
table MASTER en **affectant la spécialité** (à travers le parcours de la table CHOIX) pour chaque étudiant
selon le nombre de places limites comme suit : 

| Rang | Code_E | Nom | Prenom | Moyenne | Specialite |
|------|--------|-----|--------|---------|------------|
| 1    | 10000  | N1  | P1     | 20      | RSD        |
| 4    | 40000  | N4  | P4     | 10      | RSD        |
| 3    | 20000  | N2  | P2     | 8.28    | IDTW       |
| 4    | 30000  | N3  | P3     | 2.28    | IDTW       |
| 5    | 60000  | N6  | P6     | 2.14    | IFIA       |
| 6    | 50000  | N5  | P5     | 0       | IFIA       |

**Remarque 1 :** le nombre de places est limité à 02 étudiants par spécialité. <br> 
**Remarque 2 :** l’affectation des spécialités est dynamique c’est-à-dire si on change la moyenne, 
l’affectation change (le résultat du curseur change). <br> 
**Remarque 3 :** Le curseur doit affecter les spécialités selon la table des choix et le nombre de places
disponibles. <br> 

