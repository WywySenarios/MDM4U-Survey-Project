responses <- read.csv("responses.csv")


plot (x = responses$In.terms.of.quality..how.would.you.rate.new.media.of.this.type.nowadays.,
      y=responses$In.terms.of.originality..how.would.you.rate.new.media.of.this.type.nowadays.)

boxplot(responses$In.terms.of.quality..how.would.you.rate.new.media.of.this.type.nowadays.)

hist(responses$In.terms.of.originality..how.would.you.rate.new.media.of.this.type.nowadays.,
     breaks = c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5),
     include.lowest = FALSE,
     main="Originality of Media Nowadays",
     xlab="Rating (/5 stars)",
     xlim=c(0.5,5.5))