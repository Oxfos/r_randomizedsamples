This is an r program that calculates the significance of a calculated ANOVA's mean sum of squares value
of certain factor(s) (i.e. treatment) on a response variable by randomly sampling the data set and comparing the obtained mean sum of squares.
In essence it answers the question: what is the probability of obtainint this mean sum of squares given these factors in this data set?
And thus indicating whether a factor has a significant effect or not on the rsponse.

It is awesome when you do not want to make assumptions on your data set (i.e. normality, simmetry etc.)

What the function does:

1. Calculates ANOVA for a data set.
2. Calculates ANOVA for each data set obtained by sampling x times the original data set (with random permutation of the set, thus allowing resampling).
3. For each factor of the original data set it calculates - from all ANOVA sets - the probability of obtaining a bigger Mean Sq. than the original data set.
4. Plots the Mean sq. for each factor.
5. It returns the calculated probabilities.
