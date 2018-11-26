# US Arrests Demo

Learn how to make interactive data visualization using R and Shiny!

In this demo, we want the user to be able to generate a visualization comparing crime rates between states within a region of the United States.

The user will select a region and a crime type and will see a bar plot of crime rates by state.

The best part is that the user will be able to create their own custom plots without needing to write any R code themselves! 

## Links:

- [My slides on this demo.](https://docs.google.com/presentation/d/1JmsdAFdszzb4P4I3lxWRBLSZ89Jx_vbIu3p4YVOfAdc/edit?usp=sharing)
- [Live Shiny app. See what the result looks like!](https://andreybutenko.shinyapps.io/shiny-demo-arrests/)

## Datasets

We are using the `USArrests` and `state.region` datasets built into R:

- `USArrests` shows crime data by state.
- `state.region` categorizes states by South, West, Northeast, and North Central.

Use the `data()` function to see the datasets built into R.

## Project Structure

- `ui.R`: the display part of a Shiny app, what the user sees and interacts with. It also has placeholders for output.
- `server.R`: the server part of a Shiny app is what manipulates the data and generates plots for display.