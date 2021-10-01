setwd(dir = "C:/Users/Armel/Desktop/Cours ESIEA/Github/Prep des données et Analyse/TD3")

#Import des données au format csv
poke <- read.csv("C:/Users/Armel/Desktop/Cours ESIEA/Github/Prep des données et Analyse/TD3/pokemon.csv")

poke <- as.data.frame(poke)
print(summary(poke))

#Transformation de la variable Generation en type factor
poke$Generation <- as.factor(poke$Generation)
class(poke$Generation)

#Jeu de données avec variables Type.1, Generation, Legendary
poke_bis <- poke[,c(3,12,13)]

summary(poke)

#Fonction dudi.acm() aevc ade4
poke_bis$Type.1 <- as.factor(poke_bis$Type.1)
poke_bis$Legendary <- as.factor(poke_bis$Legendary)

#Affichage de valeurs propres
res.acm.poke <- dudi.acm(poke_bis,scannf=FALSE)
fviz_screeplot(res.acm.poke)
res <- get_eig(res.acm.poke)

#Affichage des variables qualitatives avec un facteur sur l'axe factoriel 1
score(res.acm.poke,xax=1)

#affichage de l'inertie des modalités des facteurs
scatter(res.acm.poke)

#trier en valeur absolue du plus haut au plus bas pour les modalités influantes
sort(abs(res.acm.poke$c1[,1]), decreasing = TRUE)

#tableau de contingence
library("vcd")
# On isole les colonnes dans les objets 
col1 <- poke_bis[,1]
col2 <- poke_bis[,2]
col3 <- poke_bis[,3]

table(col1, col2, col3)

table(poke_bis[,1], poke_bis[,2], poke_bis[,3])


assocstats()





