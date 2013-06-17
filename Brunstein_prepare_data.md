Mémoire V.Brunstein - Préparation des données
========================================================

Données originales
------------------

```r
date()
```

```
## [1] "Mon Jun 17 22:34:44 2013"
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

```
## Error: more columns than column names
```

Meagling des données
--------------------
*! ATTENTION pb avec les caractères accentués sous windows*

```r
data$groupe <- as.factor(data$Groupe)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$no <- as.integer(data$Numéro)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$diplome <- as.factor(data$Diplôme)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$date_diplome <- as.integer(as.integer(data$Date))
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$sexe <- as.factor(data$Sexe)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$travail <- as.factor(data$Lieu.exercice)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$exp_urg <- as.factor(data$experience.urgence.1...oui.2...non)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$conf_urg <- as.factor(data$confronté.situation.jamais...1.rarement...2.parfois...3.souvent...4)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$last_urg_n <- as.factor(data$de.quand.date.dernière.situation.d.urgence)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$last_urg_t <- as.factor(data$de.quand.date.dernière.situation.d.urgence.1)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$formation <- as.factor(data$formation.urgence)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$date_formation <- as.factor(data$date.derniere.formation.urgence)
```

```
## Error: objet de type 'closure' non indiçable
```

Regrouppement des métiers: on constitue 3 groupes: AS et AP, IDE, Tous les autres:

```r
data$diplome <- as.character(data$diplome)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$diplome[data$diplome == "AP"] <- "AS"
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$diplome[data$diplome != "AS" & data$diplome != "IDE"] <- "Autre"
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$diplome <- as.factor(data$diplome)
```

```
## Error: objet de type 'closure' non indiçable
```


Suppression des colonnes redondantes: correspond aux colonnes 2,4 à 18

```r
data <- data[, c(-2, -4:-18)]
```

```
## Error: objet de type 'closure' non indiçable
```


Nouvelle présentation
---------------------

```r
names(data)
```

```
## NULL
```


Sauvegarde
----------

```r
# write.table(data,'Brunstein.Rdata',sep=',',quote=TRUE,na='NA')
save(data, file = "Brunstein.Rdata")
```

