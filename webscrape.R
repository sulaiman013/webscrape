#WEBSITE: https://www.nationalcoreindicators.org/charts/2017-18/





library(tidyverse)
library(robotstxt)
library(rvest)
library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "192.168.99.100",
                      port = 4445L, 
                      browser = "chrome")

# Nice function that will move us to webelement
scrollTo <- function(remDr, w1){
  remDr$executeScript("arguments[0].scrollIntoView(true);", args = list(w1))
  w1$highlightElement()
}

remDr$open()
#remDr$close()

sum_page <- 1



while(sum_page <= 1){
  
  
  
  remDr$navigate("https://www.nationalcoreindicators.org/charts/2017-18/")
  w1 <- remDr$findElement("css", ".field-accordian-title")
  scrollTo(remDr, w1)
  
  remDr$mouseMoveToLocation(webElement = w1)
  w1$click()
  
  w2 <- remDr$findElement("css", ".option-checkmark:nth-child(13) .input-label")
  scrollTo(remDr, w2)
  
  remDr$mouseMoveToLocation(webElement = w2)
  w2$click()
  
  w3 <- remDr$findElement("css", ".selecter-expand-item:nth-child(1) .selecter-expand-label")
  scrollTo(remDr, w3)
  
  remDr$mouseMoveToLocation(webElement = w3)
  
  w3$click()
  
  
  w4 <- remDr$findElement("css", "#filter_107_1+ .selecter-label")
  scrollTo(remDr, w4)
  
  remDr$mouseMoveToLocation(webElement = w4)
  w4$click()
  
  w5 <- remDr$findElement("css", ".selecter-expand-item:nth-child(2) .selecter-expand-label")
  scrollTo(remDr, w5)
  
  remDr$mouseMoveToLocation(webElement = w5)
  w5$click()
  
  
  w6 <- remDr$findElement("xpath", '//*[@id="fields-filter"]/div/div[2]/div/span[1]/label')
  scrollTo(remDr, w6)
  
  remDr$mouseMoveToLocation(webElement = w6)
  w6$click()
  
  
  
  
  
  w7 <- remDr$findElement("css", "#generatechart-button")
  scrollTo(remDr, w7)
  
  remDr$mouseMoveToLocation(webElement = w7)
  w7$click()
  
  Sys.sleep(8)
  
  w8 <- remDr$findElement("xpath", '//*[@id="tab-unfiltered-data"]')
  scrollTo(remDr, w8)
  
  remDr$mouseMoveToLocation(webElement = w8)
  w8$click()
  
  
  
  
  
  pg <- remDr$getPageSource() %>% .[[1]] %>% 
    read_html()
  
  
  
  t1 <- pg %>% html_node("strong:nth-child(3)") %>%
    html_text()
  
  t2 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[2]') %>%
    html_text()
  
  t3 <- pg %>% html_node("strong~ strong") %>%
    html_text()
  
  t4 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[3]') %>%
    html_text()
  
  filter_1 <- paste0(t1,t2)
  filter_2 <- paste0(t3,t4)
  
  table1 <- pg %>% 
    html_table(fill = T) %>% .[[2]]
  
  
  
  table1$filter_1 <- filter_1 
  table1$filter_2 <- filter_2 
  
  
  table1[table1 == "n/a"] <- NA
  
  table1 <- na.exclude(table1) 
  
  table2 <- table1
  
  
  
  
  
  
  remDr$navigate("https://www.nationalcoreindicators.org/charts/2017-18/")
  w1 <- remDr$findElement("css", ".field-accordian-title")
  scrollTo(remDr, w1)
  
  remDr$mouseMoveToLocation(webElement = w1)
  w1$click()
  
  w2 <- remDr$findElement("css", ".option-checkmark:nth-child(13) .input-label")
  scrollTo(remDr, w2)
  
  remDr$mouseMoveToLocation(webElement = w2)
  w2$click()
  
  w3 <- remDr$findElement("css", ".selecter-expand-item:nth-child(1) .selecter-expand-label")
  scrollTo(remDr, w3)
  
  remDr$mouseMoveToLocation(webElement = w3)
  
  w3$click()
  
  
  w4 <- remDr$findElement("css", "#filter_107_1+ .selecter-label")
  scrollTo(remDr, w4)
  
  remDr$mouseMoveToLocation(webElement = w4)
  w4$click()
  
  w5 <- remDr$findElement("css", ".selecter-expand-item:nth-child(2) .selecter-expand-label")
  scrollTo(remDr, w5)
  
  remDr$mouseMoveToLocation(webElement = w5)
  w5$click()
  
  
  w6 <- remDr$findElement("xpath", '//*[@id="fields-filter"]/div/div[2]/div/span[2]/label')
  scrollTo(remDr, w6)
  
  remDr$mouseMoveToLocation(webElement = w6)
  w6$click()
  
  
  
  
  
  w7 <- remDr$findElement("css", "#generatechart-button")
  scrollTo(remDr, w7)
  
  remDr$mouseMoveToLocation(webElement = w7)
  w7$click()
  
  Sys.sleep(8)
  
  w8 <- remDr$findElement("xpath", '//*[@id="tab-unfiltered-data"]')
  scrollTo(remDr, w8)
  
  remDr$mouseMoveToLocation(webElement = w8)
  w8$click()
  
  
  
  
  
  pg <- remDr$getPageSource() %>% .[[1]] %>% 
    read_html()
  
  
  
  t1 <- pg %>% html_node("strong:nth-child(3)") %>%
    html_text()
  
  t2 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[2]') %>%
    html_text()
  
  t3 <- pg %>% html_node("strong~ strong") %>%
    html_text()
  
  t4 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[3]') %>%
    html_text()
  
  filter_1 <- paste0(t1,t2)
  filter_2 <- paste0(t3,t4)
  
  table1 <- pg %>% 
    html_table(fill = T) %>% .[[2]]
  
  
  
  table1$filter_1 <- filter_1 
  table1$filter_2 <- filter_2 
  
  
  table1[table1 == "n/a"] <- NA
  
  table1 <- na.exclude(table1) 
  
  table2 <-rbind(table2,table1)
  
  
  
  
  
  
  remDr$navigate("https://www.nationalcoreindicators.org/charts/2017-18/")
  w1 <- remDr$findElement("css", ".field-accordian-title")
  scrollTo(remDr, w1)
  
  remDr$mouseMoveToLocation(webElement = w1)
  w1$click()
  
  w2 <- remDr$findElement("css", ".option-checkmark:nth-child(13) .input-label")
  scrollTo(remDr, w2)
  
  remDr$mouseMoveToLocation(webElement = w2)
  w2$click()
  
  w3 <- remDr$findElement("css", ".selecter-expand-item:nth-child(1) .selecter-expand-label")
  scrollTo(remDr, w3)
  
  remDr$mouseMoveToLocation(webElement = w3)
  
  w3$click()
  
  
  w4 <- remDr$findElement("css", "#filter_107_1+ .selecter-label")
  scrollTo(remDr, w4)
  
  remDr$mouseMoveToLocation(webElement = w4)
  w4$click()
  
  w5 <- remDr$findElement("css", ".selecter-expand-item:nth-child(2) .selecter-expand-label")
  scrollTo(remDr, w5)
  
  remDr$mouseMoveToLocation(webElement = w5)
  w5$click()
  
  
  w6 <- remDr$findElement("xpath", '//*[@id="fields-filter"]/div/div[2]/div/span[3]/label')
  scrollTo(remDr, w6)
  
  remDr$mouseMoveToLocation(webElement = w6)
  w6$click()
  
  
  
  
  
  w7 <- remDr$findElement("css", "#generatechart-button")
  scrollTo(remDr, w7)
  
  remDr$mouseMoveToLocation(webElement = w7)
  w7$click()
  
  Sys.sleep(8)
  
  w8 <- remDr$findElement("xpath", '//*[@id="tab-unfiltered-data"]')
  scrollTo(remDr, w8)
  
  remDr$mouseMoveToLocation(webElement = w8)
  w8$click()
  
  
  
  
  
  pg <- remDr$getPageSource() %>% .[[1]] %>% 
    read_html()
  
  
  
  t1 <- pg %>% html_node("strong:nth-child(3)") %>%
    html_text()
  
  t2 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[2]') %>%
    html_text()
  
  t3 <- pg %>% html_node("strong~ strong") %>%
    html_text()
  
  t4 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[3]') %>%
    html_text()
  
  filter_1 <- paste0(t1,t2)
  filter_2 <- paste0(t3,t4)
  
  table1 <- pg %>% 
    html_table(fill = T) %>% .[[2]]
  
  
  
  table1$filter_1 <- filter_1 
  table1$filter_2 <- filter_2 
  
  
  table1[table1 == "n/a"] <- NA
  
  table1 <- na.exclude(table1) 
  
  table2 <-rbind(table2,table1)
  
  
  
  
  
  remDr$navigate("https://www.nationalcoreindicators.org/charts/2017-18/")
  w1 <- remDr$findElement("css", ".field-accordian-title")
  scrollTo(remDr, w1)
  
  remDr$mouseMoveToLocation(webElement = w1)
  w1$click()
  
  w2 <- remDr$findElement("css", ".option-checkmark:nth-child(13) .input-label")
  scrollTo(remDr, w2)
  
  remDr$mouseMoveToLocation(webElement = w2)
  w2$click()
  
  w3 <- remDr$findElement("css", ".selecter-expand-item:nth-child(1) .selecter-expand-label")
  scrollTo(remDr, w3)
  
  remDr$mouseMoveToLocation(webElement = w3)
  
  w3$click()
  
  
  w4 <- remDr$findElement("css", "#filter_107_1+ .selecter-label")
  scrollTo(remDr, w4)
  
  remDr$mouseMoveToLocation(webElement = w4)
  w4$click()
  
  w5 <- remDr$findElement("css", ".selecter-expand-item:nth-child(2) .selecter-expand-label")
  scrollTo(remDr, w5)
  
  remDr$mouseMoveToLocation(webElement = w5)
  w5$click()
  
  
  w6 <- remDr$findElement("xpath", '//*[@id="fields-filter"]/div/div[2]/div/span[4]/label')
  scrollTo(remDr, w6)
  
  remDr$mouseMoveToLocation(webElement = w6)
  w6$click()
  
  
  
  
  
  w7 <- remDr$findElement("css", "#generatechart-button")
  scrollTo(remDr, w7)
  
  remDr$mouseMoveToLocation(webElement = w7)
  w7$click()
  
  Sys.sleep(8)
  
  w8 <- remDr$findElement("xpath", '//*[@id="tab-unfiltered-data"]')
  scrollTo(remDr, w8)
  
  remDr$mouseMoveToLocation(webElement = w8)
  w8$click()
  
  
  
  
  
  pg <- remDr$getPageSource() %>% .[[1]] %>% 
    read_html()
  
  
  
  t1 <- pg %>% html_node("strong:nth-child(3)") %>%
    html_text()
  
  t2 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[2]') %>%
    html_text()
  
  t3 <- pg %>% html_node("strong~ strong") %>%
    html_text()
  
  t4 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[3]') %>%
    html_text()
  
  filter_1 <- paste0(t1,t2)
  filter_2 <- paste0(t3,t4)
  
  table1 <- pg %>% 
    html_table(fill = T) %>% .[[2]]
  
  
  
  table1$filter_1 <- filter_1 
  table1$filter_2 <- filter_2 
  
  
  table1[table1 == "n/a"] <- NA
  
  table1 <- na.exclude(table1) 
  
  table2 <-rbind(table2,table1)
  
  
  
  
  
  
  
  
  remDr$navigate("https://www.nationalcoreindicators.org/charts/2017-18/")
  w1 <- remDr$findElement("css", ".field-accordian-title")
  scrollTo(remDr, w1)
  
  remDr$mouseMoveToLocation(webElement = w1)
  w1$click()
  
  w2 <- remDr$findElement("css", ".option-checkmark:nth-child(13) .input-label")
  scrollTo(remDr, w2)
  
  remDr$mouseMoveToLocation(webElement = w2)
  w2$click()
  
  w3 <- remDr$findElement("css", ".selecter-expand-item:nth-child(1) .selecter-expand-label")
  scrollTo(remDr, w3)
  
  remDr$mouseMoveToLocation(webElement = w3)
  
  w3$click()
  
  
  w4 <- remDr$findElement("css", "#filter_107_1+ .selecter-label")
  scrollTo(remDr, w4)
  
  remDr$mouseMoveToLocation(webElement = w4)
  w4$click()
  
  w5 <- remDr$findElement("css", ".selecter-expand-item:nth-child(2) .selecter-expand-label")
  scrollTo(remDr, w5)
  
  remDr$mouseMoveToLocation(webElement = w5)
  w5$click()
  
  
  w6 <- remDr$findElement("xpath", '//*[@id="fields-filter"]/div/div[2]/div/span[5]/label')
  scrollTo(remDr, w6)
  
  remDr$mouseMoveToLocation(webElement = w6)
  w6$click()
  
  
  
  
  
  w7 <- remDr$findElement("css", "#generatechart-button")
  scrollTo(remDr, w7)
  
  remDr$mouseMoveToLocation(webElement = w7)
  w7$click()
  
  Sys.sleep(8)
  
  w8 <- remDr$findElement("xpath", '//*[@id="tab-unfiltered-data"]')
  scrollTo(remDr, w8)
  
  remDr$mouseMoveToLocation(webElement = w8)
  w8$click()
  
  
  
  
  
  pg <- remDr$getPageSource() %>% .[[1]] %>% 
    read_html()
  
  
  
  t1 <- pg %>% html_node("strong:nth-child(3)") %>%
    html_text()
  
  t2 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[2]') %>%
    html_text()
  
  t3 <- pg %>% html_node("strong~ strong") %>%
    html_text()
  
  t4 <- pg %>% html_nodes(xpath = '//*[@id="unfiltered-data"]/div/div/div[1]/text()[3]') %>%
    html_text()
  
  filter_1 <- paste0(t1,t2)
  filter_2 <- paste0(t3,t4)
  
  table1 <- pg %>% 
    html_table(fill = T) %>% .[[2]]
  
  
  
  table1$filter_1 <- filter_1 
  table1$filter_2 <- filter_2 
  
  
  table1[table1 == "n/a"] <- NA
  
  table1 <- na.exclude(table1) 
  
  table2 <-rbind(table2,table1)
  
  
  
  
  
  
  
  sum_page <- sum_page +1
  
}


