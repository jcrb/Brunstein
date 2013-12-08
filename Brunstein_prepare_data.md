Mémoire V.Brunstein - Préparation des données
========================================================

Données originales
------------------

```r
date()
```

```
## [1] "Sat Dec  7 12:48:55 2013"
```

```r
getwd()
```

```
## [1] "/home/jcb/Documents/CESU/Brunstein"
```


1. 2013-03-28:
2. 2013-03-30:
3. 2013-04-20: nouvelle série de données (total 36 cas)
4. 2013-05-15: résultats 3: 82 questionnaire. L'odre et le nom des colonnes a été totalement modifié => nécessite de reécrire la programme. Abandon du programme en cours et création de Brunstein2.
5. 2013-05-21 Brunstein2: ne fonctionne qu'avec les données issues de *résultats enquête vs 3.0.xlsx*
6. 2013-12-05 nouvelle version avec le fichier *résultats enquête vs 4.0 sept 2013.xlsx*

Données transformées
--------------------
Création d'un fichier *resultats.csv* à partir du fichier original *résultats enquête vs 4.0 sept 2013.xlsx*:
- suprression des colonnes BM1 à BQ1
- suppression des lignes audela de 146

Les fichiers XLS sont enregistrés au format txt.csv sous le nom de *resultats.csv*. Un nouveau fichier remplace le fichier courant auquel on ajoute le suffixe *-n*, n allant de 1 à *x* de sorte que *resultats.csv* reste toujours le fichier actif.


```r
# cartudo: file<-'~/Bureau/Brunstein'
# file<-'~/Documents/CESU/Travaux/Brunstein-master' setwd(file)
library("HH")
```

```
## Error: there is no package called 'HH'
```

```r
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
- Toutres les colones doivent avoir un nom
- deux colonnes ne doivent pas avoir le même nom

```r
data$groupe <- as.factor(data$Groupe)
data$no <- as.integer(data$Numéro)
data$diplome <- as.factor(data$Diplôme)
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
data$diplome <- as.character(data$diplome)
data$diplome[data$diplome == "AP"] <- "AS"
data$diplome[data$diplome != "AS" & data$diplome != "IDE"] <- "Autre"
data$diplome <- as.factor(data$diplome)
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
##  [1] "Groupe"                     "Numéro"                    
##  [3] "B"                          "C"                         
##  [5] "situation.depuis.formation" "A.après.formation"         
##  [7] "B.après.formation"          "C.après.formation"         
##  [9] "D"                          "E"                         
## [11] "F"                          "G"                         
## [13] "H"                          "I"                         
## [15] "J"                          "K"                         
## [17] "L"                          "M"                         
## [19] "N"                          "Q1A"                       
## [21] "Q1B"                        "Q1C"                       
## [23] "Q2A"                        "Q2B"                       
## [25] "Q2C"                        "Q3A"                       
## [27] "Q3B"                        "Q3C"                       
## [29] "Q4A"                        "Q4B"                       
## [31] "Q4C"                        "Q5A"                       
## [33] "Q5B"                        "Q5C"                       
## [35] "Q6A"                        "Q6B"                       
## [37] "Q6C"                        "Q7A"                       
## [39] "Q7B"                        "Q7C"                       
## [41] "Q8A"                        "Q8B"                       
## [43] "Q8C"                        "Q9A"                       
## [45] "Q9B"                        "Q9C"                       
## [47] "Tel"                        "groupe"                    
## [49] "no"                         "diplome"                   
## [51] "date_diplome"               "sexe"                      
## [53] "travail"                    "exp_urg"                   
## [55] "conf_urg"                   "last_urg_n"                
## [57] "last_urg_t"                 "formation"                 
## [59] "date_formation"
```


Sauvegarde
----------

```r
# write.table(data,'Brunstein.Rdata',sep=',',quote=TRUE,na='NA')
save(data, file = "Brunstein.Rdata")
```

