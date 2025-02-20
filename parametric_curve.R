

devtools::install_github("phillipnicol/MorphoGAM")

library(MorphoGAM)

xy <- MorphoGAM:::makeSwissRoll()

#See swiss roll
plot(xy)

#Hand-drawn parametric curve tracing points
fit <- CurveFinderInteractive(xy)
