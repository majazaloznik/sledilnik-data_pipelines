# Load packages
library(networkD3)
library(htmlwidgets)

# test
test <- jsonlite::fromJSON("data/test.json")


p <- sankeyNetwork(Links = test$links, Nodes = test$nodes, Source = "source",
                   Target = "target", Value = "value", NodeID = "name",
                   fontSize = 12, nodeWidth = 30, NodeGroup = "group", nodePadding = 20, iterations = 100)
p


# save the widget
# some weird bug, won't take relative file paths
f<-"outputs/test.html"
saveWidget(p,file.path(normalizePath(dirname(f)),
                                     basename(f)))

