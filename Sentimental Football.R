library(devtools)
install_github("mannau/tm.plugin.sentiment")
install.packages("tm.lexicon.GeneralInquirer", repos="http://datacube.wu.ac.at", type="source")
library(tm.lexicon.GeneralInquirer)
install.packages("tm.plugin.sentiment", repos="http://R-Forge.R-project.org")
library(tm)
library(twitteR)
library(wordcloud)
library(RColorBrewer)
library(plyr)
library(ggplot2)
library(sentimentr)
consumer_key <- '....'
consumer_secret <- '....'
access_token <- '....'
access_secret <- '....'
positive=c()
negative=c()


setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Leicester City" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)
Team=c("Leicester City", "Arsenal","Tottenham Hotspur","Manchester City","Manchester United","Southampton","West Ham United","Liverpool","Stoke City","Chelsea")

#Arsenal
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Arsenal" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)

#tottenham

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Tottenham Hotspur" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)

#manchestarcity

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Manchester City" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)

#manutd
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Manchester United" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)
#southampton
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Southampton" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)
#westham
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "West Ham United" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)

#liverpool
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Liverpool" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)

#stoke

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Stoke City" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)

#chelsea

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)
Tweets1 <- searchTwitter( searchString = "Chelsea" , n = 1000 , lang = "en")
Tweets1
Tweets_txt = sapply(Tweets1, function(x) x$getText())
Tweets_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", Tweets_txt)
Tweets_txt = gsub("@\\w+", "", Tweets_txt)
Tweets_txt = gsub("[[:punct:]]", "", Tweets_txt)
Tweets_txt = gsub("[[:digit:]]", "", Tweets_txt)
Tweets_txt = gsub("http\\w+", "", Tweets_txt)
Tweets_txt = gsub("[ \t]{2,}", "", Tweets_txt)
Tweets_txt = gsub("^\\s+|\\s+$", "", Tweets_txt)
catch.error = function(x)
{
  y = NA
  catch_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  return(y)
}
Tweets_txt = sapply(Tweets_txt, catch.error)
Tweets_txt = Tweets_txt[!is.na(Tweets_txt)]
names(Tweets_txt) = NULL
corpus <- Corpus(VectorSource(Tweets_txt))
pos <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Positiv")))
neg <- sum(sapply(corpus, tm_term_score, terms_in_General_Inquirer_categories("Negativ")))
pos.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Positiv"))
neg.score <- tm_term_score(TermDocumentMatrix(corpus, control = list(removePunctuation = TRUE)), terms_in_General_Inquirer_categories("Negativ"))
total.df <- data.frame(positive = pos.score, negative = neg.score)
total.df <- transform(total.df, net = positive - negative)
total.df
pcount=0
for (i in 1:length(pos.score)) {
  pcount=pcount+pos.score[[i]]
}
pcount
positive=c(positive,pcount)
ncount=0
for (i in 1:length(neg.score)) {
  ncount=ncount+neg.score[[i]]
}
ncount
negative=c(negative,ncount)
Table=data.frame(Team,positive,negative)
Table
