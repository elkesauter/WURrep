##Solution-Self Study Lesson 2-Elke Sauter

## Libraries needed
library(raster)
library(spatstat)
library(rgeos)
## You can choose your own country here
CR <- raster::getData('alt', country='CRI', mask=TRUE) ## SRTM 90m height data
CRshp <- raster::getData('GADM', country='CRI', level=2) ## administrative boundaries
## Create random points
dran <- runifpoint(30, win = as.vector(extent(CR)))
## Make the random point spatial points
S <- SpatialPoints(data.frame(x = dran$x, y = dran$y), 
                   proj4string = CRS(proj4string(CRshp)))
## Select only the ones within Costa Rica
Sint <- gIntersection(S, CRshp)
## Create a map
plot(CR)
plot(CRshp, add=TRUE)
plot(Sint, add = TRUE, col = "red", pch = 19, cex = 0.2)

#sample the height data, and plot following random point id:
out <- extract(CR, Sint, df = TRUE)
colnames(out) <- c("id", "height")
head(out)

#plot
plot(out, type = "p", pch = 19)

#Country is Costa Rica and modified the number of points to 30.


