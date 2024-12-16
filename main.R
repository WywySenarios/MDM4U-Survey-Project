# Install necessary packages
library(curl)
library(stringr)
if (!requireNamespace("showtext", quietly = TRUE)) install.packages("showtext")

library(showtext)

# Load the Quicksand fonts
font_add_google("Quicksand", "quicksand")

# Enable showtext for font rendering
showtext_auto()

# global settings:
par(family = "quicksand")

# gather data
responses <- read.csv("responses.csv")

# config variables :)
singleVarStats <- list(responses$In.terms.of.quality..how.would.you.rate.new.media.of.this.type.nowadays.,
                    responses$In.terms.of.originality..how.would.you.rate.new.media.of.this.type.nowadays.,
                    responses$How.do.you.feel.this.media.type.has.been.doing.compared.to.in.the.past.)
singleVarStatsNames <- c("Perception of Media's Quality", "Perception of Media's Originality", "Perception of Media's Improvement")

# create charts
boxplot(singleVarStats,
        names=singleVarStatsNames,
        ylab="Rating (/5)",
        xlab="Metric",
        main="Perception of Media Industries")


# Custom function to calculate statistical mode (thanks GPT!)
statistical_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

str(singleVarStats)  # Check the structure of singleVarStats
for (x in 1:length(singleVarStats)) {
  print(cat("Mean and Mode of ", singleVarStatsNames[x], ": ", as.character(mean(singleVarStats[[x]], na.rm=TRUE)),", ", as.character(statistical_mode(singleVarStats[[x]]), na.rm=TRUE)))
  print(cat("Quartiles of ", singleVarStatsNames[x], ": ", quantile(singleVarStats[[x]], prob=c(.25, .5, .75), na.rm=TRUE)))
  print(cat("SD: ", sd(singleVarStats[[x]], na.rm=TRUE)))
  
  hist(singleVarStats[[x]],
       breaks = c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5),
       include.lowest = TRUE,
       main=singleVarStatsNames[x],
       xlab="Rating (/5 stars)",
       col="#4285f4",
       xlim=c(0.5,5.5),
       ylim=c(0, 30))
}


# hours per day histogram

hoursPerDay <- read.csv("hoursPerDay.csv")
hoursPerDay <- hoursPerDay$Average.Hours.per.day

hist(hoursPerDay,
     breaks = c(0, 1, 2,3,4,5),
     include.lowest = TRUE,
     main="Time Spent Around a Single Type of Media Per Day",
     xlab="Time Spent (h/day)",
     col="#4285f4",
     xlim=c(0,5),
     ylim=c(0, 30))

print(cat("Mean and Mode of hours per day: ", as.character(mean(hoursPerDay, na.rm=TRUE)),", ", as.character(statistical_mode(na.omit(hoursPerDay)))))
print(cat("Quartiles of hours per day: ", quantile(hoursPerDay, prob=c(.25, .5, .75), na.rm=TRUE)))
print(cat("SD: ", sd(hoursPerDay, na.rm=TRUE)))