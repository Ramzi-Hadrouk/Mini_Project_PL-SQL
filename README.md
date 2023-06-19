# Mini_Project-_PL-SQL
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
La moyenne =  (note * coefficient) /  coefficients pour chaque étudiant. 

