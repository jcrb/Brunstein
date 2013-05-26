Mémoire V.Brunstein - Préparation des données
========================================================

Données originales
------------------

```r
date()
```

```
## [1] "Thu May 23 19:15:56 2013"
```

```r
getwd()
```

```
## [1] "/home/jcb/Documents/CESU/Travaux/Brunstein/Brunstein"
```


1. 2013-03-28:
2. 2013-03-30:
3. 2013-04-20: nouvelle série de données (total 36 cas)
4. 2013-05-15: résultats 3: 82 questionnaire. L'odre et le nom des colonnes a été totalement modifié => nécessite de reécrire la programme. Abandon du programme en cours et création de Brunstein2.
5. 2013-05-21 Brunstein2: ne fonctionne qu'avec les données issues de *résultats enquête vs 3.0.xlsx*

Données transformées
--------------------
Les fichiers XLS sont enregistrés au format txt.csv sous le nom de *resultats.csv*. Un nouveau fichier remplace le fichier courant auquel on ajoute le suffixe *-n*, n allant de 1 à *x* de sorte que *resultats.csv* reste toujours le fichier actif.


```r
# cartudo: file<-'~/Bureau/Brunstein'
# file<-'~/Documents/CESU/Travaux/Brunstein-master' setwd(file)
library("HH")
library("gplots")
library(plyr)
```


Routines de l'université de Monash pour Likert:
source("~/Documents/Statistiques/Likert/monash/R/likert.R")

ATTENTION: pas compatible avec HH (même nom de fonction)
```

Chargement des donnnées:
------------------------

- na.strings="": permet de remplacer les cases vides par des NA
- strip.white = TRUE: élimine les blancs inutiles
- skip=1: la première ligne ne sert à rien
- colClasses="character": évite que F ne soit transformé en FALSE (sexe)

```r
data <- read.csv("resultats.csv", header = TRUE, sep = ",", na.strings = "", 
    strip.white = TRUE, skip = 1, colClasses = "character")
```

Meagling des données
--------------------
*! ATTENTION pb avec les caractères accentués sous windows*

```r
data$groupe <- as.factor(data$Groupe)
data$no <- as.integer(data$NumÃ.ro)
```

```
## Error: replacement has 0 rows, data has 83
```

```r
data$diplome <- as.factor(data$DiplÃ.me)
```

```
## Error: replacement has 0 rows, data has 83
```

```r
data$date_diplome <- as.integer(as.integer(data$Date))
data$sexe <- as.factor(data$Sexe)
data$travail <- as.factor(data$Lieu.exercice)
data$exp_urg <- as.factor(data$experience.urgence.1...oui.2...non)
data$conf_urg <- as.factor(data$confronté.situation.jamais...1.rarement...2.parfois...3.souvent...4)
data$last_urg_n <- as.factor(data$de.quand.date.dernière.situation.d.urgence)
data$last_urg_t <- as.factor(data$de.quand.date.dernière.situation.d.urgence.1)
data$formation <- as.factor(data$formation.urgence)
data$date_formation <- as.factor(data$date.derniere.formation.urgence)
```

Regrouppement des métiers: on constitue 3 groupes: AS et AP, IDE, Tous les autres:

```r
data$diplome[data$diplome == "AP"] <- "AS"
```

```
## Error: replacement has 0 rows, data has 83
```

```r
data$diplome[data$diplome != "AP" & data$diplome != "IDE"] <- "Autre"
```

```
## Error: replacement has 0 rows, data has 83
```


Suppression des colonnes redondantes: correspond aux colonnes 2,4 à 18

```r
data <- data[, c(-2, -4:-18)]
```


Nouvelle présentation
---------------------

```r
names(data)
```

```
##  [1] "X"                          "date"                      
##  [3] "A"                          "B"                         
##  [5] "C"                          "situation.depuis.formation"
##  [7] "A.après.formation"          "B.après.formation"         
##  [9] "C.après.formation"          "D"                         
## [11] "E"                          "F"                         
## [13] "G"                          "H"                         
## [15] "I"                          "J"                         
## [17] "K"                          "L"                         
## [19] "M"                          "N"                         
## [21] "Q1A"                        "Q1B"                       
## [23] "Q1C"                        "Q2A"                       
## [25] "Q2B"                        "Q2C"                       
## [27] "Q3A"                        "Q3B"                       
## [29] "Q3C"                        "Q4A"                       
## [31] "Q4B"                        "Q4C"                       
## [33] "Q5A"                        "Q5B"                       
## [35] "Q5C"                        "Q6A"                       
## [37] "Q6B"                        "Q6C"                       
## [39] "Q7A"                        "Q7B"                       
## [41] "Q7C"                        "Q8A"                       
## [43] "Q8B"                        "Q8C"                       
## [45] "Q9A"                        "Q9B"                       
## [47] "Q9C"                        "Tel"                       
## [49] "X.1"                        "X.2"                       
## [51] "X.3"                        "X.4"                       
## [53] "X.5"                        "groupe"                    
## [55] "date_diplome"               "sexe"                      
## [57] "travail"                    "exp_urg"                   
## [59] "conf_urg"                   "last_urg_n"                
## [61] "last_urg_t"                 "formation"                 
## [63] "date_formation"
```


Sauvegarde
----------

```r

write(data.frame(data), file = "Brunstein.Rdata")
```

```
## Error: argument 1 (type 'list') pas encore traité par cat
```

