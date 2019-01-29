
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/hottopic.svg?branch=master)](https://travis-ci.org/hrbrmstr/hottopic)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/hottopic/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/hottopic)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/hottopic)](https://cran.r-project.org/package=hottopic)

# hottopic

Retrieve Hot Topics (Trends) for a Given Country from ‘Google’ Trends

## Description

Retrieve Hot Topics (Trends) for a Given Country from ‘Google’ Trends

## What’s Inside The Tin

The following functions are implemented:

  - `get_topic`: Retrieve Hot Topics (Trends) for a Given Country
  - `topic_countries`: Return a character vector of supported countries

## Installation

``` r
devtools::install_git("https://gitlab.com/hrbrmstr/hottopic.git")
# or
devtools::install_github("hrbrmstr/hottopic")
```

## Usage

``` r
library(hottopic)
library(tibble) # for printing

# current version
packageVersion("hottopic")
## [1] '0.1.0'
```

### Countries

``` r
topic_countries()
##  [1] "Argentina"      "Australia"      "Austria"        "Belgium"        "Brazil"         "Canada"        
##  [7] "Chile"          "Colombia"       "Czechia"        "Denmark"        "Egypt"          "Finland"       
## [13] "France"         "Germany"        "Greece"         "Hong Kong"      "Hungary"        "India"         
## [19] "Indonesia"      "Ireland"        "Israel"         "Italy"          "Japan"          "Kenya"         
## [25] "Malaysia"       "Mexico"         "Netherlands"    "New Zealand"    "Nigeria"        "Norway"        
## [31] "Philippines"    "Poland"         "Portugal"       "Romania"        "Russia"         "Saudi Arabia"  
## [37] "Singapore"      "South Africa"   "South Korea"    "Spain"          "Sweden"         "Switzerland"   
## [43] "Taiwan"         "Thailand"       "Turkey"         "Ukraine"        "United Kingdom" "United States" 
## [49] "Vietnam"
```

``` r
get_topic()
## # A tibble: 40 x 11
##    title description traffic link  pub_date picture picture_source news_item_title news_item_snipp… news_item_url
##    <chr> <chr>       <chr>   <chr> <chr>    <chr>   <chr>          <chr>           <chr>            <chr>        
##  1 Juss… Empire      500,00… http… Tue, 29… https:… USA TODAY      'Empire' star … "\"Empire\" sta… https://www.…
##  2 Juss… Empire      500,00… http… Tue, 29… https:… USA TODAY      'Empire' star … "\"Empire\" act… https://www.…
##  3 Face… FaceTime, … 200,00… http… Tue, 29… https:… USA TODAY      A 14-year-old … Apple's Group F… https://www.…
##  4 Face… FaceTime, … 200,00… http… Tue, 29… https:… USA TODAY      Apple Takes Dr… But a bug affli… https://www.…
##  5 Bryc… ""          100,00… http… Tue, 29… https:… For The Win    Fans think an … The Major Leagu… https://ftw.…
##  6 Bryc… ""          100,00… http… Tue, 29… https:… For The Win    Report: Bryce … The Bryce Harpe… https://ftw.…
##  7 Jame… ""          100,00… http… Tue, 29… https:… The Root       Grammy-Winning… The music indus… https://theg…
##  8 Jame… ""          100,00… http… Tue, 29… https:… The Root       R&B Star James… James Ingram, o… https://theg…
##  9 Tory… Don Q       50,000+ http… Tue, 29… https:… Complex        "Don Q Goes in… "Late Monday, Q… https://www.…
## 10 Tory… Don Q       50,000+ http… Tue, 29… https:… Complex        JID Accepts To… "After unleashi… https://www.…
## # … with 30 more rows, and 1 more variable: news_item_source <chr>
```

## hottopic Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        8 | 0.89 | 134 | 0.93 |          29 | 0.58 |       38 | 0.51 |
| Rmd  |        1 | 0.11 |  10 | 0.07 |          21 | 0.42 |       37 | 0.49 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
