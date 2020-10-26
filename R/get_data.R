


#' Get a detailed dataset of  all reported case  in the Netherlands
#'
#'
#' @return
#' @export
#'
get_all_national_cases <- function(){

  url <- 'https://data.rivm.nl/covid-19/COVID-19_casus_landelijk.json'
  landelijk <- jsonlite::fromJSON(url)
  tibble::as_tibble(landelijk)
  landelijk


}



