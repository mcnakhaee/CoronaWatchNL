
#' Get Covid-19 cases data broken down by municipality
#'
#' @param lang Specify the language of the resulting dataframe (`nl` for Dutch `en` for English)
#'
#' @return A tibble with 6 variables
#' \describe{
#'   \item{Date_of_report/Datum}{}
#'   \item{Municipality_code/Gemeentecode}{}
#'   \item{Municipality_name/Gemeentenaam}{}
#'   \item{Province/Provincienaam}{}
#'   \item{Total_reported/totaalAantal}{}
#'   \item{Hospital_admission/ziekenhuisopnameAantal}{}
#'   \item{Deceased/overledenAantal}{}
#' }
#' @export
#'
#' @examples
#' get_cumilative_cases_per_municpality() %>%
#' head()
get_cumilative_cases_per_municpality <- function(lang = 'en'){
  url <- 'https://data.rivm.nl/covid-19/COVID-19_aantallen_gemeente_cumulatief.json'
  aantallen_gemeente_cumulatief <- jsonlite::fromJSON(url)
  aantallen_gemeente_cumulatief <- tibble::as_tibble(aantallen_gemeente_cumulatief)
  if (lang =='en') {
    aantallen_gemeente_cumulatief
  } else if (lang == 'nl') {
    aantallen_gemeente_cumulatief %>%
      dplyr::rename(Datum = Date_of_report,
                    Gemeentecode = Municipality_code,
                    Gemeentenaam = Municipality_name,
                    Provincienaam = Province,
                    totaalAantal = Total_reported,
                    ziekenhuisopnameAantal = Hospital_admission,
                    overledenAantal = Deceased)
  }



}



#' Get daily number of cases per municipality (regions)
#'
#' @return
#' @export
#'
#' @examples
#' get_daily_cases_per_municpality() %>%
#' head()
get_daily_cases_per_municpality <- function(){
  url <- 'https://data.rivm.nl/covid-19/COVID-19_aantallen_gemeente_per_dag.json'
  daily_cases_per_municpality  <- jsonlite::fromJSON(url)
  daily_cases_per_municpality  <- tibble::as_tibble(daily_cases_per_municpality )
  # if (lang =='en') {
  #   aantallen_gemeente_cumulatief
  # } else if (lang == 'nl') {
  #   aantallen_gemeente_cumulatief %>%
  #     rename(Datum = Date_of_report,
  #            Gemeentecode = Municipality_code,
  #            Gemeentenaam = Municipality_name,
  #            Provincienaam = Province,
  #            totaalAantal = Total_reported,
  #            ziekenhuisopnameAantal = Hospital_admission,
  #            overledenAantal = Deceased)
  # }



}



#' Get the reported count of cases in the Netherlands by date
#'
#'
#' @return
#' @export
#'
#' @examples
#' get_national_cases() %>%
#' dim()
get_national_cases <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-geo/data-national/RIVM_NL_national.csv'
  data_geo_national <- readr::read_csv(url)
  data_geo_national


}



#' Get the reported count of cases in each province in Netherlands by date
#'
#'
#' @return
#' @export
#'
#' @examples
#' get_provincial_cases() %>%
#' dim()
get_provincial_cases <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-geo/data-provincial/RIVM_NL_provincial.csv'
  data_geo_provincial <- readr::read_csv(pins::pin(url))
  data_geo_provincial


}


#' Get the reported count of cases in each municipality (county-region) in Netherlands by date
#'
#'
#' @return
#' @export
#'
#' @examples
#' get_municipal_municipal() %>%
#' dim()
get_municipal_municipal <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-geo/data-municipal/RIVM_NL_municipal.csv'
  data_geo_municipal <- readr::read_csv(pins::pin(url))
  data_geo_municipal


}
