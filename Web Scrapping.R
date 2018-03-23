library(rvest)
url <- 'http://www.skysports.ie/premier-league-table/2015'
webpage <- read_html(url)
sb_table <- html_nodes(webpage, 'table')
sb <- html_table(sb_table)[[1]]
head(sb)
sb
