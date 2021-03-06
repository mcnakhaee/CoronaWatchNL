% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc.R
\name{get_testing_data}
\alias{get_testing_data}
\title{Get testing data published by RIVM}
\source{
for further information look at \url{https://github.com/J535D165/CoronaWatchNL/tree/master/data-misc/}
}
\usage{
get_testing_data()
}
\value{
A dataframe with the following 7 columns:
\describe{
\item{Jaar/Year}{Year of notification}
\item{Week/Week number*}{Week of notification}
\item{BeginDatum/Start date}{Beginning of the week (Monday) of notification}
\item{EindDatum/	End date}{End of the week (Sunday) of notification}
\item{AantalLaboratoria/Number of laboratories}{Number of Dutch laboratories that have performed diagnostics for SARS-CoV-2 in said week}
\item{Type/Type}{Type of test measurement (i.e., Totaal, Positief)}
\item{Aantal/Count}{Number of people tested for COVID-19 (Totaal), and number of positively tested people for COVID-19 (Positief**) per week}
}
}
\description{
Get testing data published by RIVM
}
\examples{
mean(get_testing_data()$Labs)
}
