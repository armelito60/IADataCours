setwd(dir = "C:/Users/Armel/Desktop/Cours ESIEA/Github")

#Import des données au format csv
menu <- read.csv("C:/Users/Armel/Desktop/Cours ESIEA/Github/menu.csv")
menu <- as.data.frame(menu)
print(summary(menu))


#Intallation du package MVN
install.packages("MVN")
library(MVN)

#Détermination de la loi normale bivariée entre deux variables

result = mvn(menu[menu$Calories, menu$Total.Fat], mvnTest = "mardia", univariateTest = "SW", univariatePlot = "histogram", multivariatePlot = "qq", multivariateOutlierMethod = "adj", showOutliers = TRUE, showNewData = TRUE)

#Test de corrélation linéaire de Pearson
cor.test(variables)

#Séparation du Dataframe menu
donnes_separees <- c("Calories", "Total.Fat", "Cholesterol", "Sodium", "Sugars", "Protein")
indices <- which(colnames(menu) %in% donnes_separees)
menu[,indices]
#Affichage de la matrice de corrélation
correlation_mat <- cor(menu[,indices])

da <- c("Calories", "Total.Fat","Cholesterol","Sodium","Sugars","Protein")
m1 <- matrix(nrow = 6, ncol = 6)
dimnames(m1) <- list(da, da)
m1

#Remplissage de la matrice de corrélation
for (i in 0:36) {
  m1[i] <- correlation_mat[i]
}
m1

#Représentation en 3D des trois variables
library(rgl)
plot3d(menu$Calories,
       + menu$Total.Fat, menu$Cholesterol, type="s")


