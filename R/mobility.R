
#' Get Google's mobility data
#'
#' @return A data frame
#' @export
#'
get_google_mobility_data <- function(){
  url <- 'https://raw.githubusercontent.com/ActiveConclusion/COVID19_mobility/master/google_reports/mobility_report_europe.csv'
  google_mobility <- readr::read_csv(url)
  google_mobility %>%
    dplyr::filter(country == 'Netherlands')
}


#' Get Apple's mobility data
#'
#' @return A data frame
#' @export
#'
get_apple_mobility_data <- function(){

  url <- 'https://raw.githubusercontent.com/ActiveConclusion/COVID19_mobility/master/apple_reports/apple_mobility_report.csv'
  apple_mobility <- readr::read_csv(url)
  apple_mobility %>%
    dplyr::filter(country =='Netherlands')
}


#' Get waze mobility city level data
#'
#' @return A data frame
#' @export
#'
get_waze_mobility_city_level_data <- function(){

  url <- 'https://raw.githubusercontent.com/ActiveConclusion/COVID19_mobility/master/waze_reports/Waze_City-Level_Data.csv'
  waze_mobility <- readr::read_csv(url)
  waze_mobility %>%
    dplyr::filter(Country  =='Netherlands')

}


#' Get waze mobility country level data
#'
#' @return A data frame
#' @export
#'
get_waze_mobility_country_level_data <- function(){

  url <- 'https://raw.githubusercontent.com/ActiveConclusion/COVID19_mobility/master/waze_reports/Waze_Country-Level_Data.csv'
  waze_mobility <- readr::read_csv(url)
  waze_mobility %>%
    dplyr::filter(Country  =='Netherlands')
}



