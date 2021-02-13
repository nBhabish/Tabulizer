

# install.packages(c("shiny", "miniUI")) - don't run this 
# install.packages("pdftools")           - don't run this
# install.packages("stringr")            - don't run this
# library(stringr)                       - don't run this

# Loading Configurations

install.packages("tabulizer")
install.packages("janitor")
install.packages("tidyverse")
install.packages("here")
library(tabulizer)
library(here)
library(tidyverse)


# Extracting area of 4 corners of the table that we want to extract
locate_areas(here("2008.pdf"), pages = 3)

# Tidying up data
test2008 <- extract_tables("2008.pdf",
                           guess = FALSE,
                           pages = 3,
                           area = list(c(
                             94.487936, 9.796247, 497.919571, 398.364611
                           )))

# Creating a df

df2008 <- data.frame(test2008[[1]])

df2008 %>%
  view()

# Shifting row 1 as column name
df2008 <- df2008 %>%
  janitor::row_to_names(row_number = 1)

# Renaming the columns
wy2008CleanCounty <- df2008 %>%
  rename(
    County = "",
    Republican.2008 = "Cynthia M. Lummis - R",
    Democrat.2008 = "Gary Trauner - D",
    Libertarian.2008 = "W. David Herbert - L",
    Write.Ins.2008 = "Write-Ins"
  )

# Removing comas:
wy2008CleanCounty$Republican.2008 <-
  as.numeric(gsub(",", "", wy2008CleanCounty$Republican.2008))
wy2008CleanCounty$Democrat.2008 <-
  as.numeric(gsub(",", "", wy2008CleanCounty$Democrat.2008))
wy2008CleanCounty$Libertarian.2008 <-
  as.numeric(gsub(",", "", wy2008CleanCounty$Libertarian.2008))
wy2008CleanCounty$Write.Ins.2008 <-
  as.numeric(gsub(",", "", wy2008CleanCounty$Write.Ins.2008))

# Adding "State" column
wy2008CleanCounty <- wy2008CleanCounty %>%
  mutate(State = "Wyoming")

# Dropping row 24
wy2008CleanCounty <- wy2008CleanCounty[-24, ]

# Indexing the table
rownames(wy2008CleanCounty) <- 1:nrow(wy2008CleanCounty)


write.csv(wy2008CleanCounty, "wy2008CleanCounty.csv")


# -------------------------------------------------------------
# Working with 2010 House Data

locate_areas(here("2010.pdf"), pages = 1)

# Tidying up the data
test2010 <- extract_tables("2010.pdf",
                           guess = FALSE,
                           pages = 1,
                           area = list(c(138.64339, 21.08837, 466.79343, 501.82817)))

# Creating a df
df2010 <- data.frame(test2010[[1]])


# Checking the colnames
colnames(df2010)

# Renaming the columns
wy2010CleanCounty <- df2010 %>%
  rename(
    County = "X1",
    Republican.2010 = "X2",
    Democrat.2010 = "X3",
    Libertarian.2010 = "X4",
    Write.Ins.2010 = "X5"
  )

# Removing comas
wy2010CleanCounty$Republican.2010 <-
  as.numeric(gsub(",", "", wy2010CleanCounty$Republican.2010))
wy2010CleanCounty$Democrat.2010 <-
  as.numeric(gsub(",", "", wy2010CleanCounty$Democrat.2010))
wy2010CleanCounty$Libertarian.2010 <-
  as.numeric(gsub(",", "", wy2010CleanCounty$Libertarian.2010))
wy2010CleanCounty$Write.Ins.2010 <-
  as.numeric(gsub(",", "", wy2010CleanCounty$Write.Ins.2010))

# Dropping row 24
wy2010CleanCounty <- wy2010CleanCounty[-24, ]

write.csv(wy2010CleanCounty, "wy2010CleanCounty.csv")

write.csv(wyHouseOfRep, "wyHouseOfRep.csv")

# -------------------------------------------------------------
# Working with 2016 House Data

locate_areas(here("2016.pdf"), pages = 3)

# Tidying up the df
test2016 <- extract_tables("2016.pdf",
                           guess = FALSE,
                           pages = 3,
                           area = list(c(151.76944, 16.16622, 489.76408, 488.70241)))

# Extracting df from list
df2016 <- data.frame(test2016[[1]])

colnames(df2016)

# Renaming columns
wy2016CleanCounty <- df2016 %>%
  rename(
    County = "X1",
    Republican.2016 = "X2",
    Democrat.2016 = "X3",
    Libertarian.2016 = "X4",
    Constitution.2016 = "X5",
    Write.Ins.2016 = "X6"
  )

# Removing comas
wy2016CleanCounty$Republican.2016 <-
  as.numeric(gsub(",", "", wy2016CleanCounty$Republican.2016))
wy2016CleanCounty$Democrat.2016 <-
  as.numeric(gsub(",", "", wy2016CleanCounty$Democrat.2016))
wy2016CleanCounty$Libertarian.2016 <-
  as.numeric(gsub(",", "", wy2016CleanCounty$Libertarian.2016))
wy2016CleanCounty$Constitution.2016 <-
  as.numeric(gsub(",", "", wy2016CleanCounty$Constitution.2016))
wy2016CleanCounty$Write.Ins.2016 <-
  as.numeric(gsub(",", "", wy2016CleanCounty$Write.Ins.2016))

# Indexing the df
rownames(wy2016CleanCounty) <- 1:nrow(wy2016CleanCounty)

# Removing row 24
wy2016CleanCounty <- wy2016CleanCounty[-24, ]

# -------------------------------------------------------------
# Working with 2018 House Data

locate_areas(here("2018.pdf"), pages = 2)



# Tidying up the df
test2018 <- extract_tables("2018.pdf",
                           guess = FALSE,
                           pages = 2,
                           area = list(c(
                             118.292308, 4.430769, 503.123077, 458.138462
                           )))

# Extracting df from the list
df2018 <- data.frame(test2018[[1]])

df2018 %>%
  view()

colnames(df2018)

# Renaming columns
wy2018CleanCounty <- df2018 %>%
  rename(
    County = "X1",
    Republican.2018 = "X2",
    Democrat.2018 = "X3",
    Libertarian.2018 = "X4",
    Constitution.2018 = "X5",
    Write.Ins.2018 = "X6"
  )

# Removing comas
wy2018CleanCounty$Republican.2018 <-
  as.numeric(gsub(",", "", wy2018CleanCounty$Republican.2018))
wy2018CleanCounty$Democrat.2018 <-
  as.numeric(gsub(",", "", wy2018CleanCounty$Democrat.2018))
wy2018CleanCounty$Libertarian.2018 <-
  as.numeric(gsub(",", "", wy2018CleanCounty$Libertarian.2018))
wy2018CleanCounty$Write.Ins.2018 <-
  as.numeric(gsub(",", "", wy2018CleanCounty$Write.Ins.2018))
wy2018CleanCounty$Constitution.2018 <-
  as.numeric(gsub(",", "", wy2018CleanCounty$Constitution.2018))



# Dropping row 23
wy2018CleanCounty <- wy2018CleanCounty[-23, ]

# Adding in missing set of data
wy2018CleanCounty <- wy2018CleanCounty %>%
  add_row(
    County = "Albany",
    Republican.2018 = 5868,
    Democrat.2018 = 7509,
    Libertarian.2018 = 600,
    Constitution.2018 = 295,
    Write.Ins.2018 = 49
  )

# Rearranging county column
wy2018CleanCounty <- wy2018CleanCounty %>%
  arrange(County)



write.csv(wy2018CleanCounty, "wy2018CleanCounty.csv")

# Binding all the datasets to a single df

wyHouseOfRep <-
  cbind(wy2008CleanCounty,
        wy2010CleanCounty,
        wy2016CleanCounty,
        wy2018CleanCounty) %>%
  .[, -c(7, 12, 18)]

wyHouseOfRep[, c(6, 1:5, 7:20)] %>%
  view()

git config --global user.email "you@example.com"
git config --global user.name "Your Name"

