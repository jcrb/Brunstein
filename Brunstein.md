Données mémoire V.Brunstein
========================================================

Données originales
------------------

1. 2013-03-28:
2. 2013-03-30:
3. 2013-04-20: nouvelle série de données (total 36 cas)

Données transformées
--------------------
Les fichiers XLS sont enregistrés au format txt.csv sous le nom de *resultats.csv*. Un nouveau fichier remplace le fichier courant auquel on ajoute le suffixe *-n*, n allant de 1 à *x* de sorte que *resultats.csv* reste toujours le fichier actif.


```r
# cartudo: file<-'~/Bureau/Brunstein'
file <- "~/Documents/CESU/Travaux/Brunstein"
setwd(file)
library("HH", lib.loc = "/home/jcb/R/x86_64-pc-linux-gnu-library/2.15")
```

```
## Loading required package: lattice
```

```
## Loading required package: grid
```

```
## Loading required package: multcomp
```

```
## Loading required package: mvtnorm
```

```
## Loading required package: survival
```

```
## Loading required package: splines
```

```
## Loading required package: leaps
```

```
## Loading required package: RColorBrewer
```

```
## Loading required package: latticeExtra
```

```
## Loading required package: reshape
```

```
## Loading required package: plyr
```

```
## Attaching package: 'reshape'
```

```
## The following object(s) are masked from 'package:plyr':
## 
## rename, round_any
```

```
## Loading required package: colorspace
```

```r
library("gplots", lib.loc = "/home/jcb/R/x86_64-pc-linux-gnu-library/2.15")
```

```
## Loading required package: gtools
```

```
## Attaching package: 'gtools'
```

```
## The following object(s) are masked from 'package:HH':
## 
## logit
```

```
## Loading required package: gdata
```

```
## gdata: read.xls support for 'XLS' (Excel 97-2004) files ENABLED.
```

```
## ```

```
## gdata: read.xls support for 'XLSX' (Excel 2007+) files ENABLED.
```

```
## Attaching package: 'gdata'
```

```
## The following object(s) are masked from 'package:HH':
## 
## case
```

```
## The following object(s) are masked from 'package:stats':
## 
## nobs
```

```
## The following object(s) are masked from 'package:utils':
## 
## object.size
```

```
## Loading required package: caTools
```

```
## Loading required package: KernSmooth
```

```
## KernSmooth 2.23 loaded Copyright M. P. Wand 1997-2009
```

```
## Loading required package: MASS
```

```
## Attaching package: 'gplots'
```

```
## The following object(s) are masked from 'package:HH':
## 
## residplot
```

```
## The following object(s) are masked from 'package:stats':
## 
## lowess
```


Routines de l'université de Monash pour Likert:
source("../Doc Cartudo/Statistiques/LIKERT/Likert et R/monash/R/likert.R")

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

```r
groupe <- as.factor(data$Groupe)
no <- as.integer(data$Numéro)
diplome <- as.factor(data$Diplôme)
date_diplome <- as.integer(2013 - as.integer(data$Date))
sexe <- as.factor(data$Sexe)
travail <- as.factor(data$Lieu.exercice)
exp_urg <- as.factor(data$experience.urgence.1...oui.2...non)
conf_urg <- as.factor(data$confronté.situation.jamais...1.rarement...2.parfois...3.souvent...4)
last_urg_n <- as.factor(data$de.quand.date.dernière.situation.d.urgence)
last_urg_t <- as.factor(data$de.quand.date.dernière.situation.d.urgence.1)
formation <- as.factor(data$formation.urgence)
date_formation <- as.factor(data$date.derniere.formation.urgence)
```

Nouvelle présentation
---------------------

```r
names(data)
```

```
##  [1] "X"                                                                  
##  [2] "Groupe"                                                             
##  [3] "date"                                                               
##  [4] "Numéro"                                                             
##  [5] "Diplôme"                                                            
##  [6] "Date"                                                               
##  [7] "Sexe"                                                               
##  [8] "Lieu.exercice"                                                      
##  [9] "experience.urgence.1...oui.2...non"                                 
## [10] "Date.debut"                                                         
## [11] "date.fin"                                                           
## [12] "confronté.situation.jamais...1.rarement...2.parfois...3.souvent...4"
## [13] "de.quand.date.dernière.situation.d.urgence"                         
## [14] "de.quand.date.dernière.situation.d.urgence.1"                       
## [15] "formation.urgence"                                                  
## [16] "date.derniere.formation.urgence"                                    
## [17] "date.derniere.formation.urgence.1"                                  
## [18] "A"                                                                  
## [19] "B"                                                                  
## [20] "C"                                                                  
## [21] "D"                                                                  
## [22] "E"                                                                  
## [23] "F"                                                                  
## [24] "G"                                                                  
## [25] "H"                                                                  
## [26] "I"                                                                  
## [27] "J"                                                                  
## [28] "K"                                                                  
## [29] "L"                                                                  
## [30] "M"                                                                  
## [31] "N"                                                                  
## [32] "Q1A"                                                                
## [33] "Q1B"                                                                
## [34] "Q2A"                                                                
## [35] "Q2B"                                                                
## [36] "Q3A"                                                                
## [37] "Q3B"                                                                
## [38] "Q4A"                                                                
## [39] "Q4B"                                                                
## [40] "Q5A"                                                                
## [41] "Q5B"                                                                
## [42] "Q6A"                                                                
## [43] "Q6B"                                                                
## [44] "Q7A"                                                                
## [45] "Q7B"                                                                
## [46] "Q8A"                                                                
## [47] "Q8B"                                                                
## [48] "Q9A"                                                                
## [49] "Q9B"                                                                
## [50] "Tel"
```


Historique des transformation.

Stat simples
------------

### Origine socio-professionnelle:

```r
summary(diplome)
```

```
##         AS        IDE       MERM        PPH SAGE FEMME 
##          8         25          1          1          1
```

```r
plot(diplome)
```

![plot of chunk c5](figure/c5.png) 



Données pour Likert:

```r
x <- summary(as.factor(data$Q1A))
x
```

```
##    1    4    5    6    7 NA's 
##    1    3   14   10    7    1
```

```r
# likert(x)
```

Ca marche mais on obtient que 4 valeurs sur les 8 possibles et l'échelle de likert est faussée.
Voila ce qu'on devrait obtenir:

```r
a <- c(0, 0, 0, 2, 11, 6, 1, 0)
likert(a)
```

![plot of chunk c7](figure/c7.png) 

La question Q1 complète (avant/après):

```r
b <- summary(as.factor(data$Q1B))
b
```

```
##  6  7  8 
##  5 22  9
```

```r
Q1B <- c(0, 0, 0, 0, 0, 4, 11, 5)
a
```

```
## [1]  0  0  0  2 11  6  1  0
```

```r
Q1A <- a
c <- rbind(Q1A, Q1B)
likert(c, main = "Question Q1 (avant / après)")
```

![plot of chunk c8](figure/c81.png) 

```r

a <- as.integer(data$Q1A)
b <- as.integer(data$Q1B)

summary(a)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##    1.00    5.00    5.00    5.49    6.00    7.00       1
```

```r
summary(b)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    6.00    7.00    7.00    7.11    7.25    8.00
```

```r

boxplot(a, b)
```

![plot of chunk c8](figure/c82.png) 

```r

# ma<-mean(summary(as.factor(data$Q1A)))
# mb<-mean(summary(as.factor(data$Q1B)))

t <- t.test(a, b)
t
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  a and b 
## t = -7.147, df = 50.8, p-value = 3.252e-09
## alternative hypothesis: true difference in means is not equal to 0 
## 95 percent confidence interval:
##  -2.082 -1.169 
## sample estimates:
## mean of x mean of y 
##     5.486     7.111
```

```r
t[["statistic"]]
```

```
##      t 
## -7.147
```

```r
t[["parameter"]]
```

```
##   df 
## 50.8
```

```r
t[["p.value"]]
```

```
## [1] 3.252e-09
```

Ce qui peut s'écrire avec **sweave**:

Il n'y a pas de différence significative entre les moyennes des scores avant et après:
($t(\Sexpr{res[['parameter']]})=\Sexpr{round(res[['statistic']],3)}$,
$p \Sexpr{ifelse(res[['p.value']]<0.001,'< 0.001',
   paste('=',round(res[['p.value']],3)))}$)

Expansion des score de likert:
------------------------------
Le score de Likert pour une question varie de 1 à 8 mais tous les items ne sont pas renseignés. Par exemple pour la question Q1A on obtient le score suivant:

```r
summary(as.factor(data$Q1A))
```

```
##    1    4    5    6    7 NA's 
##    1    3   14   10    7    1
```

Ce qui fausse la représentation de l'échelle de Likert. Celle-ci est exacte avec la série:

```r
a <- c(0, 0, 0, 2, 11, 6, 1, 0)
```

Pour obtenir automatiquement une séquence complète, on peut appliquer l'algorithme suivant: pour chaque ligne de *data* on forme un vecteur z contenant huit 0. Puis on affecte 1 à la position correspondante à la valeur du score pour cette question à cette ligne. Par exemple la valeur de Q1A pour la première ligne est 6 => z[6]=1. Enfin on "colle" le vecteur z à la liste a. L'opération est répétée pour toutes les lignes.


```r
a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q1A[x])] <- 1
    a <- rbind(z)
})
a <- do.call(rbind, a)
Q1A <- apply(a, 2, sum)

a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q1B[x])] <- 1
    a <- rbind(z)
})
a <- do.call(rbind, a)
Q1B <- apply(a, 2, sum)

c <- rbind(Q1A, Q1B)
likert(c, main = "Question Q1 (avant / après)")
```

![plot of chunk c11](figure/c11.png) 


Application à la question 4
---------------------------

```r
a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q4A[x])] <- 1
    a <- rbind(z)
})
a <- do.call(rbind, a)
Q4A <- apply(a, 2, sum)

a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q4B[x])] <- 1
    a <- rbind(z)
})
a <- do.call(rbind, a)
Q4B <- apply(a, 2, sum)

c <- rbind(Q4A, Q4B)
likert(c, main = "Question Q4 (avant / après)", xlab = "'je pense que n'hésite pas à prendre des décisions en situation d'urgence'")
```

![plot of chunk c12](figure/c12.png) 


Application à la question 6
---------------------------

```r
a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q6A[x])] <- 1
    a <- rbind(z)
})
a <- do.call(rbind, a)
Q6A <- apply(a, 2, sum)

a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q6B[x])] <- 1
    a <- rbind(z)
})
a <- do.call(rbind, a)
Q6B <- apply(a, 2, sum)

c <- rbind(Q6A, Q6B)
likert(c, main = "Question Q6 (avant / après)", xlab = "'Même en situation d'urgence je préfère attendre un collègue'")
```

![plot of chunk c13](figure/c13.png) 



Calcul du SEP
-------------
Les questions avant/après vont de la colonne 32 à 49.

Il faut d'abord transformer les valeurs de character en numeric:

```r
for (i in 32:49) {
    data[, i] <- as.numeric(data[, i])
}
```

On crée une liste des question "avant":

```r
avant <- seq(from = 32, to = 49, by = 2)
```

On isole dans un dataframe les questions "avant":

```r
av <- data[, avant]
```

on calcule la somme de chaque ligne:

```r
a <- apply(av, 1, sum)
a
```

```
##  [1] 44 48 49 55 45 45 51 56 47 52 49 50 45 43 44 63 46 58 53 39 50 63 55
## [24] 56 58 47 57 40 23 58 NA 60 61 54 55 37
```

```r
hist(a, breaks = 5, main = "Histogramme SEP avant", ylab = "nombre", xlab = "Sentiment d'efficacité personnel (SEP)", 
    col = "green")
```

![plot of chunk c17](figure/c17.png) 

On fait la même opération pour après

```r
apres <- seq(from = 33, to = 49, by = 2)
ap <- data[, apres]
b <- apply(ap, 1, sum)
summary(b)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    51.0    58.0    61.0    61.2    64.0    72.0
```

```r
hist(b, breaks = 5, main = "Histogramme SEP après", ylab = "nombre", xlab = "Sentiment d'efficacité personnel (SEP)", 
    col = "green")
```

![plot of chunk c18](figure/c18.png) 

a = vecteur des SEP avant formation

b = vecteur des SEP après formation

Le score SEP (Sentiment d'efficacité personnelle) a progressé après la formation.

```r
boxplot(a, b, main = "SEP avant et après la formation", col = "yellow")
```

![plot of chunk c19](figure/c19.png) 

Et cette évolution est très significative (test t pour séries appariées):

```r
t <- t.test(a, b, paired = TRUE)
t
```

```
## 
## 	Paired t-test
## 
## data:  a and b 
## t = -7.125, df = 34, p-value = 3.104e-08
## alternative hypothesis: true difference in means is not equal to 0 
## 95 percent confidence interval:
##  -14.211  -7.903 
## sample estimates:
## mean of the differences 
##                  -11.06
```

### expérience professionnelle

```r
summary(exp_urg)
```

```
## non oui 
##  20  16
```

SEP moyen en fonction de l'expérience:

```r
tapply(a, exp_urg, mean, na.rm = TRUE)
```

```
##   non   oui 
## 47.58 53.25
```

```r
tapply(a, exp_urg, sd, na.rm = TRUE)
```

```
##   non   oui 
## 9.305 5.733
```

```r
x <- split(a, exp_urg)
boxplot(x, main = "SEP en fonction de l'expérience des situations d'urgence", 
    ylab = "SEP", col = "orange")
```

![plot of chunk c22](figure/c22.png) 

```r
x
```

```
## $non
##  [1] 44 48 49 45 51 47 49 45 44 63 58 39 50 40 23 58 NA 60 54 37
## 
## $oui
##  [1] 55 45 56 52 50 43 46 53 63 55 56 58 47 57 61 55
```

```r
t <- t.test(x$non, x$oui)
t
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  x$non and x$oui 
## t = -2.205, df = 30.46, p-value = 0.0351
## alternative hypothesis: true difference in means is not equal to 0 
## 95 percent confidence interval:
##  -10.9190  -0.4231 
## sample estimates:
## mean of x mean of y 
##     47.58     53.25
```

Les personnes ayant une expérience de l'urgence ont en moyenne un SEP plus élevé.

Analyse de la question 4
------------------------
*Q: je pense que n'hésite pas à prendre des décisions en situatiion d'urgence*

```r
summary(data[, 38])
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##    1.00    5.00    6.00    5.46    6.00    8.00       1
```

```r
summary(data[, 39])
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    6.00    6.75    7.00    7.00    7.25    8.00
```

Il y a une progression du groupe: après la formation, davantage d'apprenants se sentent capables de prendre une décision en situation d'urgence.

Analyse de la question 6
------------------------
*Q: Même en situation d'urgence je préfère attendre un collègue*

```r
summary(data[, 42])
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##    1.00    4.00    6.00    5.63    7.00    8.00       1
```

```r
summary(data[, 43])
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    1.00    3.00    6.00    5.11    7.00    8.00
```

Après la formation, la position du groupe évolue peu bien que l'on note une une diminution de la moyenne, cad que les stagiaires en fin de formation attendront moins la validation de leur décision par une pair avant d'agir.

### SEP et fréquence des situations d'urgence

fréquence absolue et selon le lieu d'exercice:

```r
summary(conf_urg)
```

```
##   jamais  parfois rarement  souvent 
##        6       20        5        5
```

```r
table(travail, conf_urg)
```

```
##                     conf_urg
## travail              jamais parfois rarement souvent
##   Bloc                    0       1        0       0
##   bloc ophtalmo           0       1        0       0
##   centre                  0       1        0       0
##   centre du sommeil       1       0        0       0
##   chir orthopédique       1       0        0       0
##   chir pediatrique        0       0        1       0
##   CMCO                    0       1        0       0
##   EF cardio               0       1        0       0
##   EHPAD                   1       0        0       0
##   entreprise              0       3        0       0
##   GASTRO chir             0       0        1       0
##   GERIATRIE               0       1        0       0
##   HEMATO                  0       0        0       1
##   HEMODIALYSE             0       0        0       1
##   long sejour             1       0        0       0
##   MEDECINE                0       1        1       0
##   medecine nucléaire      0       0        1       0
##   NA                      0       2        0       0
##   NEPHRO                  0       1        0       0
##   oncologie               0       0        1       0
##   pharmacie               1       0        0       0
##   PNEUMO                  0       1        0       0
##   rea neurochir           0       0        0       1
##   SSPI                    0       1        0       0
##   STE BARBE               0       1        0       0
##   TRAUMATO                0       1        0       0
##   UAA                     0       0        0       1
##   URGENCES                0       1        0       1
##   USC                     0       1        0       0
```

Sep moyen et fréquence des situations d'urgence

```r
tapply(a, conf_urg, mean, na.rm = TRUE)
```

```
##   jamais  parfois rarement  souvent 
##    39.20    52.05    48.20    55.60
```

```r
x <- split(a, conf_urg)
boxplot(x, main = "SEP en fonction de la fréquence des situations d'urgence", 
    ylab = "SEP", col = "orange")
```

![plot of chunk c31](figure/c311.png) 

```r
x <- aov(a ~ conf_urg)
x
```

```
## Call:
##    aov(formula = a ~ conf_urg)
## 
## Terms:
##                 conf_urg Residuals
## Sum of Squares     839.2    1491.8
## Deg. of Freedom        3        31
## 
## Residual standard error: 6.937 
## Estimated effects may be unbalanced
## 1 observation deleted due to missingness
```

```r
summary(x)
```

```
##             Df Sum Sq Mean Sq F value Pr(>F)   
## conf_urg     3    839   279.7    5.81 0.0028 **
## Residuals   31   1492    48.1                  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 1 observation deleted due to missingness
```

```r
plotmeans(a ~ conf_urg, ylab = "SEP", xlab = "Confrontation aux situations d'urgence", 
    main = "SEP moyen et situations d'urgence", col = "red")
```

![plot of chunk c31](figure/c312.png) 

```r

TukeyHSD(x)
```

```
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
## 
## Fit: aov(formula = a ~ conf_urg)
## 
## $conf_urg
##                   diff     lwr    upr  p adj
## parfois-jamais   12.85   3.436 22.264 0.0043
## rarement-jamais   9.00  -2.907 20.907 0.1916
## souvent-jamais   16.40   4.493 28.307 0.0040
## rarement-parfois -3.85 -13.264  5.564 0.6862
## souvent-parfois   3.55  -5.864 12.964 0.7371
## souvent-rarement  7.40  -4.507 19.307 0.3476
```

Plus la confrontation au situations d'urgence augmente et plus le SEP est élevé.

Différence significative pour *parfois-jamais*, *souvent-jamais*.

Profession et SEP
-----------------


```r
table(diplome, conf_urg)
```

```
##             conf_urg
## diplome      jamais parfois rarement souvent
##   AS              3       3        0       2
##   IDE             2      16        4       3
##   MERM            0       0        1       0
##   PPH             1       0        0       0
##   SAGE FEMME      0       1        0       0
```

SEP avant formation:

```r
tapply(a, diplome, mean, na.rm = TRUE)
```

```
##         AS        IDE       MERM        PPH SAGE FEMME 
##      51.00      50.92      58.00      23.00      45.00
```

SEP après formation:

```r
tapply(b, diplome, mean, na.rm = TRUE)
```

```
##         AS        IDE       MERM        PPH SAGE FEMME 
##      58.50      61.68      65.00      65.00      63.00
```

Le SEP avant formation est élevé pour les AS, IDE et MERM et particulièrement bas por les PPH. Après la formation, il augmente pour toutes les catégories mais la progression la plus spectaculaire est observée pour les PPH. Avant la formation, le SEP est significativement différent selon le métier:

```r
xa <- aov(a ~ diplome)
summary(xa)
```

```
##             Df Sum Sq Mean Sq F value Pr(>F)   
## diplome      4    845   211.3    4.27 0.0075 **
## Residuals   30   1486    49.5                  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 1 observation deleted due to missingness
```

```r
plotmeans(a ~ diplome, ylab = "SEP", xlab = "Diplome", main = "SEP moyen (avant) et métier", 
    col = "red")
```

```
## Warning: production de NaN
```

![plot of chunk c30](figure/c30.png) 

Après la formation, il n'y a plus de différence de SEP quelque soit le métier:

```r
xb <- aov(b ~ diplome)
summary(xb)
```

```
##             Df Sum Sq Mean Sq F value Pr(>F)
## diplome      4     96    24.1    1.06   0.39
## Residuals   31    705    22.8
```

```r
plotmeans(b ~ diplome, ylab = "SEP", xlab = "Diplome", main = "SEP moyen (après) et métier", 
    col = "red")
```

```
## Warning: production de NaN
```

![plot of chunk c29](figure/c29.png) 






