#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
# Author: Pradeep Gurav
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Word recommendation"),

  sidebarLayout(
    sidebarPanel(
        helpText("Enter one or more words and check if the app provides any logical next word. If you keep selecting matching words, you shall see some funny sentences being formed."),
        hr(),
        textInput("inputText", "Type one or more words:",value = ""),
    ),
    
    mainPanel(
      h4("Here is your story"),
      textOutput("story"),
      br(),
      h4("Top recommended word"),
      h3(strong(code(textOutput('next_word')))),
      uiOutput(outputId = "chosenwordslist"),
      verbatimTextOutput(outputId = "res"),
      br(),
      br(),
      tags$h1("Data Science Capstone Project"),
      tags$em("Author: Pradeep Gurav,  03 August 2020"),
    )
  )
))
