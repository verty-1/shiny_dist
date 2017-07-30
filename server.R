# Coursera Data Products Week 4 Project

library(ggplot2)
library(shiny)


# Read data and assemble
rm(list = ls())
set.seed(12)
a <- c(rnorm(200, 28, .5), rnorm(200, 29, .7))
b <- c(rep("Test_1", 200), rep("Test_2", 200))
df0 <- cbind.data.frame(b,a)
names(df0) <- c("Measurement", "Values")

shinyServer(function(input, output) {

output$plot1 <- renderPlot({
        shift <-  input$slider1 - 28.9803
        df <- df0
        df$Values[df$Measurement == "Test_2"] <-
                df$Values[df$Measurement == "Test_2"] + shift

        ggplot(df, aes(Values, fill = Measurement)) + geom_density(aes(y=..count..), alpha = 0.7 ) +
        labs(y="Counts") +
        labs(title="Histogram Distributions") +
        labs(fill="Test Number") +
        scale_fill_manual(values = c("Test_1" = "red", "Test_2" = "dodgerblue2")) +
        theme_bw() +
        labs(x="Measured Value") +
        geom_vline(xintercept = mean(df$Values[df$Measurement == "Test_1"]), size=1, colour = "red") +
        geom_vline(xintercept = mean(df$Values[df$Measurement == "Test_2"]), size=1, colour = "navyblue") +
        # geom_text(aes(label="Test_1 Mean", x=39, y=950), size=9, colour = "red") +
        # geom_text(aes(label="Test_2 Mean", x=48, y=950), size=9, color = "dodgerblue2") +
                coord_cartesian(xlim = c(26,31), ylim = c(-10, 200), expand=TRUE) +
                scale_x_continuous(breaks=c(26,27,28,29,30))  +
                scale_y_continuous(breaks=c(0,50,100,150,200))  +
        theme(axis.text=element_text(size=18), axis.title.x=element_text(size=18),
              axis.title.y=element_text(size=18),
              legend.title=element_text(size=18), legend.text=element_text(size=16),
              plot.title=element_text(size=18))
              #legend.position = "c(28,3800)")
        })

zv <- reactive({
        shift <-  input$slider1 - 28.9803
        df <- df0
        df$Values[df$Measurement == "Test_2"] <-
                df$Values[df$Measurement == "Test_2"] + shift
        z1 <- t.test(df$Values[df$Measurement == "Test_1"],
                df$Values[df$Measurement == "Test_2"])
        })

output$text1 <- renderText({
        print(paste("P Value =", zv()$p.value))
        })

output$stats <- renderPrint({
        ifelse(input$showstats, print(zv()), "")
        })
})




