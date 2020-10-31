
#' Get testing data published by RIVM
#'
#'
#' @return A dataframe with the following 7 columns:
#' \describe{
#'   \item{Jaar/Year}{Year of notification}
#'   \item{Week/Week number*}{Week of notification}
#'   \item{BeginDatum/Start date}{Beginning of the week (Monday) of notification}
#'   \item{EindDatum/	End date}{End of the week (Sunday) of notification}
#'   \item{AantalLaboratoria/Number of laboratories}{Number of Dutch laboratories that have performed diagnostics for SARS-CoV-2 in said week}
#'   \item{Type/Type}{Type of test measurement (i.e., Totaal, Positief)}
#'   \item{Aantal/Count}{Number of people tested for COVID-19 (Totaal), and number of positively tested people for COVID-19 (Positief**) per week}
#'   }
#' @export
#' @source for further information look at \url{https://github.com/J535D165/CoronaWatchNL/tree/master/data-misc/}
#' @examples
#' mean(get_testing_data()$Labs)
get_testing_data <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-misc/data-test/RIVM_NL_test_latest.csv'
  testing_data  <- readr::read_csv(pins::pin(url))
  testing_data
}

#' Get statistics for the underlying condition of deceased COVID-19 patients younger than 70
#'
#'
#' @return A dataframe with the following 3 columns:
#' \describe{
#'   \item{Datum/Date}{Date of notification}
#'   \item{Type/Type}{Type of test measurement (i.e., Totaal gemeld, Onderliggende aandoeningen en/of zwangerschap, Geen onderliggende aandoening, Niet vermeld)}
#'   \item{AantalCumulatief/Cumulative count}{The cumulative number of deceased COVID-19 cases younger than 70 (Totaal gemeld) with (Onderliggende aandoening en/of zwangerschap) or without (Geen onderliggende aandoening) an underlying condition and/or pregnancy, and the cumulative count of cases where it was unknown whether they had an underlying condition and/or were pregnant (Niet vermeld)}
#'   }
#' @export
#' @source for further information look at \url{https://github.com/J535D165/CoronaWatchNL/tree/master/data-misc/}
#' @examples
#' \dontrun{get_underlying_statistics()}
get_underlying_statistics <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-misc/data-underlying/data-underlying_statistics/RIVM_NL_deceased_under70_statistics.csv'
  underlying_statistics  <- readr::read_csv(pins::pin(url))
  underlying_statistics
}


#' Get data for the underlying condition of deceased COVID-19 patients younger than 70
#'
#'
#' @return A dataframe with the following 3 columns:
#' \describe{
#'   \item{Datum/Date}{Date of notification}
#'   \item{Type/Type}{Type of test measurement (i.e., Totaal gemeld, Onderliggende aandoeningen en/of zwangerschap, Geen onderliggende aandoening, Niet vermeld)}
#'   \item{AantalCumulatief/Cumulative count}{The cumulative number of deceased COVID-19 cases younger than 70 (Totaal gemeld) with (Onderliggende aandoening en/of zwangerschap) or without (Geen onderliggende aandoening) an underlying condition and/or pregnancy, and the cumulative count of cases where it was unknown whether they had an underlying condition and/or were pregnant (Niet vermeld)}
#'   }
#' @export
#' @source for further information look at \url{https://github.com/J535D165/CoronaWatchNL/tree/master/data-misc/}
#' @examples
#' \dontrun{get_underlying_conditions() %>%
#'  dplyr::arrange(dplyr::desc(AantalCumulatief))}
get_underlying_conditions <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-misc/data-underlying/data-underlying_conditions/RIVM_NL_deceased_under70_conditions.csv'
  underlying_conditions  <- readr::read_csv(pins::pin(url))
  underlying_conditions
}


#' Get data for the measures taken by the government to fight the spread of Covid-19
#'
#'
#' @return A dataframe with the following 9 columns:
#' \describe{
#'   \item{measureID}{Measure ID}
#'   \item{measureDescription}{Description of the enforced measure}
#'   \item{lastMeasureUpdate}{Date on which the measure was last updated}
#'   \item{area}{The area in which the measure is/was enforced}
#'   \item{status}{	Restriction status of the enforced measure (i.e., 'events' can be: Closed, Partially closed, Partially banned, Banned, or Partially cancelled)}
#'   \item{restrictiveMeasures}{Adherence level of the measure (i.e., measure can be: Recommended or Mandatory)}
#'   \item{startDate}{Date on which the measure was first enforced}
#'   \item{endDate}{Date on which the measure was no longer enforced}
#'   \item{notes}{Notes about the measure	}
#'   }
#' @export
#' @source for further information look at \url{https://github.com/J535D165/CoronaWatchNL/tree/master/data-misc/}
#' @examples
#' dim(get_measures_data())
get_measures_data <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-misc/data-measures/NLD_measures_latest.csv'

  measures_data <- readr::read_csv(pins::pin(url))
  measures_data
}

#' Get data for companies that have requested for financial aid from the government
#'
#' The NOW register, published by UWV, mentions the companies that requested and received an advance on the reimbursement.
#' @return A dataframe with the following 3 columns:
#' \describe{
#'   \item{Bedrijfsnaam}{Name of company requesting financial support*}
#'   \item{Vestigingsplaats}{Location of company	}
#'   \item{Uitbetaald voorschotbedrag}{The advance payment to the company in euros}
#'   }
#' @export
#' @source for further information look at \url{https://github.com/J535D165/CoronaWatchNL/tree/master/data-misc/}
#' @examples
#' \dontrun{sum(get_economy_data()$`UITBETAALD VOORSCHOTBEDRAG`)}
get_economy_data <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-misc/data-economy/now-registry-20200710.csv'
  economy_data <- readr::read_csv(pins::pin(url))
  economy_data
}


#' Get daily estimated reproduction number R
#'
#' The reproduction number R gives the average number of people infected by one person with COVID-19.
#'
#' @return A dataframe with the following 4 columns:
#' \describe{
#'   \item{Date}{date for which the reproduction number has been estimated}
#'   \item{Rt_low}{lower limit 95% confidence interval	}
#'   \item{Rt_avg}{estimated reproduction number}
#'   \item{Rt_avg}{upper limit 95% confidence interval}
#'   }
#' @export
#'
#' @examples
#' \dontrun{mean(get_reproduction_rate()$Rt_avg,na.rm = TRUE)}
#' @source https://data.rivm.nl/geonetwork/srv/dut/catalog.search#/metadata/ed0699d1-c9d5-4436-8517-27eb993eab6e?tab=relations
get_reproduction_rate <- function(){

  url <- 'https://data.rivm.nl/covid-19/COVID-19_reproductiegetal.json'
  reproduction_rate <- jsonlite::fromJSON(url)
  reproduction_rate <- tibble::as_tibble(reproduction_rate)
  reproduction_rate

}






#' Get the ratio of virus particles measured by RIVM in the sewage
#'
#'a sample of the sewage is taken for 24 hours per treatment plant and per unit of time. These samples are analysed by RIVM researchers for the number of virus particles.
#'
#' @return A dataframe with  11 columns
#' @export
#'
#' @examples
#' mean(get_sewage_data()$RNA_per_ml,na.rm = TRUE)
#' @source https://data.rivm.nl/geonetwork/srv/dut/catalog.search#/metadata/a2960b68-9d3f-4dc3-9485-600570cd52b9
get_sewage_data <- function(){

  url <- 'https://data.rivm.nl/covid-19/COVID-19_rioolwaterdata.csv'
  sewage_data  <- readr::read_csv(pins::pin(url))
  sewage_data

}


#'  Get the number of suspected patients in the Netherlands
#'
#' @return A dataframe with the following 3 columns
#' @export
#' @source for further information look at \url{https://github.com/J535D165/CoronaWatchNL/tree/master/data-misc/}
#' @examples
#' \dontrun{get_suspected_patients()}
get_suspected_patients<- function(){
  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-dashboard/data-suspects/RIVM_NL_suspects.csv'
  suspected_patients  <- readr::read_csv(pins::pin(url))
  suspected_patients


}



#' Get population data of regions in the Netherlands
#'
#' @return  A dataframe with the following 7 columns
#' @export
#'
#' @examples
#' \dontrun{get_population_per_region()}
get_population_per_region <- function(){
  url <- 'https://opendata.cbs.nl/CsvDownload/csv/03759ned/UntypedDataSet?dl=3A09C'
  populatuon_per_region <- readr::read_delim(url,delim = ';')
  populatuon_per_region <- populatuon_per_region %>%
    dplyr::filter(Perioden  == 2020,`Burgerlijke staat` == 'Totaal burgerlijke staat') %>%
    dplyr::rename(Regions = `Regio's`)

}
