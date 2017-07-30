Shiny Application for Exploring Two Measurement Distributions
========================================================
author:
date: July 29, 2017
width: 1920
height: 1080


The Problem
========================================================

Laboratory instruments are often benchmarked by running repeat tests in order
to quantify variation and explore sensitivity to external factors such as ambient
temperature, humidity, process variables, and more. This application is a tool
to compare repeated measurements for two data sets, Test_1 and Test_2.

From the raw data:

- The test data measurement distribution is unknown
- It is not known if the Test_1 and Test_2 data sets are statistically different
- The threshold for detecting measurement differences between two datasets is unknown

Statistical analysis is needed to perform an "A - to - B" comparison of the data.

The Solution
========================================================

A Shiny application was created to provide an interactive dashboard for
exploring data being collected from the instrument.

The Shiny application has the following features:

- Histograms to allow visualization of the repeat measurement distributions
- Mean values of the distributions
- Underlying R analysis that enables reactive statistical calculations
- "Difference of the Means" hypothesis test to determine if the difference in the
  mean values from the two distributions are statistically significant

    -- Null Hypothesis Ho: Test_2_Mean - Test_1_Mean = 0

    -- Welch T-Test

    -- P Value <= 0.05 rejects the Null hypothesis (mean values for the tests are different)

- Interactive features implemented through an interactive dashboard


Statistical Analysis Code Chunk
========================================================




```r
z1 <- t.test(df$Values[df$Measurement == "Test_1"],
                df$Values[df$Measurement == "Test_2"])
z1$p.value
```

```
[1] 4.993262e-47
```

```r
z1
```

```

	Welch Two Sample t-test

data:  df$Values[df$Measurement == "Test_1"] and df$Values[df$Measurement == "Test_2"]
t = -16.833, df = 350.95, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -1.1008313 -0.8704986
sample estimates:
mean of x mean of y 
 27.99463  28.98030 
```


Shiny Application and User Interface
========================================================
![title](screenshot.png)

MORE INFORMATION
- Application: https://verty-1.shinyapps.io/shiny_dist/
- Github Code: https://github.com/verty-1/shiny_dist
- RPubs Pitch Slides: http://rpubs.com/kdvertin/shiny_dist



