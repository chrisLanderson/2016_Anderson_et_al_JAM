multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  plots <- c(list(...), plotlist)
  numPlots = length(plots)
  if (is.null(layout)) {
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots == 1) {
    print(plots[[1]])
    
  } else {
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    for (i in 1:numPlots) {
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,layout.pos.col = matchidx$col))
    }
  }
}

collapse_treatment <- function(x, y) {
  order_vec <- sort(c(x[[1]], y[[1]]))
  collapse_vec <- str_c(order_vec[1], order_vec[2], sep = "-")
}

max_shared_otu <- function(x, y) {
  max_x_y <- max(share_otu[x], share_otu[y])
}

seq_shared <- function(x) {
  sub_tables <- collapse_tidy %>% 
    filter(sample %in% x)
  
  join_tables <- inner_join(sub_tables$data[[1]], sub_tables$data[[2]], by = "otu") %>% 
    mutate(seqs = abundance.x + abundance.y)
  
  shared_seqs <- sum(join_tables$seqs)
  
  seq1 <- sum(sub_tables$data[[1]]$abundance)
  
  seq2 <- sum(sub_tables$data[[2]]$abundance)
  
  total_seqs <- seq1 + seq2
  
  per_seqs <-  (shared_seqs / total_seqs) * 100                              
  
  out <- str_c(x[[1]], x[[2]], shared_seqs, total_seqs, per_seqs, sep = "\t")
  
  write(out, file = "TableS3_.txt", sep = "\t", ncolumns = 5, append = TRUE)
}

normalize_table <- function(x) {
  x / sum(x)
}
