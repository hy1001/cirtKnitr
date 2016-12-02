
library("RMySQL")

con <- dbConnect(RMySQL::MySQL(), dbname = "cirt", username = "", password = "", host = "")


#SiteMetrics <- dbGetQuery( con, "SELECT * from SiteMetrics WHERE isThisMostRecent = 1;" )
SiteMetrics <- dbGetQuery( con, "SELECT * from removeME;" )

dbDisconnect(con)

 # str( SiteMetrics )

 ### trimming extra space at the end
 trim <- function (x) gsub("^\\s+|\\s+$", "", x)
 SiteMetrics$SiteID <- trim( SiteMetrics$SiteID )

 ##  make my data
 ## Sites <- c( "US-U100", "US-U122" , "CA-O600")

 ## Ward <- rep(c(rep("ICU", 10), rep("Medicine", 10)), 2)
 ## Month <- rep(seq(1:10), 4)
 ## Outcomes <- rnorm(40, 20, 5)
 ## df <- data.frame(Hospital, Ward, Month, Outcomes)

 ## df <- data.frame( Sites, Month )

 ## knitr loop
 library("knitr")

# for ( site in SiteMetrics$SiteID[c(1:3, 24, 122, 200:300)] ){
  ##for ( site in SiteMetrics$SiteID[c( 122, 200, 300)] ){
for ( site in SiteMetrics$SiteID ){
      # print ( site );
      ##knit2pdf("testingloops.Rnw", output=paste0('report_', hosp, '.tex'))
      #knit2pdf("hptest1.Rnw", output=paste0('SiteStatusReport_', site, '_Oct2015.tex'))
      knit("hptest1.Rnw", output=paste0('SiteStatusReport_', site, '.tex'))
      #Sys.sleep(5)
  }

