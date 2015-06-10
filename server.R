
  
    age <- function(from, to) {
      from_lt = as.POSIXlt(from)
      to_lt = as.POSIXlt(to)
      
      age = to_lt$year - from_lt$year
      
      ifelse(to_lt$mon < from_lt$mon |
               (to_lt$mon == from_lt$mon & to_lt$mday < from_lt$mday),
             age - 1, age)
    }
    
    mhrcalculator <- function ( bdate , sex ) {
      today   <- Sys.Date()  
      age_comp  <- age( bdate, today)
      haskell <- round( 220- age_comp ,0)
      tanaka  <- round( 208 - (0.7 * age_comp) ,0)
      robergs <- round( 205.8 - (0.685 * age_comp) ,0)
      gulati  <- ifelse( sex=="Female" , round( 206 - (0.88 * age_comp),0)  ,  "Women Only" ) 
      gellish <- round( ifelse( sex=="Male" , 203.7 / ( 1 + exp( 0.033*(age_comp-104.3) ) )  ,  190.2 / ( 1 + exp( 0.0453*(age_comp-107.5) ) ) ) ,0)
      return ( list( "haskell"= haskell , "tanaka"= tanaka , "robergs"= robergs , "gulati"= gulati , "gellish"=gellish ) )
    }

#      str(mhrcalculator("1973-08-07","Male"))
#      mhrcalculator("1973-08-07","Male")$haskell
#         
    shinyServer(function(input, output) {
              output$inputDate   <- renderText({input$date})
              output$inputGender <- renderText({input$gender})
              output$haskell <- renderText({input$goButton
                                             isolate(mhrcalculator(input$date,input$gender)$haskell)})
              output$tanaka  <- renderText({input$goButton
                                              isolate(mhrcalculator(input$date,input$gender)$tanaka)})
              output$robergs <- renderText({input$goButton
                                              isolate(mhrcalculator(input$date,input$gender)$robergs)})
              output$gulati  <- renderText({input$goButton
                                              isolate(mhrcalculator(input$date,input$gender)$gulati)})
              output$gellish <- renderText({input$goButton
                                              isolate(mhrcalculator(input$date,input$gender)$gellish)})
              })
    
    
#     diabetesRisk <- function(glucose) glucose / 200
#     shinyServer(
#       function(input, output) {
#         output$inputValue <- renderPrint({input$glucose})
#         output$prediction <- renderPrint({diabetesRisk(input$glucose)})
#       }
#     )











