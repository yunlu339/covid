***stata codes for the article "Disease, Scapegoating, and Social Contexts" published in Journal of Health and Social Behavior
***Yun Lu
***October 16, 2023

******************************variable name explanation
***num: the number of Twitter users who support the racist naming of COVID-19
***cases: the number of COVID-19 infection cases   
***deaths: the number of COVID-19 death cases  
***pop: county population in 2019
***lognumper: the naturally logged ratio of users who support the racist naming of COVID-19
***numper25: the top quartile of the ratio of users who support the racist naming of COVID-19
***logdeathper: the naturally logged COVID-19 mortality rate   
***logcaseper: the naturally logged COVID-19 infection rate   
***nwaperdif10: minority percentage change between 2019 and 2010
***logincome2019: the naturally logged household median income in 2019
***gini: Gini index
***notinsure19: the percentage of households without health insurance
***nwaper19: minority percenage in 2019
***aaper19: Asian American percentage in 2019
***broadband: the percentage of households with broadband internet access
***allcol: the percentage of people with at least some college education
***gop: the percentage of Trump's vote share in 2016 presidential election
***femaleper2019: the percentage of female residents in 2019
***medianage2019: the median age of residentsi in 2019

*****************************Table 3
mixed  lognumper   ///
    if !missing(logdeathper, nwaperdif10 , logincome2019, ///
       gini, notinsure19, nwaper19, aaper19 ,   /// 
         broadband, allcol, gop ,femaleper2019, medianage2019)   || stcode:

mixed  lognumper  logdeathper  nwaperdif10 logincome2019  ///
     gini   notinsure19 c.nwaper19   aaper19  /// 
         broadband allcol   gop  femaleper2019  medianage2019 ///
       || stcode:   
estimates store m1	   
	   
mixed  lognumper  c.logdeathper##c.nwaperdif10 logincome2019    ///
     gini   notinsure19 nwaper19   aaper19  /// 
         c.broadband c.allcol   gop  femaleper2019  medianage2019 ///
          || stcode:
estimates store m2
		  
mixed  lognumper  c.logdeathper##c.nwaperdif10##c.logincome2019    ///
     gini   notinsure19 nwaper19  aaper19  /// 
      broadband allcol   gop  femaleper2019  medianage2019 ///
            || stcode: 
estimates store m3

*****************************Figure 2 and 3
estimates restore m2
qui margins, dydx(logdeathper) at(nwaperdif10=(0 (.01)  .1)    )
marginsplot	

estimates restore m3
qui margins, dydx(logdeathper) at(nwaperdif10=(0 (.01)  .1)  logincome2019=(10.6)  )
marginsplot	
qui margins, dydx(logdeathper) at(nwaperdif10=(0 (.01)  .1)  logincome2019=(11.1)  )
marginsplot	