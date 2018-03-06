detach("package:igraph")
library(statnet)
library(sna)
library(network)
library(devtools)

#alldata = fuul database for 2011-2013 years for Ukraine
alldata <- read.csv("Edges all years.csv", header = T, as.is = T, sep = ";")

# allnet = full network
allnet <- network(alldata[,5:6], matrix.type = "edgelist", directed = F)
summary(allnet, print.adj = F)
network.size(allnet) # vertices = 1086
plot(allnet) # preliminary visualization
components(allnet) #number of components = 362 

# Setting the attributes (even for isolated vertices) 
allvnames <- read.csv2("allnames.csv")
set.vertex.attribute(allnet, "vname", as.vector(allvnames$Actor.specified))
set.vertex.attribute(allnet, "vnumber", allvnames$Num)
set.vertex.attribute(allnet, "type", allvnames$Type)
set.vertex.attribute(allnet, "pr11", allvnames$Protests.2011)
set.vertex.attribute(allnet, "pr12", allvnames$Protests.2012)
set.vertex.attribute(allnet, "pr13", allvnames$Protests.2013)
set.vertex.attribute(allnet, "pr-ers11", allvnames$Protesters.2011)
set.vertex.attribute(allnet, "pr-ers12", allvnames$Protesters.2012)
set.vertex.attribute(allnet, "pr-ers13", allvnames$Protesters.2013)
set.vertex.attribute(allnet, "sum.pr", allvnames$Summ.Protests)
set.vertex.attribute(allnet, "sum.pr-ers", allvnames$Summ.Protesters)
set.vertex.attribute(allnet, "cat.sum.pr-ers", allvnames$Categories.by.summ.of.protesters)
set.vertex.attribute(allnet, "degree.centrality", degree(allnet,gmode = "graph"))
set.vertex.attribute(allnet, "closeness.centrality", closeness(allnet,gmode = "graph"))
set.vertex.attribute(allnet, "betweenness.centrality", betweenness(allnet,gmode = "graph"))

# delite all isolated vertices
delete.vertices(allnet, isolates(allnet)) 

# Setting the edge attributes - date, oblast and year
date <- as.Date(alldata$Event.start.date, format = "%d.%m.%Y")
set.edge.attribute(allnet, "date", alldata$Event.start.date) # data when protest started
set.edge.attribute(allnet, "oblast", alldata$Oblast.number) # number of the oblast
set.edge.attribute(allnet, "year", alldata$Year) # year
list.edge.attributes(allnet)
