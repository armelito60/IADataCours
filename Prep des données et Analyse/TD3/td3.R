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
res.acm.poke<-dudi.acm(poke_bis,scannf=FALSE)

#Affichage de valeurs propres
fviz_screeplot(res.acm.poke)
res <- get_eig(res.acm.poke)


