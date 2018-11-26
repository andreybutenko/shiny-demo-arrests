library(shiny)
library(dplyr)
library(ggplot2)

# Use data() to see a list of datasets built into R!
# We will use two datasets:
#  1) USArrests shows crime data by state
#  2) state.region categorizes states by South, West, Northeast, and North Central

# Let's set up a dataframe that has USArrest data and region data
arrests <- as.data.frame(USArrests)
arrests$region_name <- state.region
arrests$state <- rownames(arrests)

# First, let's create a function that generates the plot we want agnostic of Shiny.
# It should take in our two inputs -- region and crime_type -- and return a plot
# of crime rates for that crime within that region.
generate_crime_plot <- function(region, crime_type) {
  arrests %>% 
    # Let's filter to the specified region:
    filter(region_name == region) %>% 
    
    # Now, let's create a plot!
    # We are creating a bar plot. We add `stat = 'identity'` as a parameter, since we want
    # the y-axis to represent the number in the dataframe.
    # Since our y-axis is variable based on inputs, we cannot define it with `aes(...)` like we
    # usually do. Instead, we use `aes_string(...)`
    ggplot() + 
    geom_bar(aes_string(x = 'state', y = crime_type), stat = 'identity') +
    ggtitle(paste(crime_type, 'rates by state in', region, 'region'))
}
# Sample calls:
#  - generate_crime_plot('West', 'Assault')
#  - generate_crime_plot('South', 'Murder')

# Use shinyServer() function to set up the server part of a Shiny app.
# The server part of a Shiny app is what manipulates the data and generates plots for display.
# You have access to two variables within shinyServer:
#  1) input is a list you do not edit, you only get values from it.
#     input contains all of the input variables defined in the ui.R file.
#     We defined dropdown lists for region and crime_type.
#     To access these, we do input$region and input$crime_type.
#  2) output is a list you define with the results you want to display.
#     We only have one output: output$crime_plot
#     You may have several, and they do not have to be plots.
#     You can output plots, text, or even parts of the UI!
shinyServer(function(input, output) {
   
  # We are creating an output called `crime_plot`
  # Since it is a plot, we surround the value in the reactive expresssion `renderPlot({ ... })`
  output$crime_plot <- renderPlot({
    generate_crime_plot(input$region, input$crime_type)
  })
  
})
