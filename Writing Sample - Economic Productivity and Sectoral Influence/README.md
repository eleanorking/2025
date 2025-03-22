**Economic Productivity and Sectoral Influence**

Eleanor King

**Introduction**

Understanding the relationship between metropolitan population size and economic output is a critical function for urban planners and policymakers. Previous research suggests that Gross Metropolitan Product (GMP) follows a supra-linear power law scaling relationship with population size, implying that larger metropolitan areas experience disproportionately higher economic productivity. This argument supports policies that encourage migration from rural to urban areas, as such moves could enhance overall economic efficiency (Bettencourt). 

However, alternative explanations challenge this view. Some scholars argue that the concentration of specific economic sectors, rather than population size alone, explains the variations in GMP. Financial services, information and communication technology (ICT), and professional services are disproportionately located in major metropolitan areas, and their presence may drive economic productivity independent of supra-linear scaling effects (Hathaway, Wu). 

This paper assesses whether a supra-linear power law characterizes the GMP population regression and evaluates whether alternative models better explain variation in GMP. Using data from the U.S. Census Bureau and Bureau of Economic Analysis for MSAs in 2006, this study compares multiple statistical models and evaluates their fit using appropriate loss functions. Ultimately, this analysis seeks to determine whether supra-linear scaling provides the best explanation for metropolitan economic output or if sectoral composition offers a more robust framework. 
Methodology
To assess the relationship between GMP and population size, we utilized three models. Firstly, GMP was modeled as a function of population size: Y = cNb where Y represents GMP, N represents the population, and b > 1 indicates supra-linear scaling (Bettencourt). This model is log-transformed to facilitate linear regression: log Y = log c + b log N. The model is of the form: log(Y) = 0 +1log(N). 

In addition to this model, we introduced three alternative models which included additional predictors to capture the influence of economic sector composition. The first alternative model includes sectoral shares in finance in order to assess the finance sector’s effects on GMP. The model is of the form: log(Y) = 0 +1log(Finance * N) + 3log(N). The second alternative model includes sectoral shares in the ICT sector in order to assess the sector’s effects on GMP. The model is of the form: log(Y) = 0 +1log(ICT * N) + 3 log(N). The third alternative model considers the combination of the effects from the sectors on GMP. The model is of the form log(Y) = 0 +1log(ICT * N) + 3 log(Finance * N) + 3 log(N)

Data for these models were cleaned and missing values were addressed, with a focus on including variables for population size, finance and ICT sector shares, and their interactions. In particular, we omitted all rows containing any missing values, ensuring that only complete rows are included in our analyses. Model fit is assessed using cross-validated estimates of root mean squared error (RMSE). Residual diagnostics, including the examination of residual patterns, were performed to assess the validity of linear regression assumptions, in particular homoscedasticity, the assumption of equal variance across a set of data (see Appendix III).

**Results**

The initial analysis using the power-law model indicated that the relationship between GMP and population size follows a supra-linear scaling pattern. Specifically, the estimated slope for the log transformed population variable was greater than 1, providing support for the hypothesis that GMP grows at a faster rate than population size. 

When sectoral composition variables were included in the first of the two alternative models, model fit (by cross validated estimates of generalization error) incrementally improved indicating that individual sector share may play a small role in explaining variations in GMP. However, when both interaction terms between population size and sectoral shares were included in the model, we saw a significantly smaller RMSE as compared to the first alternative model with RMSE being approximately 0.011 less for alternative model 3 than the base model. This suggests that incorporating interaction effects between multiple sectors' shares and population size enhances the models explanatory power and demonstrates that there may be some population based amplification of the effect of the finance and ICT sectors on GMP, where larger metropolitan areas benefit more from the presence of these industries. 

The following table represents the cross-validated RMSE values for the four models evaluated in the study. The differences in RMSE emphasize the importance of considering population size in tandem with sectoral influence across metropolitan areas and across sectors. Cross-validated RMSE was calculated using 10-fold cross-validation, which measures the average deviation between the observed and predicted log-transformed values of GMP. 

| Model  | RMSE Loss (Cross-Validated |
|------------|------------|
| Base Model| 288 | 0.222584 | 
| Alternative Model 1| 0.2222759 | 
| Alternative Model 2 | 0.2132464 |
| Alternative Model 3 | 0.2114828 |

**Discussion**

These findings suggest that while larger metropolitan areas exhibit supra-linear scaling in GMP, sectoral composition likely plays a role in economic productivity. The base model reveals a strong relationship between population size and GMP, with larger cities demonstrating higher levels of economic output. However, the improvement in model fit when accounting for the Finance and ICT sectors suggests that the presence of these high value industries may drive a portion of the observed scaling effect.

Consequently, policies focused solely on encouraging migration to large cities may overlook the role that industry specific growth plays in smaller metropolitan areas. While MSAs typically exhibit higher productivity, smaller cities with strong finance and ICT sectors could offer more competitive economic opportunities as compared to smaller cities without such sectors. Focusing economic growth on the expansion of the ICT and finance industries could be a more effective strategy for balancing economic growth across regions. Economic opportunity depends not only on population growth, but also on industry presence. 

Ultimately, while the power law model provides a useful heuristic for understanding the general relationship between population size and economic output, a more nuanced understanding of economic productivity requires consideration of industrial composition. Future research could extend this analysis by incorporating additional economic indicators, such as wage levels and cost of living, to refine recommendations for economic planning.

Several limitations should be considered in this analysis. Firstly, the dataset used in this study is from 2006, which may not fully reflect current economic dynamics, particularly when considering shifts in sectoral composition in the economy and technological advancements. And potentially more significant, is that RMSE tends to decrease as more predictors are added to a model, meaning that the reduction in RMSE observed in the alternative models do not necessarily imply a better explanatory relationship, but rather suggests improved in-sample fit. Future studies utilizing more recent data and exploring ut of sample validation techniques could provide deeper insight into the relationship between population size, industry presence, and economic productivity. 


























**Works Cited**

Bettencourt, Luís M. A., et al. “Growth, Innovation, Scaling, and the Pace of Life in Cities | Proceedings of 
the National Academy of Sciences.” PNAS, Proceedings of the National Academy of Sciences of 
the United States of America, 24 Apr. 2007, www.pnas.org/doi/abs/10.1073/pnas.0610172104. 
Hathaway, Ian, et al. “High-Growth Firms and Cities in the US: An Analysis of the Inc. 5000.” 
Brookings, 9 Mar. 2022, www.brookings.edu/articles/high-growth-firms-and-cities-in-the  
-us-an-analysis-of-the-inc-5000/. 
Wu, Yue, and Dong-Shang Chang. “Decomposing the Comprehensive Efficiency of Major Cities 
into Divisions on Governance, ICT and Sustainability: Network Slack-Based Measure 
Model.” Nature News, Nature Publishing Group, 23 Apr. 2024, www.nature.com/articles  
/s41599-024-03016-2. 
