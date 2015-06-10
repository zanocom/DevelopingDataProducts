    

# http://shiny.rstudio.com/tutorial/lesson2/

    library ( shiny )

    shinyUI(
      fluidPage(
      
        # Application title
        titlePanel("Maximum Heart Rate Calculator")  ,
        # Sidebar with a slider input for the number of bins
        sidebarLayout(
          sidebarPanel(
              dateInput("date", "Birth Date:") ,
              radioButtons(inputId="gender", label="Gender: ", choices=c("Male","Female"), selected = "Male", inline = FALSE),
              actionButton("goButton", "Submit")
              ),
            
            # Show a plot of the generated distribution
          mainPanel(
              # plotOutput("distPlot")
              tabsetPanel(
                tabPanel("Instruction",
                                        h3("The maximum heart rate (HRmax) is the highest heart rate an individual 
                                           can achieve without severe problems through exercise stress, 
                                           and generally decreases with age.
                                           The most accurate way of measuring any single person's HRmax is via a cardiac stress test.
                                           For general purposes, a formula is often employed to estimate a person's maximum heart rate.
                                           Some formulas are differentiated between males and females."),
                                        h4(a("Wikipedia",href="http://en.wikipedia.org/wiki/Heart_rate")) ,
                                        h3 ("This calculator computes HRmax using different formulas.
                                           The user only need to input her birth date and her gender to get maximum heart rate and press Submit button.
                                           The HRmax is shown in tab Calculator"),
                                        h4(a("Details on Github",href="https://github.com/zanocom/DevelopingDataProducts")) 
                        ) ,
                tabPanel("Calculator",
                         p('Max Heart Rate Haskell'),
                                      textOutput("haskell"),
                         p(""),
                         p('Max Heart Rate Tanaka'),
                                      textOutput("tanaka") ,
                         p(""),
                         p('Max Heart Rate Robergs'),
                                       textOutput("robergs"),
                         p(""),
                         p('Max Heart Rate Gulati'),
                                       textOutput("gulati"),
                         p(""),
                         p("Max Heart Rate Gellish"),
                                       textOutput("gellish")
                         )
              )
          )
        )    
      )
    )
    
    
    
    
    
