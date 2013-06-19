Etude V.Brunstein
========================================================
Petite note méthodologique:
1. pour que les résultats soient interprétable, il faut que la taille des groupes soit suffisante, en pratique au moins 30. Le non dit de cette affirmation est qu'elle s'applique à l'échantillon mais par récursivité au sous-groupes. Je m'explique:
- l'échantillon comporte environ 80 éléments. Pour calculer l'age moyen, pas de problème, l'age moyen est représentatif de la population. Cet échantillon est constitué en gros de deux catégories socio-proffessionnelles (AS et IDE) soit 2 groupes d'environ 40 personnes. Si on s'intéresse aux IDE ayant une expérience de l'urgence, on tombe aux environs de 20. Sachant que l'évaluation se fait avec une échelle de 8 valeurs, cela fait en moyenne des sous groupes de 2 ou 3 personnes soit 10 fois mons que chiffre théorique de 30.
Concusions: plus on divise léchantillon et plus il faut être prudent dans les conclusions que l'on tire surtout si les résultats ne sont pas significatifs. Pour une prochaine étude il est peut être préférable d'utiliser une échelle classique à 5 items.
2. revoir la formulation de certaines questions. On ne comprend pas l'objectif poursuivi ?
3. attention à la formulation: pour un ordinateur AFGSU 2 n'est pas la même chose que AFGSU2.
4. incohérence dans la colonne formation à l'urgence: OUI, NON, AFGSU...

Résultats commentés
-------------------




éléments
========

1. Pour les catégories professionnelles : rassembler dans autres ce qui n’est ni AS ni IDE. Mettre AP avec groupe AS.
#### Origine socio-professionnelle:


#### 2a. évaluer le SEP au départ questions 1 à 7 au total


```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'av' introuvable
```

```
## [1] "SEP7 avant la formation:"
```

```
## Error: objet 'sep7a' introuvable
```

```
## Error: objet 'sep7a' introuvable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'ap' introuvable
```

```
## [1] "SEP7 après la formation:"
```

```
## Error: objet 'sep7b' introuvable
```

```
## Error: objet 'sep7b' introuvable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'om' introuvable
```

```
## [1] "SEP7 après un mois:"
```

```
## Error: objet 'sep7c' introuvable
```

```
## Error: objet 'sep7c' introuvable
```

Evolution du SEP7 (différence Avant- Après)

```
## Error: objet 'sep7b' introuvable
```

```
## Error: objet 'sep7b' introuvable
```

```
## Error: objet 's' introuvable
```

```
## Error: objet 'h' introuvable
```

```
## Error: objet 's' introuvable
```

#### 2b. évaluer le SEP au départ questions 1 à 7 selon les catégories professionnelles

```
## [1] "SEP7 avant moyen selon la catégorie socio-prof:"
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'sep7a' introuvable
```

```
## Error: objet 'sep7a' introuvable
```

```
## Error: objet 'b' introuvable
```

```
## [1] "Pas de différence entre les groupes"
```



#### 3. évaluerle SEP questions _4 / 6/ 8 à part 

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## [1] "Q4"
```

```
## Error: objet 'sep4a' introuvable
```

```
## Error: objet 'sep4b' introuvable
```

```
## [1] "Q6"
```

```
## Error: objet 'sep6a' introuvable
```

```
## Error: objet 'sep6b' introuvable
```

```
## [1] "Q8"
```

```
## Error: objet 'sep8a' introuvable
```

```
## Error: objet 'sep8b' introuvable
```



#### 4. évaluer question 3 par rapport niveau global du SEP

```r
sep3a <- as.integer(data[, "Q3A"])
```

```
## Error: objet de type 'closure' non indiçable
```

```r
sep3b <- as.integer(data[, "Q3B"])
```

```
## Error: objet de type 'closure' non indiçable
```

```r
mean(sep3a, na.rm = T)
```

```
## Error: objet 'sep3a' introuvable
```

```r
mean(sep3b, na.rm = T)
```

```
## Error: objet 'sep3b' introuvable
```



#### 5. impact du SEP de départ et experience de service d'urgence en faisant un ratio selon l'ancienneté de l'experience ?

```r
boxplot(data$sep7a ~ data$exp_urg, ylab = "SEP 7 avant", xlab = "Expérience de l'urgence")
```

```
## Error: objet de type 'closure' non indiçable
```

```r
a <- t.test(data$sep7a ~ data$exp_urg)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
a
```

```
## Error: objet 'a' introuvable
```



#### 6. impact du SEP et type de formation à l'urgence avec date

 les formations sont trop dispersées: 

```r
a <- as.character(data$formation)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
a[a == "AFGSU 1"] <- "AFGSU1"
```

```
## Error: objet 'a' introuvable
```

```r
a[a == "AFGSU 2"] <- "AFGSU2"
```

```
## Error: objet 'a' introuvable
```

```r
summary(as.factor(a))
```

```
## Error: objet 'a' introuvable
```

```r
boxplot(data$sep7a ~ a, las = 2, ylab = "SEP 7 avant")
```

```
## Error: objet de type 'closure' non indiçable
```

Les IDE SMUR se détachent du lot mais il n'y en a que deux.

#### 7. impact du SEP avec les questions A B C total et de manière individuelle est ce que C a plus d'impact que A

- a  j'ai su trouver ma place au sein de l'équipe
- b	j'étais satisfait de ma prise en charge
- c	j'ai eu l'impression que le médecin à son arrivée était satisfait des actions entrepriseslabel.var(E, "J'a


```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'x' introuvable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'x' introuvable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'x' introuvable
```



#### 8. ceci au total et par catégorie professionnelle et avec variante experience de l'urgence


```r
a <- data[data$diplome == "IDE", c("A", "sep7a", "exp_urg")]
```

```
## Error: objet de type 'closure' non indiçable
```

```r

# suppression des lignes où 'A' = NA
a <- a[a$A != "NA", ]
```

```
## Error: objet 'a' introuvable
```

```r

tapply(a$sep7a, a$A, mean, na.rm = TRUE)
```

```
## Error: objet 'a' introuvable
```

```r
boxplot(a$sep7a ~ as.factor(a$A), ylab = "Score SEP 7 moyen", main = "j'ai su trouver ma place au sein de l'équipe\n IDE", 
    xlab = "1 = pas d'accord, 8 = tout à fait d'accord, NA = NSP")
```

```
## Error: objet 'a' introuvable
```

```r

lm <- lm(a$sep7a ~ as.factor(a$A))
```

```
## Error: objet 'a' introuvable
```

```r
summary(lm)
```

```
## Error: objet de type 'closure' non indiçable
```


Avec ou sans expérience de l'urgence:

```r
a1 <- a[a$exp_urg == "oui", ]
```

```
## Error: objet 'a' introuvable
```

```r
a2 <- a[a$exp_urg == "non", ]
```

```
## Error: objet 'a' introuvable
```

```r
summary(a1$sep7a)
```

```
## Error: objet 'a1' introuvable
```

```r
summary(a2$sep7a)
```

```
## Error: objet 'a2' introuvable
```




#### 9. idem pour ceux qui ont vécu une situaiton d'urgence post formation avec évolution A/B/C entre avant et après formation 

#### 10. évolution du SEP par catégorie professionnelle et totale entre début fin de formation

#### 11. idem avec évaluation à 1 mois

#### 12. évolution du SEP pour AS en séparant AS du groupe 8 par rapport aux autres AS

 Effectif trop faible

#### 13.évaluation des questions D à N et impact sur SEP fin de formation ou sur l'évaluation du SEP entre début et fin de formation

** PAS COMPRIS LA QUESTION ???**


```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: l'argument est de longueur nulle
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'a' introuvable
```

```
## Error: objet 'QD' introuvable
```

```
## Error: The argument is not a data frame or no such file
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## Error: objet '.data' introuvable
```

```
## [1] "Résumé des réponses au questions d à n évéluées après la formation"
```

```
## function (..., recursive = FALSE)  .Primitive("c")
```

```
## Error: objet '.data' introuvable
```

```
## Error: l'argument n'est pas une matrice
```


#### 14. idem pour les aspects suivants par type de questions

#### 15. évaluation questions D et E (vicariant)

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'a' introuvable
```


#### 16.évaluation questions H / I / J /K (persuasion verbale)  

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet 'a' introuvable
```



#### 17.évaluation questions  G / L / N (maitrise)

#### 18.évaluation questions F (état psychologique émotionnel)

#### 19.évaluation question M (transférabilité)

#### 20.évaluation G seul et  G /L / N par catégorie professionnelle ???

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

```
## Error: objet de type 'closure' non indiçable
```

#### 21. Sep avant et groupe de formation


```r
q <- tapply(data$sep7a, data$groupe, mean, na.rm = T)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
q
```

```
## function (save = "default", status = 0, runLast = TRUE) 
## .Internal(quit(save, status, runLast))
## <bytecode: 0x2c89878>
## <environment: namespace:base>
```

```r
boxplot(data$sep7a ~ data$groupe, ylab = "SEP 7 avant formation", xlab = "Groupe", 
    col = "orange")
```

```
## Error: objet de type 'closure' non indiçable
```

```r
s <- aov(data$sep7a ~ data$groupe)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
summary(s)
```

```
## Error: objet 's' introuvable
```

#### 22. Evolution du SEP

```r
boxplot(data$sep7a, data$sep7b, data$sep7c, names = c("avant", "après", "à 1 mois"), 
    ylab = "SEP", main = "Evolution du SEP", col = "yellow")
```

```
## Error: objet de type 'closure' non indiçable
```

```r
sep1 <- summary(data$sep7a)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
sep2 <- summary(data$sep7b)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
sep3 <- summary(data$sep7c)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
rbind(sep1, sep2, sep3)
```

```
## Error: objet 'sep1' introuvable
```

```r

boxplot(q, horizontal = T, main = "Evolution du SEP à un mois", xlab = "comparaison SEP à 1 mois - SEP initial", 
    col = "pink")
```

```
## Warning: is.na() appliqué à un objet de type 'closure' qui n'est ni une
## liste, ni un vecteur
```

```
## Warning: is.na() appliqué à un objet de type 'closure' qui n'est ni une
## liste, ni un vecteur
```

```
## Error: objet de type 'closure' non indiçable
```

```r
summary(data$sep7c - data$sep7a)
```

```
## Error: objet de type 'closure' non indiçable
```

#### 24. Fréquence des situations d'urgence ORDERED

```r
status <- factor(data$conf_urg, order = T, levels = c("jamais", "rarement", 
    "parfois", "souvent"))
```

```
## Error: objet de type 'closure' non indiçable
```

```r
tapply(data$sep7a, status, mean, na.rm = TRUE)
```

```
## Error: objet 'status' introuvable
```

```r
boxplot(data$sep7a ~ status, main = "SEP 7 en fonction de la fréquence des situations d'urgence", 
    ylab = "SEP 7", col = "orange")
```

```
## Error: objet de type 'closure' non indiçable
```

```r
x <- lm(data$sep7a ~ status)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
summary(x)
```

```
## Error: objet 'x' introuvable
```

```r
x <- aov(data$sep7a ~ status)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
summary(x)
```

```
## Error: objet 'x' introuvable
```

#### 25.
Application à la question 1
---------------------------

```r
a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q1A[x])] <- 1
    a <- rbind(z)
})
```

```
## Error: l'argument est de longueur nulle
```

```r
a <- do.call(rbind, a)
```

```
## Error: objet 'a' introuvable
```

```r
Q1A <- apply(a, 2, sum)
```

```
## Error: objet 'a' introuvable
```

```r

a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q1B[x])] <- 1
    a <- rbind(z)
})
```

```
## Error: l'argument est de longueur nulle
```

```r
a <- do.call(rbind, a)
```

```
## Error: objet 'a' introuvable
```

```r
Q1B <- apply(a, 2, sum)
```

```
## Error: objet 'a' introuvable
```

```r

a <- lapply(1:nrow(data), function(x) {
    z <- 0
    z[1:8] <- 0
    z[as.integer(data$Q1C[x])] <- 1
    a <- rbind(z)
})
```

```
## Error: l'argument est de longueur nulle
```

```r
a <- do.call(rbind, a)
```

```
## Error: objet 'a' introuvable
```

```r
Q1C <- apply(a, 2, sum)
```

```
## Error: objet 'a' introuvable
```

```r

c <- rbind(Q1A, Q1B, Q1C)
```

```
## Error: objet 'Q1A' introuvable
```

```r
likert(c, main = "Question Q1 (avant / après)", xlab = "je pense que j'arrive à faire face aux pbs inattendus dans mon activité professionnelle")
```

```
## Error: l'argument n'est pas une matrice
```

#### 26. Formation préalable à l'urgence

On forme une nouvelle colonne *formationON* qui dimplifie la colonne *formation* en remplaçant toute formation par *OUI*.

```r
data$formationON <- as.character(data$formation)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$formationON[data$formationON != "NON" & data$formationON != "NA"] <- "OUI"
```

```
## Error: objet de type 'closure' non indiçable
```

```r
data$formationON <- as.factor(data$formationON)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
summary(data$formationON)
```

```
## Error: objet de type 'closure' non indiçable
```

Calcul de la valeur *médiane* du SEP 7 avant, après et à 1 mois et des boxplot correspondants:

```r
tapply(data$sep7a, data$formationON, median, na.rm = T)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
tapply(data$sep7b, data$formationON, median, na.rm = T)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
tapply(data$sep7c, data$formationON, median, na.rm = T)
```

```
## Error: objet de type 'closure' non indiçable
```

```r

boxplot(data$sep7a ~ data$formationON, ylab = "SEP 7 avant", xlab = "Formation préalable à l'urgence", 
    col = "orange")
```

```
## Error: objet de type 'closure' non indiçable
```

```r
boxplot(data$sep7b ~ data$formationON, ylab = "SEP 7 après", xlab = "Formation préalable à l'urgence", 
    col = "yellow")
```

```
## Error: objet de type 'closure' non indiçable
```

```r
boxplot(data$sep7c ~ data$formationON, ylab = "SEP 7 à 1 mois", xlab = "Formation préalable à l'urgence", 
    col = "pink")
```

```
## Error: objet de type 'closure' non indiçable
```

#### 27. SEP et dernière formation urgence

On récupère la colonne *date.derniere.formation.urgence* dans *resultats.csv* et on lincorpore dans le dataframe -data*

```r
q1 <- read.csv("resultats.csv", header = T, sep = "\t")
data$last_form_urg <- q1$date.derniere.formation.urgence
```

```
## Error: objet de type 'closure' non indiçable
```

```r
class(data$last_form_urg)
```

```
## Error: objet de type 'closure' non indiçable
```

Analyse de la colonne:

```r
summary(data$last_form_urg)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
tapply(data$sep7a, as.factor(data$last_form_urg), mean, na.rm = TRUE)
```

```
## Error: objet de type 'closure' non indiçable
```

Recherche d'une corrélation avec le Sep7:

```r
a <- lm(data$sep7a ~ data$last_form_urg)
```

```
## Error: objet de type 'closure' non indiçable
```

```r
summary(a)
```

```
## Error: objet 'a' introuvable
```

```r
plot(data$sep7a ~ data$last_form_urg, ylab = "SEP 7 Avant", xlab = "Dernière formation à l'urgence")
```

```
## Error: objet de type 'closure' non indiçable
```

```r
abline(a)
```

```
## Error: objet 'a' introuvable
```




 

questions:
==========
faut il classifier les services d'activité par categorie medecine / chirurgie / urgence et soins continus

data$service<-data[data$travail==""]<-""
