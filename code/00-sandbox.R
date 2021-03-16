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

my_color <- 'd3.scaleOrdinal() .domain(["1", "2", "3", "4", "5", "6", "10", "11", "13", "hos", "icu", "lab", "inst", "report", "script", "data", "repo", "sole", "cn", "15", "appDownloadCount", "interesCepljenja"]) .
range(["#de9a5a", "#587634", "#9c8eb7", "#64bcc4", "#449c84","#d1867b",  "gray", "#ffd922", "red", "#CCE65A", "#6C1D99", "#B25AE6", "#b11c84", "yellow", "#ffd922", "#d559b1", "#73ccd5", "#74a474", "#8d5c45", "#a07968", "#999999", "#BBEADE"])'

p <- sankeyNetwork(Links = links, Nodes = test$nodes, Source = "source",
                   Target = "target", Value = "value", NodeID = "name",
                   sinksRight	= TRUE,
                   LinkGroup = "group",
                   colourScale=my_color,
                   fontSize = 18, nodeWidth = 45, 
                   NodeGroup = "group", 
                   nodePadding = 7, iterations = 100)
p


# save the widget
# some weird bug, won't take relative file paths
f <- "docs/index.html"
saveWidget(p,file.path(normalizePath(dirname(f)),
                                     basename(f)))

