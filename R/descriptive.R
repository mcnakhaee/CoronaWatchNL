#' Get Covid-19 cases data broken down by َthe age group of patients
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
#' @source for further information look at \url{https://github.com/J535D165/CoronaWatchNL/master/data-geo/data-national/}
#' @examples
#' get_cases_by_age() %>%
#' dplyr::distinct(LeeftijdGroep)
get_cases_by_age <- function(lang = 'nl'){

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
      dplyr::mutate(Age_group = dplyr::case_when( Age_group == 'Niet vermeld' ~ 'Not specified',
                                           TRUE ~ Age_group),

                    Type = dplyr::case_when(Type == 'Totaal' ~ 'Total',
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
#' get_cases_by_sex(lang = 'en') %>%
#' dplyr::group_by(Sex) %>%
#' dplyr::summarize(l = dplyr::last(Total_count))
get_cases_by_sex <- function(lang = 'nl') {
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
        Sex = dplyr::case_when(
          Sex == 'Vrouw' ~ 'Woman',
          Sex == 'Niet vermeld' ~ 'Not specified',
          TRUE ~ "Man"
        ),


        Type = dplyr::case_when(
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
#' @return A dataframe
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
#' get_deceased_cases_by_sex_age(lang = 'en') %>%
#' dplyr::group_by(Age_group,Sex) %>%
#' dplyr::summarize(l = dplyr::last(Total_count))
#'
get_deceased_cases_by_sex_age <- function(lang = 'nl') {
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
        Age_group = dplyr::case_when(Age_group == 'Niet vermeld' ~ 'Not specified',
                              TRUE ~ Age_group),
        Sex = dplyr::case_when(
          Sex == 'Vrouw' ~ 'Woman',
          Sex == 'Niet vermeld' ~ 'Not specified',
          TRUE ~ "Man"
        )
      )
  }







}




