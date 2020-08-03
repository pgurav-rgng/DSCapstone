#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
# Author: Pradeep Gurav
#

library(stringr)
library(tm)
library(NLP)


bigram <- readRDS("bigram.RData")
trigram <- readRDS("trigram.RData")
quadgram <- readRDS("quadgram.RData")

#use bigram to find next word
find_word_inbigram<-function(split_words) {
  next_word<-as.character(head((bigram[bigram$word1==split_words[1],])$word2,4))
  freq<-as.character(head((bigram[bigram$word1==split_words[1],])$freq,4))
  if(identical(next_word,character(0))) {
    next_word<-NA
    freq<-0
  }
  next_word_list<-list(next_word, freq)
  return(next_word_list)
}

#use trigram to find next word
find_word_intrigram<-function(split_words) {
  next_word<-as.character(head((trigram[trigram$word1==split_words[1] & trigram$word2 == split_words[2],])$word3,4))
  freq<-as.character(head((trigram[trigram$word1==split_words[1] & trigram$word2 == split_words[2],])$freq,4))
  next_word_list<-list(next_word, freq)
  if(identical(next_word,character(0))) {
    next_word_list=get_words_with_backoff(split_words[2])
  }
  return(next_word_list)
}

#use trigram to find next word
find_word_inquadgram<-function(split_words) {
  next_word<-as.character(head((quadgram[quadgram$word1==split_words[1] 
                                         & quadgram$word2 == split_words[2]
                                         & quadgram$word3 == split_words[3]
                                         ,])$word4,4))
  freq<-as.integer(head((quadgram[quadgram$word1==split_words[1] 
                                  & quadgram$word2 == split_words[2]
                                  & quadgram$word3 == split_words[3]
                                  ,])$freq,4))
  next_word_list<-list(next_word, freq)
  if(identical(next_word,character(0))) {
    next_word_list=get_words_with_backoff(paste(split_words[2],split_words[3],sep=" "))
  }
  return(next_word_list)
}


#backoff logic
get_words_with_backoff<-function(sentence, ngrams_words=0)  {
  sentence_c<-stripWhitespace(removeNumbers(tolower(sentence),preserve_intra_word_dashes = TRUE))
  split_words<- strsplit(sentence_c," ")[[1]]
  qwords<-length(split_words)
  #print(split_words)
  #print(qwords)
  if(ngrams_words==2) { ##use bigram find out next_word
    next_word_list<-find_word_inbigram(tail(split_words,1))
  }  
  else if(ngrams_words==3) { ##use trigram find out next_word
    next_word_list<-find_word_intrigram(tail(split_words,2))
  }
  else if(ngrams_words==4) {
    next_word_list<-find_word_inquadgram(tail(split_words,3))
  }
  else {
    next_word_list<-list(NA,0)
  }
  return(next_word_list)
}