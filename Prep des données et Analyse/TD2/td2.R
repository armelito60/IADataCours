setwd(dir = "C:/Users/Armel/Desktop/Cours ESIEA/Github/Prep des données et Analyse/TD2")

#Import des données au format csv
president12 <- as.data.frame(read.csv2(file = "C:/Users/Armel/Desktop/Cours ESIEA/Github/Prep des données et Analyse/TD2/President12.csv", encoding = "UTF-8", row.names = 1))

#Affichage les nombres de voix obtenues par les différents candidats dans le département du Bas-Rhin, Paris, Seine St Denis et Vaucluse
barplot(as.matrix(president12[67,2:11]),names.arg=colnames(president12)[2:11],col="purple3", border="white", main="Bas-Rhin", horiz=T, las=1,xlab="nombre de voix", cex.lab=1.2)

barplot(as.matrix(president12[75,2:11]),names.arg=colnames(president12)[2:11],col="purple3", border="white", main="Bas-Rhin", horiz=T, las=1,xlab="nombre de voix", cex.lab=1.2)

barplot(as.matrix(president12[93,2:11]),names.arg=colnames(president12)[2:11],col="purple3", border="white", main="Bas-Rhin", horiz=T, las=1,xlab="nombre de voix", cex.lab=1.2)

barplot(as.matrix(president12[84,2:11]),names.arg=colnames(president12)[2:11],col="purple3", border="white", main="Bas-Rhin", horiz=T, las=1,xlab="nombre de voix", cex.lab=1.2)