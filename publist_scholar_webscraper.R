library(scholar)
library(tidyverse)

# Google Scholar ID of Prof. Dr. Blake Byron Walker
id = "X-eZF2wAAAAJ"

# Downlaod scholar
publist <- get_publications(id) %>% 
  as_tibble()

# Remove duplicate articles
publist <- publist[!publist$pubid %in% c("hsZV8lGYWTMC", "-mN3Mh-tlDkC"), ]

# Correct bad titles (Scholar has maximum length)
bad_title <- c(
  "Perceived differences in the (re) production of environmental deprivation between sub-populations: A study combining citizens’ perceptions with remote-sensed and administrative",
  "Epidemiological and spatial characteristics of interpersonal physical violence in a Brazilian city: A comparative study of violent injury hotspots in familial versus non",
  "CHANGE DETECTION IN BONE HISTOLOGY USING RASTER-BASED GEOGRAPHICAL INFORMATION SYSTEMS"
)
good_title <- c(
  "Perceived differences in the (re) production of environmental deprivation between sub-populations: A study combining citizens’ perceptions with remote-sensed and administrative data",
  "Epidemiological and spatial characteristics of interpersonal physical violence in a Brazilian city: A comparative study of violent injury hotspots in familial versus non-familial settings, 2012-2014",
  "Change detection in bone histology using raster-based geographical information systems"
)

bad_title_index <- lapply(bad_title, FUN = function(x) {
  x %>% 
    grepl(publist$title, fixed = TRUE) %>% 
    which()
}) %>% unlist()

publist$title[bad_title_index] <- good_title


# Add years
publist$year[publist$pubid %in% c("yxmsSjX2EkcC", "1yWc8FF-_SYC")] <- c(2018, 2015)

# Add missing Journal info
jrn_index <- c("u5HHmVD_uO8C", "yxmsSjX2EkcC", "7H_MAutzIkAC", "1yWc8FF-_SYC", 
               "MhiOAD_qIWkC", "WC9gN4BGCRcC", "d1gkVwhDpl0C") %>% 
  lapply(function(x) {which(x == publist$pubid)}) %>%
  unlist()

publist$journal[jrn_index] <- c("",
                                "",
                                "Gerontology Research Centre, Simon Fraser University",
                                "Department of Geography, Simon Fraser University",
                                "Rural Remote Health",
                                "Glob. Health Action",
                                "")

num_index <- c("u5HHmVD_uO8C", "yxmsSjX2EkcC", "7H_MAutzIkAC", "1yWc8FF-_SYC",
               "MhiOAD_qIWkC", "0EnyYjriUFMC", "WC9gN4BGCRcC", "5nxA0vEk-isC",
               "jU7OWUQzBzMC", "WC23djZS0W4C", "d1gkVwhDpl0C") %>% 
  lapply(function(x) {which(x == publist$pubid)}) %>%
  unlist()

publist$number[num_index] <- c("",
                               "",
                               "",
                               "",
                               "17 (3), 4210",
                               "",
                               "14 (1)",
                               "",
                               "109, 42-52",
                               "",
                               "")

# Rename Journals with correct abbreviations
publist <- publist %>% 
  mutate(journal = case_when(
    journal=="Annals of epidemiology"~"Ann. Epidemiol.",
    journal=="BMC cancer"~"BMC Cancer",
    journal=="Disaster medicine and public health preparedness"~"DMPHP",
    journal=="Environment international"~"Environ. Int.",
    journal=="Environment: Department of Geography"~"Department of Geography, Simon Fraser University",
    journal=="Environmental health perspectives"~"Environ. Health Perspect.",
    journal=="FORENSIC SCIENCE INTERNATIONAL"~"Forensic Sci. Int.",
    journal=="Global health action"~"Glob. Health Action",
    journal=="International journal of environmental research and public health"~"	Int. J. Environ. Res. Public Health",
    journal=="International journal of health geographics"~"Int. J. Health Geogr.",
    journal=="Journal of Aging and Environment"~"J. Aging Health",
    journal=="Journal of Housing For the Elderly"~"J. Hous. Elder.",
    journal=="Natural hazards"~"Nat. Hazards",
    journal=="Natural Hazards"~"Nat. Hazards",
    journal=="Plos one"~"PloS one",
    journal=="The Canadian Geographer/Le Géographe canadien"~"TCG",
    TRUE ~ journal
  )) 

# Sort by year and title
publist <- publist %>% arrange(desc(year), title)


# Use Selenium to webscrpe the URL from crossref
library(RSelenium)

remDr <- rsDriver(remoteServerAddr = "localhost", 
                  port = 4567L,
                  browser = "firefox")

url <- "https://search.crossref.org/"


publist_yml <- c()
for (i in 1:nrow(publist)) {
  # Journal, number
  if ((nchar(publist[i,]$journal)>0) && (nchar(publist[i,]$number)>0)) {
    display <- paste0(publist[i,]$journal, ", ", publist[i,]$number)
  } else if (nchar(publist[i,]$journal)>0) {
    display <- publist[i,]$journal
  } else {
    display <- "\"\""
  }
  
  
  # URL
  if ((nchar(publist[i,]$journal)>0) && (nchar(publist[i,]$number)>0)) {
    remDr$client$navigate(url)
    ElemSearch <- remDr$client$findElement("id", "search-input")
    
    # Search current title
    ElemSearch$sendKeysToElement(list(publist$title[i], key = "enter"))
    while (unlist(remDr$client$getCurrentUrl()) == url) {
      Sys.sleep(0.5)
    }
    Sys.sleep(1)
    
    # Check first 5 elements
    j <- 1
    while (j <= 5) {
      ElemTitle <- remDr$client$findElement(using = "xpath",
                                            paste0("/html/body/div[2]/div[2]/div[2]/table/tbody/tr[", j, "]/td/p[1]"))
      test_title <- ElemTitle$getElementText()[[1]]
      page_title <- publist$title[i]
      
      page_title <- gsub("[^0-9A-Za-z///' ]","" , page_title ,ignore.case = TRUE)
      page_title <- gsub("[[:punct:]]","" , page_title ,ignore.case = TRUE)
      page_title <- gsub("[[:space:]]","" , page_title ,ignore.case = TRUE)
      
      test_title <- gsub("[^0-9A-Za-z///' ]","" , test_title ,ignore.case = TRUE)
      test_title <- gsub("[[:punct:]]","" , test_title ,ignore.case = TRUE)
      test_title <- gsub("[[:space:]]","" , test_title ,ignore.case = TRUE)
      
      if (tolower(page_title) == tolower(test_title)) {
        break
      } else {
        j = j + 1
      }
    }
    
    
    # Set URL
    if (j <= 5) {
      DOI_element <- remDr$client$findElement(using = "xpath", "/html/body/div[2]/div[2]/div[2]/table/tbody/tr[1]/td/div/div")
      DOI_element$clickElement()
      Sys.sleep(1)
      URL <- remDr$client$getCurrentUrl()[[1]]
    } else {
      URL <- "\"\""
      cat(paste(i, "- TITLE FAIL\n"))
    }
    
  } else {
    URL <- "\"\""
  }
  
  # YML formal for publist.yml
  publist_yml <- paste0(publist_yml, 
                        paste0(
                          "- ", "title: ", "\"", publist[i,]$title, "\"", "\n",
                          "  ", "image: ", "\"\"", "\n",
                          "  ", "description: ", "\"\"", "\n",
                          "  ", "year: ", publist[i,]$year, "\n",
                          "  ", "authors: ", publist[i,]$author, "\n",
                          "  ", "link:", "\n",
                          "    ", "url: ", URL, "\n",
                          "    ", "display: ", display,  "\n",
                          "  ", "highlight: ", "0", "\n",
                          "  ", "news2:", "\n", "\n"
                        ))
}

remDr$client$close()

cat(publist_yml)







