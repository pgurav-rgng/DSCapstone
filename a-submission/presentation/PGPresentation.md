---
title       : Data Science Capstone Project - Predict Next word
author      :   "Pradeep Gurav"
date        : "03/08/2020"
framework   : revealjs
highlighter : highlight.js
hitheme     : default 
widgets     : []
mode        : selfcontained
knit        : slidify::knit2slides
---

## Data Science Capstone Project
The scope of this project is to develop an application to <span style = "color:#d9561a; font-weight:bold">predict the next word</span>  using the typed words as input.

![Course Partners](resources/logos.png)

--- ds:noborder

## Data Source

- "Coursera-Swiftkey.zip": The data used for this project. It consists of three files containing unstructured data from blogs, news articles and tweets provided in 4 languages.

- As the data is huge(563MB English files) I have used only a small sample from each of the files and clubbed them together to generate the ngram models.

- High level Workflow:
![Workflow](resources/workflow.png)

--- ds:noborder

## How to access and use the Shiny App

- The Shiny App link https://pradeepgurav.shinyapps.io/shinyapp/
- The app first loads the ngram files(bigram, trigram and quadgram) and prompts the user to type input words
- Enter one or more words, the app shows a list of recommendations as the 'next word' 

![Screenshot](resources/appscrshot.png)

---

## Algorithm

- When a single word is fed as input, the app looks into bigram and suggests top n words with highest probability(frequency) from the bigram model. However when two, three or more words are fed as input, the app looks into trigram and quadgram models. However I combine suggestions from all models into one list. I put the words recommended by higher gram models on top followed by recommendations from lower gram models.
- The predictions can be made more accurate/realistic by:
  1. Using larger samples to generate ngrams  
  2. Using higher degree n-grams as well  
  3. Using domain specific input files to generate ngrams
  4. Saving user's most frequently used/preferred phrases in local cookies

---

## References

1. [Input data zip](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip)
2. [Exploratory Analysis of the Data and N-gram data files](https://rpubs.com/pgurav/capstone-exploratory1)
3. [Dan Jurafsky, Stanford University](https://www.youtube.com/watch?v=oWsMIW-5xUc&list=PLLssT5z_DsK8HbD2sPcUIDfQ7zmBarMYv)
4. [Sthada](http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know)
5. [Wikipedia ](https://en.wikipedia.org/wiki/Natural_language_processing)
6. Many people who contributed to this capstone project over the years on github

  <br/>
  <br/>
  <br/>
  <span style = "color:#d9561a; font-weight:bold">Thank you</span>  
  pradeep.gurav@gmail.com

