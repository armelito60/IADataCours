#setwd(dir = "C:/Users/Rudyl/Desktop/ESIEA/Cours_5A/Data_Visualisation/TP")

#Import des données au format csv
# menu <- read.csv("C:/Users/Rudyl/Desktop/ESIEA/Cours_5A/Data_Visualisation/TP/menu.csv")
# menu <- as.data.frame(menu)
# summary(menu)


#Intallation du package MVN
#install.packages("MVN)

#Détermination de la loi normale bivariée entre deux variables
#result = mvn(menu[menu$Calories, menu$Total.Fat], mvnTest = "mardia", univariateTest = "SW", univariatePlot = "histogram", multivariatePlot = "qq", multivariateOutlierMethod = "adj", showOutliers = TRUE, showNewData = TRUE)
#Test de corrélation linéaire de Pearson
#cor.test(variables)

#Séparation du Dataframe menu
#donnes_separees <- c("Calories", "Total.Fat", "Cholesterol", "Sodium", "Sugars", "Protein")
#indices <- which(colnames(menu) %in% donnes_separees)
#menu[,indices]
#Affichage de la matrice de corrélation
#cor(menu[,indices])