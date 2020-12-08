# Load packages
library(networkD3)
library(htmlwidgets)

# test
test <- jsonlite::fromJSON("data/master.json")

links <- test$links
map = setNames(c(0: (length(test$nodes$name)-1)), c(test$nodes$name))
links$source <- map[unlist(test$links$source)]
links$target <- map[unlist(test$links$target)]


my_color <- 'd3.scaleOrdinal() .domain(["1", "2"]) .range(["#69b3a2", "steelblue"])'


p <- sankeyNetwork(Links = links, Nodes = test$nodes, Source = "source",
                   Target = "target", Value = "value", NodeID = "name",
                   sinksRight	= FALSE,
                   #LinkGroup = "group", colourScale=my_color,
                   fontSize = 15, nodeWidth = 30, NodeGroup = "group", nodePadding = 20, iterations = 100)
p





# save the widget
# some weird bug, won't take relative file paths
f<-"docs/index.html"
saveWidget(p,file.path(normalizePath(dirname(f)),
                                     basename(f)))

