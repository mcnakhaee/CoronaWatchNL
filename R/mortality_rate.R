#' Get mortality data from CBS
#'
#' @param lang Specify the language of the resulting dataframe (`nl` for Dutch `en` for English)
#'
#' @return A tibble with 4 variables
#' \describe{
#'   \item{Sex/Geslacht}{}
#'   \item{Age_group/Gemeentecode}{Age of the decesded person on 31 December}
#'   \item{Periods/Perioden}{}
#'   \item{Periods/Overledenen_aantal}{}
#' }
#' @export
#' @source cbs.nl
#' @examples
#' get_mortality_rate() %>%
#' dim()
get_mortality_rate <- function(lang = 'en'){
  if (lang =='en'){
    url <- 'https://opendata.cbs.nl/CsvDownload/csv/70895ENG/TypedDataSet?dl=43B70'
    nl_mortality_rate <- readr::read_delim(url,delim = ';')
    nl_mortality_rate <- nl_mortality_rate %>%
      dplyr::rename(Age_group = `Age, 31 December`,
             Death_count = `Deaths (aantal)` )
  }else if (lang =='nl') {
    url <- 'https://opendata.cbs.nl/CsvDownload/csv/70895ned/UntypedDataSet?dl=43B72'
    nl_mortality_rate <- readr::read_delim(url,delim = ';') %>%
      dplyr::rename(Leeftijd = `Leeftijd (op 31 december)` ,
             Overledenen_aantal = `Overledenen (aantal)`  )

  }
  nl_mortality_rate


}



# library(cbsodataR)
# #"Language" = "nl"
# ds <- cbs_get_datasets("Language" = "nl")
# ds %>% View()
# cbs_get_data('37979eng')
# cbs_get_data('70895ENG')
