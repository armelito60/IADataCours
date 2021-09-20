setwd(dir = "C:/Users/Armel/Desktop/Cours ESIEA/Github/Prep des données et Analyse/TD2")

#Import des données au format csv
president12 <- as.data.frame(read.csv2(file = "C:/Users/Armel/Desktop/Cours ESIEA/Github/Prep des données et Analyse/TD2/President12.csv", encoding = "UTF-8", row.names = 1))

#Affichage les nombres de voix obtenues par les différents candidats dans le département du Bas-Rhin, Paris, Seine St Denis et Vaucluse
president_4 <- (president12[c(68,76,94,85),2:11])
barplot(as.matrix(t(president_4)),names.arg=colnames(t(president_4)), col=rainbow(10),border="black", main="Votes", horiz=F, las=1,xlab="Nombre de voix", cex.lab=1.2, beside = TRUE, legend=TRUE, args.legend = list(x = "topright", bty = "n", inset=c(-0.005, 0)),ylim=c(0,350000))

#affichage du profil ligne du Bas-Rhin
barplot(as.matrix(president12[68,2:11])/sum(as.matrix(president12[68,2:11])),horiz = TRUE,border="white", col="blue4", beside=T, xlab="Bas-Rhin", cex.lab=1.5, las=1)
