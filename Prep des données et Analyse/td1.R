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

#Centrage et réduction des données 
list <- c("Calories", "Total.Fat", "Cholesterol")
menu.cr <- scale(menu[, list])
lims <- c(min(menu.cr),max(menu.cr))
plot3d(menu.cr, type = "p", xlim = lims, ylim = lims,zlim = lims)

#Représentation en 3D des trois variables avec ellipse avec Calories, Total.Fat et Cholesterol
menu.cr_df <- as.data.frame(menu.cr)
plot3d(menu.cr, type = "s", xlim = lims, ylim = lims,zlim = lims)
plot3d(ellipse3d(cor(cbind(menu.cr_df$Calories,menu.cr_df$Total.Fat,menu.cr_df$Cholesterol))),col="grey",add=TRUE)

#Centrer les données avec scale et les réduire
list <- c("Sodium", "Sugars", "Protein")
menu.cr <- scale(menu[, list])
lims <- c(min(menu.cr),max(menu.cr))
plot3d(menu.cr, type = "s", xlim = lims, ylim = lims,zlim = lims)

#Représentation de l'ellispe de concentration
menu.cr_df <- as.data.frame(menu.cr)
plot3d(menu.cr, type = "s", xlim = lims, ylim = lims,zlim = lims)
plot3d(ellipse3d(cor(cbind(menu.cr_df$Sodium, menu.cr_df$Sugars,menu.cr_df$Protein))), col="grey",add=TRUE)

#ACP
list <- c("Calories","Total.Fat","Cholesterol")
acp <- dudi.pca(menu[, list], center=TRUE, scale=TRUE, scannf = FALSE, nf = 3)
names(acp)

var <- function(x) sum((x-mean(x))^2)/length(x)
scale <- function(x) (x - mean(x))/sqrt(var(x))
apply(menu.cr, 2, scale)

#extraction inertie totale pour les 3 variables
pve <- 100*acp$eig/sum(acp$eig)
cumsum(pve)

#analyse des variables
inertie <- inertia.dudi(acp, col.inertia=TRUE)
inertie
round(acp$co,2)
s.corcircle(acp$co, xax=1, yax=2)

#représentation des individus avec l'acp
s.label(acp$li, xax = 1, yax = 2)

#représentation labellisé des menus du mcdo avec l'acp
s.label(acp$li, xax = 1, yax=2, label=as.character(menu$Item), clabel=1.5)

gcol <- c("red1", "red4", "orange")
s.class(dfxy = acp$li, fac = menu$Category, col = gcol, xax = 1, yax = 2)
