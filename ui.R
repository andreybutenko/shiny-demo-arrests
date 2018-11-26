library(shiny)

# Use shinyUI() function to set up the display part of a Shiny app.
# The display part of a Shiny app is what the user sees and interacts with.
# The display part of a Shiny app also has placeholders for output.
shinyUI(fluidPage(
  
  titlePanel("US Arrest Data"),
  
  # We want widgets for the user to interact with on the left side of the screen,
  # and the output of the plot on the right side of the screen. To accomplish this,
  # we use a sidebarLayout!
  # Each sidebarLayout must contain one sidebarPanel and one mainPanel.
  sidebarLayout(
    
    # sidebarPanel is what goes on the left side. We can put as many widgets as we
    # want in here! Each widget is one interactable component that the user can
    # use to edit the output.
    sidebarPanel(
      
      # selectInput is a dropdown menu with three required arguments:
      #  1) inputId is the unique ID which you use to access the value.
      #     In server.R, you can access the values with input$region and input$crime_type.
      #  2) label is the human-readable text that labels the dropdown.
      #  3) choices are the choices the user can select in the dropdown.
      #     We want the user to select the region and the types of crime to plot.
      selectInput('region',
                   label = 'Region',
                   choices = unique(state.region)),
       
      selectInput('crime_type',
                   label = 'Crime Type',
                   choices = colnames(USArrests)[-3])
    ),
    
    # mainPanel is the the other part of a sidebarLayout that takes up the most space.
    # This is where we want to display the results!
    mainPanel(
      
       # This is a placeholder for the plot created in server.R
       # In server.R we assign the plot to output$crime_plot, and we display it thisway:
       plotOutput('crime_plot')
    )
  )
))
