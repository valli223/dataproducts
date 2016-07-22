GetBMI
========================================================
author: Vamsee Addepalli
date: 22-Jul-2016

Application Requirement
========================================================

- BMI (Body Mass Index) is a critical measure that has been relied upon for a quick and easy understanding of general health situation at any point.
- In this context, this application tries to perform the following functionalities :
    + Provides a mechanism to get the value of BMI for a person, given his/her Weight and Height.
    + Using the R in-built Women data set, plots a graph showing the standard BMI values expected.  
    + Provides an advisory statement, based on a comparison between the BMI value of the user vs the Standard (as per Women Data set).  


Application Design
========================================================

- The Application follows a standard 'Sidebar + MainPanel' layout.  
- It contains a brief description of its functionalities on the very top for ease of use.  
- The Sidebar contains two sections, which are detailed below:
    + Top Section contains a slider input for selecting Weight (in Lbs) and two numeric inputs for choosing Height in Feet and Inches respectively. A 'Go-Button' is also placed to ensure reactivity.
    + Bottom Section contains a Select box each for choosing X-Axis and a Factor variable for coloring the plot.
    + A Checkbox is also placed to specify whether the plot should be smooth or scatterplot.


Application Design (Contd.)
========================================================

- The Main panel consists of the following:
    + A Plot, of BMI vs the dynamically chosen x-axis, is rendered using Women Data set and the additional point (colored in RED and having a greater size) to mark the BMI of the new person.
    + Two Text outputs - one showing number of observations and the other providing the advisory statement based on BMI value.


Application Data
========================================================

- The Base Assumption 
    + R in-built data set - Women - can be used for specifying Standard BMI values of any healthy person.
- The BMI Calculation is done using the following code  
    $$ bmi = (weight (lbs) * 0.45) / ((height (inches) * 0.025) ^ 2) $$
- Summary of BMI values from the Women Data set is given below
    
    ```
       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
      22.63   22.75   23.01   23.27   23.70   24.61 
    ```

Application Run
========================================================

- The output of the application is a plot showing BMI value and an advisory based on comparison with Standard BMI values from Women Data set.
- The highlighted points in the plots correspond to the user's inputs.

    ![plot of chunk unnamed-chunk-2](GetBMI-figure/unnamed-chunk-2-1.png)
    
Thank You
========================================================
