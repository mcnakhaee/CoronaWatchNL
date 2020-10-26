
#' Get ICU patients data published by NICE (Nationale Intesive Care Evaluatie) in a wide format
#'
#' The intensive care datasets describe the new and cumulative number of COVID-19 intensive care unit (ICU) admissions per day.
#'
#' * These can be situated in either the Netherlands or in Germany.
#' ** Deaths outside hospitals are not included in these numbers.
#' *** These people are discharged from the IC but are still hospitalized. Eventually, these cases will be either added to the hospital discharges or IC deaths counts.
#'
#'
#' @return A dataframe with the 7 following columns:
#' \describe{
#'   \item{Datum/Date}{Date of notification}
#'   \item{IngezetteICs/Used IC units}{Number of intensive care (IC) units* with at least one Dutch COVID-19 case on the date of notification}
#'   \item{TotaalOpnamen/Total IC intakes}{Total number of IC intakes on the date of notificationn}
#'   \item{ToenameOpnamen/New IC intakes}{New number of IC-cases that left the hospital alive on the date of notification}
#'   \item{CumulatiefOpnamen/Cumulative IC intakes}{Total number of IC-cases that left the hospital alive since the start of the outbreak until the date of notification}
#'   \item{CumulatiefOntslagOverleden/Cumulative IC deaths}{Total number of IC-cases that died in hospital during/after IC intake since the start of the outbreak until the date of notification}
#'   \item{TotaalOntslagIC/Total IC discharges}{Total number of discharged IC-cases that are still in hospital*** on the date of notification}
#' }
#' @export
#'
#' @examples
#' get_icu_data_wide() %>%
#' head()
get_icu_data_wide <- function() {
  url <-
    'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-ic/data-nice/NICE_IC_wide_latest.csv'
  icu_data <- readr::read_csv(pins::pin(url))

  icu_data

}

#' Get ICU patients data publshed by by NICE (Nationale Intesive Care Evaluatie) in a long format
#'
#' * These can be situated in either the Netherlands or in Germany.
#' ** Deaths outside hospitals are not included in these numbers.
#' *** These people are discharged from the IC but are still hospitalized. Eventually, these cases will be either added to the hospital discharges or IC deaths counts.
#'
#' @return A dataframe with the 3 following columns:
#' \describe{
#'   \item{Datum/Date}{Date of notification}
#'   \item{Type/Type}{Type of measurement: i.e., Totaal ingezette IC's, Toename opnamen (IC), Totaal opnamen (IC), Cumulatief opnamen (IC), Toename ontslag (ziekenhuis), Cumulatief ontslag (ziekenhuis), Toename ontslag (overleden), Cumulatief ontslag (overleden), Totaal ontslag (IC).}
#'   \item{Aantal/Count}{Number of intensive care (IC) units  with at least one Dutch COVID-19 case on the date of notification (Totaal ingezette IC's), number of newly confirmed or suspected COVID-19 IC intakes on the date of notification (Toename opnamen (IC)), total number of IC intakes on the date of notification (Totaal opnamen (IC)), total number of IC intakes since the start of the outbreak until the date of notification (Cumulatief opnamen (IC)), new and total number of IC-cases that left the hospital alive (Toename ontslag (ziekenhuis) and Cumulatief ontslag (ziekenhuis), respectively), new and total number of IC-cases that died in hospital after IC intake (Toename ontslag (overleden) and Cumulatief ontslag (overleden), respectively), and total number of discharged IC-cases that are still in hospital (Totaal ontslag (IC))}
#' }
#' @export
#'
#' @examples
#' get_icu_data_long() %>%
#' head()
get_icu_data_long <- function() {
  url <-
    'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-ic/data-nice/NICE_IC_long_latest.csv'
  icu_data <- readr::read_csv(pins::pin(url))


  icu_data

}




#' Get ICU patients data published by LCPS (Landelijk Coördinatiecentrum Patiënten Spreiding)
#'
#'
#' These numbers are based on NICE data. However, to compensate for the reporting lag, LCPS tries to estimate the size of this lag and adds it to the numbers reported by NICE. LCPS data is, therefore, consistently higher than the 'totaalOpnamen' reported by NICE.
#' @return A dataframe with the 3 following columns:
#' \describe{
#'   \item{Datum/Date}{Date of notification}
#'   \item{Land/Country}{Dutch COVID-19 cases were taken into the IC in either Germany (Duitsland) or the Netherlands (Nederland)}
#'   \item{Aantal/Count}{Total number of IC intakes* in Germany, the Netherlands, and in total (sum of both countries) on the date of notification)}
#' }
#' @export
#'
#'
#' @examples
#' get_lcps_data() %>%
#' head()
get_lcps_data <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-ic/data-lcps/LCPS_IC_latest.csv'
  lcps_data  <- readr::read_csv(pins::pin(url))
  lcps_data
}
