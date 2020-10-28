


#' Get a detailed dataset of  all reported case  in the Netherlands
#'
#'
#' @return Returns a dataframe of results containing detalied Covid-19 cases in the Netherlands
#' @export
#' @example
#' \dontrun{get_all_national_cases()}
get_all_national_cases <- function(){

  url <- 'https://data.rivm.nl/covid-19/COVID-19_casus_landelijk.json'
  landelijk <- jsonlite::fromJSON(url)
  tibble::as_tibble(landelijk)
  landelijk


}



