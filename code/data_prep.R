require(dplyr)

#################
### load data ###
#################

## captures and sightings of T. sirtalis at Butler and Matteoli
## only includes T. sirtalis that got a Microbrand
## Branding officially began on 6/11/17 (first brand on 6/13/17), 
## but one snake (MB 11) was branded on 6/2/17
c <- read.csv('data/sirtalis_cap_sighting_2017.csv')

## how many individuals were captured and branded?
length(unique(c$Microbrand))

# how many times was each snake captured?
table(c$Microbrand)

# make a histogram of captures
hist(table(c$Microbrand))

# most snakes captured once
# how many marked snakes were recaptured?
length(which(table(c$Microbrand)>1))

# what proportion of marked snakes were recaptured?
length(which(table(c$Microbrand)>1)) / 
  length(table(c$Microbrand))

## add a site column
c$site <- NA

c$site <- ifelse(grepl('Matt', c$Trapline), 'MATT', 'BUT')

## morphology data for T. sirtalis
d <- read.csv('data/sirtalis_morphology_2017.csv')

length(unique(d$Microbrand))

## are any snakes missing morphology?
filter(c, !(Microbrand %in% d$Microbrand))

missing.morph.mb <- filter(c, !(Microbrand %in% d$Microbrand))$Microbrand
# investigate these MBs
missing.morph.mb
