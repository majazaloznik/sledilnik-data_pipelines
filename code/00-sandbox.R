# Load packages
library(networkD3)
library(htmlwidgets)

# test
test <- jsonlite::fromJSON("data/master.json")

links <- test$links
map = setNames(c(0: (length(test$nodes$name)-1)), c(test$nodes$name))
links$source <- map[unlist(test$links$source)]
links$target <- map[unlist(test$links$target)]
links$group <- as.character(test$links$group)

my_color <- 'd3.scaleOrdinal() .domain(["1", "2", "hos", "icu", "lab", "inst", "report"]) .range(["#85992C", "#E7FF7D", "#CCE65A", "#6C1D99", "#B25AE6", "navy", "orange", "yellow"])'

p <- sankeyNetwork(Links = links, Nodes = test$nodes, Source = "source",
                   Target = "target", Value = "value", NodeID = "name",
                   sinksRight	= FALSE,
                   LinkGroup = "group",
                   colourScale=my_color,
                   fontSize = 18, nodeWidth = 45, 
                   NodeGroup = "group", 
                   nodePadding = 13, iterations = 100)
p

# save the widget
# some weird bug, won't take relative file paths
f <- "docs/index.html"
saveWidget(p,file.path(normalizePath(dirname(f)),
                                     basename(f)))

