# Statistical-Analysis-and-Prediction-of-Murder-rates-in-US

**_Fit a multiple linear regression model to predict murder rate based on the other variables.
Perform model diagnostics to check assumptions and perform any transformations needed to
obtain a model that is reasonable with respect to the standard assumptions for linear models._**
```
A: fit1 <- lm(murder.rate ~ poverty+high.school+college+single.parent+unemployed+metropolitan+region)
```
Errors have mean=0, constant variance: From residual plot we can see that the vertical scatter is constant so we can say that they are centered at 0.
Errors are normally distributed: from qqplot shows the residuals are normally distributed
Errors are independent


**_Reduce your model by removing any unimportant variables (if such variables exist). Interpret the reduced model, including coefficients and r-squared. Perform a statistical test that compares the full model to the reduced model. Clearly state the hypotheses associated with this test and interpret the results._**
```
A: fit2<-update(fit1,.~.-poverty-high.school-college-unemployed)
fit2=lm(murder.rate ~ single.parent + metropolitan + region)
```
The adjusted R2 value for fit1 is 0.6192 and for fit2 is 0.6127. even though fit1 has better R2 value the anova test contradicts the statement by saying fit2 is a better model to be used. So I’m considering fit2 as my model.

we perform anova test between fit1,fit2 to see which model to select.

Analysis of Variance Table
```
Model 1: murder.rate ~ single.parent + metropolitan + region
Model 2: murder.rate ~ poverty + high.school + college + single.parent + 
    unemployed + metropolitan + region
  Res.Df     RSS Df Sum of Sq      F Pr(>F)
1     44 107.387                           
2     40  95.991  4    11.396 1.1872 0.3312
```
Hypothesis: H0=>all slopes=0;H1=>atleast one slope!=0
According to this hypothesis, H0 is Full model is as good as the reduced model
If the p-value is very less, we can reject H0, that is use the full model as it is better than reduced model
If p-value is more, we should accept H0, that is use the reduced model as full model is not better than the reduced model

From the test we can clearly see that p value is large so we accept the reduced model.



**_Use your final model to predict murder rate of a state whose predictor values are set at the
average in the data for a quantitative predictor and the most frequent category for a qualitative
predictor._**

A:The new predicted value is 5.428477
