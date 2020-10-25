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
#' get_raw_cumilative_per_municpality() %>%
#' head()
get_raw_cumilative_per_municpality <- function(lang = 'en'){
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
#' @return
#' @export
#'
#' @examples
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




#' Title
#'
#' @param lang Specify the language of the resulting dataframe (`nl` for Dutch `en` for English)
#'
#' @return
#' @export
#'
#' @examples
get_raw_national_cases <- function(lang = 'nl'){

  url <- 'https://github.com/J535D165/CoronaWatchNL/blob/master/data-geo/data-national/RIVM_NL_national.csv'
  landelijk <- readr::read_csv(pins::pin(url))
  tibble::as_tibble(landelijk)
  landelijk


}


#' Title
#'
#' @param lang Specify the language of the resulting dataframe (`nl` for Dutch `en` for English)
#'
#' @return
#' @export
#'
#' @examples
get_raw_national_cases <- function(lang = 'nl'){

  url <- 'https://github.com/J535D165/CoronaWatchNL/blob/master/data-geo/data-national/RIVM_NL_national.csv'
  landelijk <- readr::read_csv(pins::pin(url))
  tibble::as_tibble(landelijk)
  landelijk


}


#' Get Covid-19 cases data broken down by َAge
#'
#' @param lang Specify the language of the resulting dataframe (`nl` for Dutch `en` for English)
#'
#' @return
#' \describe{
#'   \item{Datum/Date}{Date of notification}
#'   \item{Bron/Source}{The id of the report}
#'   \item{LeeftijdGroep/Age_group}{Sex: Man, Vrouw, Niet vermeld ( Ages, ranging from 0 to 95, divided in 19 groups of 5. Two additional groups are 95+ and Niet vermeld (not specified))}
#'   \item{Type}{Type of measurement: Totaal, Ziekenhuisopname, Overleden ( total, hospitilzed, deceased, respectively)}
#'   \item{Aantal/Count}{Number of newly diagnosed (Totaal), hospitalized (Ziekenhuisopname), and deceased (Overleden**) female (vrouw), male (man), and non-specified cases on the date of notification in the last 24 hours}
#'   \item{AantalCumulatief/Total_count}{ Number of diagnosed (Totaal), hospitalized (Ziekenhuisopname), and deceased (Overleden) female (vrouw), male (man), and non-specified cases on the date of notification since the start of the outbreak}
#' }
#' @export
#'
#' @examples
get_nl_age <- function(lang = 'nl'){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-desc/data-age/RIVM_NL_age.csv'
  nl_age <- readr::read_csv(pins::pin(url))
  if (lang == 'nl') {
    nl_age
  } else if (lang == 'en') {
    nl_age %>%
      dplyr::rename(Date = Datum,
             Source = Bron,
             Age_group = LeeftijdGroep,
             Count = Aantal,
             Total_count = AantalCumulatief) %>%
      dplyr::mutate(Age_group = case_when( Age_group == 'Niet vermeld' ~ 'Not specified',
                             TRUE ~ Age_group),

             Type = case_when(Type == 'Totaal' ~ 'Total',
                              Type == 'Ziekenhuisopname' ~ 'Hospitalized',
                              Type == 'Overleden' ~ 'Deceased'))
  }





}




#' Get Covid-19 cases data broken down by Sex
#'
#' @param lang Specify the language of the resulting dataframe (`nl` for Dutch `en` for English)
#'
#' @return
#' \describe{
#'   \item{Datum/Date}{Date of notification}
#'   \item{Bron/Source}{The id of the report}
#'   \item{Geslacht/Sex}{Sex: Man, Vrouw, Niet vermeld ( man, woman, not specified, respectively)}
#'   \item{Type}{Type of measurement: Totaal, Ziekenhuisopname, Overleden ( total, hospitilzed, deceased, respectively)}
#'   \item{Aantal/Count}{Number of newly diagnosed (Totaal), hospitalized (Ziekenhuisopname), and deceased (Overleden**) female (vrouw), male (man), and non-specified cases on the date of notification in the last 24 hours}
#'   \item{AantalCumulatief/Total_count}{ Number of diagnosed (Totaal), hospitalized (Ziekenhuisopname), and deceased (Overleden) female (vrouw), male (man), and non-specified cases on the date of notification since the start of the outbreak}
#' }
#' @export
#' @source https://github.com/J535D165/CoronaWatchNL/tree/master/data-desc
#' @examples
get_nl_sex <- function(lang = 'nl') {
  url <-
    'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-desc/data-sex/RIVM_NL_sex.csv'
  nl_sex <- readr::read_csv(pins::pin(url))
  if (lang == 'nl') {
    nl_sex
  } else if (lang == 'en') {
    nl_sex %>%
      dplyr::rename(
        Date = Datum,
        Source = Bron,
        Sex = Geslacht,
        Count = Aantal,
        Total_count = AantalCumulatief
      ) %>%
      dplyr::mutate(
        Sex = case_when(
          Sex == 'Vrouw' ~ 'Woman',
          Sex == 'Niet vermeld' ~ 'Not specified',
          TRUE ~ "Man"
        ),


        Type = case_when(
          Type == 'Totaal' ~ 'Total',
          Type == 'Ziekenhuisopname' ~ 'Hospitalized',
          Type == 'Overleden' ~ 'Deceased'
        )
      )
  }





}

#'  Get Covid-19 deceased patients data broken down by Sex and Age
#'
#' @param lang Specify the language of the resulting dataframe (`nl` for Dutch `en` for English)
#'
#' @return
#' \describe{
#'   \item{Datum/Date}{Date of notification}
#'   \item{LeeftijdGroep/Age_group}{Sex: Man, Vrouw, Niet vermeld ( Ages, ranging from 0 to 95, divided in 19 groups of 5. Two additional groups are 95+ and Niet vermeld (not specified))}
#'   \item{Geslacht/Sex}{Sex: Man, Vrouw, Niet vermeld ( man, woman, not specified, respectively)}
#'   \item{Aantal/Count}{Number of newly diagnosed (Totaal), hospitalized (Ziekenhuisopname), and deceased (Overleden**) female (vrouw), male (man), and non-specified cases on the date of notification in the last 24 hours}
#'   \item{AantalCumulatief/Total_count}{ Number of diagnosed (Totaal), hospitalized (Ziekenhuisopname), and deceased (Overleden) female (vrouw), male (man), and non-specified cases on the date of notification since the start of the outbreak}
#' }
#' @export
#' @source https://github.com/J535D165/CoronaWatchNL/tree/master/data-desc
#' @examples
get_nl_sex_age_deceased <- function(lang = 'nl') {
  url <-
    'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-desc/data-deceased/RIVM_NL_deceased_age_sex.csv'
  nl_sex_age_deceased <- readr::read_csv(pins::pin(url))
  if (lang == 'nl') {
    nl_sex_age_deceased
  } else if (lang == 'en') {
    nl_sex_age_deceased %>%
      dplyr::rename(
        Date = Datum,
        Age_group = LeeftijdGroep,
        Sex = Geslacht,
        Count = Aantal,
        Total_count = AantalCumulatief
      ) %>%
      dplyr::mutate(
        Age_group = case_when(Age_group == 'Niet vermeld' ~ 'Not specified',
                              TRUE ~ Age_group),
        Sex = case_when(
          Sex == 'Vrouw' ~ 'Woman',
          Sex == 'Niet vermeld' ~ 'Not specified',
          TRUE ~ "Man"
        )
      )
  }







}



#' Get population data of regions in the Netherlands
#'
#' @return
#' @export
#'
#' @examples
get_populatuon_per_region <- function(){
     url <- 'https://opendata.cbs.nl/CsvDownload/csv/03759ned/UntypedDataSet?dl=3A09C'
     populatuon_per_region <- readr::read_delim(url,delim = ';')
     populatuon_per_region <- populatuon_per_region %>%
       dplyr::filter(Perioden  == 2020,`Burgerlijke staat` == 'Totaal burgerlijke staat') %>%
       dplyr::rename(Regions = `Regio's`)

}
