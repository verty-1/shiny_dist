# Coursera Data Products Week 4 Project

library(shiny)
shinyUI(fluidPage(
  titlePanel("Shiny Application for Exploring Two Measurement Distributions"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider1", "Choose Mean Value for Test_2", 25, 30, step=.1, value = 28.5),
      checkboxInput("showstats", "Show/Hide T-Test Details", value = TRUE),
      h1(" "),
      h1(" "),
      h1(" "),
      h4("User Documentation"),
      h5("This Shiny application explores measurements that were taken from an
         instrument operating under two different conditions: Test_1 and Test_2.
         The application displays the distribution of 200 repeat measurements taken
         for each test. A Welch’s T-Test determines if the difference in the mean values
         for the two tests was statistically significant. The user can change
         the slider to select other mean values for Test_2 and estimate the
         threshold for detecting measurement differences based on the P Value.
         Raw T-Test results can be suppressed by clicking the check box.")
      ),
    mainPanel(
      h4("Difference in Means: Two-Tailed Welch T-Test"),
      plotOutput("plot1"),
      h4(textOutput("text1")),
      h5("Reject Null Hypothesis if P Value <= 0.05"),
      h2(" "),
      verbatimTextOutput("stats")
    )
  )
))
