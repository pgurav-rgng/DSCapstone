library(shiny)
source("backoffmethods.R")

shinyServer(function(input, output,session) {
  
  value <- reactiveVal(0)
  
  output$next_word<-renderPrint({
    value()
  });
  
  observeEvent(input$plus, {
    value(newValue)             
  });
  
  suggestionslist <- reactiveValues(choices = c("")
                           ,selected = "")
  
  output$chosenwordslist <- renderUI({
    s1<-get_words_with_backoff(input$inputText,2)#bigram
    s1<-s1[[1]]
    s2<-get_words_with_backoff(input$inputText,3)#trigram
    s2<-s2[[1]]
    s3<-get_words_with_backoff(input$inputText,4)#quadgram
    s3<-s3[[1]]
    suggestions <- c(s3, s2, s1);#combine all words
    suggestions<-suggestions[!is.na(suggestions)]
    suggestions <- unique(unlist(suggestions))
    value(as.String(suggestions[1]))
    suggestionslist$choices<-suggestions
    radioButtons(inputId = "list",
                     label = "Type or choose another word of your choice if this is not a good match:",
                     choices = suggestionslist$choices,
                     selected = suggestionslist$selected
    )
  })
  
  observeEvent(input$list,{
    suggestionslist$selected <-input$list
    usethis<-paste(input$inputText,suggestionslist$selected,sep = " ")
    #message(paste("combined word",usethis))
    updateRadioButtons(session, "list", choices = suggestionslist$choices,selected= suggestionslist$selected )
    updateTextInput(session, "inputText",
                    label = "",
                    value = usethis)
  })
  
  output$story <- renderPrint({ as.String(input$inputText) })
  
})


