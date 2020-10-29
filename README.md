
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CoronaWatchNL

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/CoronaWatchNL)](https://CRAN.R-project.org/package=CoronaWatchNL)
<!-- badges: end --> CoronaWatchNL is an R package that allow you to
have an up-to-date access to a wide range range of Covid-19 related
datasets in the Netherlands. This package is heavily based on the
[CoronaWatchNL](https://github.com/J535D165/CoronaWatchNL) repository on
GitHub which collects and releases this information on a daily basis.
However, the R package also provides more datasets that are not included
in the original repository, such as [the weekly mortality rate
data](https://www.cbs.nl/en-gb/series/mortality-per-week) published by
CBS () .

At the moment, the following category of datasets are available through
this R package:

### Geographical datasets

These datasets are

| Dataset                                             | Source | Variables                                                                                                | Function                                                                           |
| --------------------------------------------------- | ------ | -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| Reported case counts by date in NL                  | RIVM   | Date, Type (Total, hospitalized and deceased COVID-19 cases), (Cumulative) Count                         | `get_daily_national_cases()`                                                       |
| Reported case counts by date in NL per province     | RIVM   | Date, Province, Type (Total, hospitalized and deceased COVID-19 cases), (Cumulative) Count               | `get_daily_provincial_cases()`                                                     |
| Reported case counts by date in NL per municipality | RIVM   | Date, Municipality, Province, Type (Total, hospitalized and deceased COVID-19 cases), (Cumulative) Count | `get_daily_cases_per_municpality`()/`get_cumilative_cases_per_municpality()`\#\#\# |

### Descriptive datasets

| Dataset                                          | Source | Variables                                                                                   | Function                          |
| ------------------------------------------------ | ------ | ------------------------------------------------------------------------------------------- | --------------------------------- |
| Case counts in NL per age                        | RIVM   | Date, Age group, Type (Total, hospitalized and deceased COVID-19 cases), (Cumulative) Count | `get_cases_by_age()`              |
| Case counts in NL per sex                        | RIVM   | Date, Sex, Type (Total, hospitalized and deceased COVID-19 cases), (Cumulative) Count       | `get_cases_by_sex()`              |
| Deceased case counts in NL per sex and age group | RIVM   | Date, Age group, Sex, (Cumulative) Count of deceased cases                                  | `get_deceased_cases_by_sex_age()` |

### Intensive care datasets

| Dataset                                                                | Source         | Variables                                                                                                                                                                | Function                                     |
| ---------------------------------------------------------------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------- |
| COVID-19 intensive care patient counts in NL (Wide or long Format)     | Stichting NICE | Date, New, Total and Cumulative ICU admissions per day, Number of ICUs with at least one COVID-19 case, New and Cumulative fatal, survived and discharged ICU admissions | `get_icu_data_wide()`/ `get_icu_data_long`() |
| COVID-19 intensive care patient counts with country of hospitalization | LCPS           | Date, Country of Hospitalization, Total COVID-19 ICU admissions                                                                                                          | `get_lcps_data()`                            |

### Mortality Rate

| Dataset               | Source                                                                                       | Variables                                                                                  | Function               |
| --------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------------- |
| Weekly mortality rate | [CBS.nl](https://opendata.cbs.nl/portal.html?_la=nl&_catalog=CBS&tableId=70895ned&_theme=75) | Sex, Age group of the deceased person on 31 December , Periods, Number of registered death | `get_mortality_rate()` |

### Miscellaneous datasets

| Dataset                                                                               | Source                                                                                       | Variables                                                                                                          | Function                      |
| ------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ----------------------------- |
| Population per region (municipality)                                                  | [CBS.nl](https://opendata.cbs.nl/portal.html?_la=nl&_catalog=CBS&tableId=70895ned&_theme=75) | Periods, Regions, Population                                                                                       | `get_population_per_region()` |
| Suspected patients in NL                                                              | [National Dashboard](https://github.com/J535D165/CoronaWatchNL#data-collection-sources)      | Date, Type of measure, Count                                                                                       | `get_suspected_patients()`    |
| COVID-19 particles in sewage                                                          | RIVM                                                                                         |                                                                                                                    | `get_sewage_data()`           |
| Reproduction index COVID-19 virus                                                     | RIVM                                                                                         |                                                                                                                    | `get_reproduction_rate()`     |
| Government financial aid to companies                                                 | UWV                                                                                          | Company, Location, Advance                                                                                         | `get_economy_data()`          |
| COVID-19 measures by the government                                                   | European Commission Joint Research Centre                                                    | Various variables on governmental measures (in English)                                                            | `get_measures_data()`         |
| Underlying conditions and/or pregnancy in deceased COVID-19 cased under the age of 70 | RIVM                                                                                         | Date, Type of condition, Cumulative count                                                                          | `get_underlying_conditions()` |
| Underlying conditions and/or pregnancy in deceased COVID-19 cased under the age of 70 | RIVM                                                                                         | Date, Type of condition, Cumulative count                                                                          | `get_underlying_statistics()` |
| COVID-19 tests in NL per week                                                         | RIVM                                                                                         | Year, Calendar week, Start date (Monday), End date (Sunday), Included labs, Type (Total and positive tests), Count | `get_testing_data()`          |

## Installation

You can install the development version of CoronaWatchNL from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mcnakhaee/CoronaWatchNL")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(CoronaWatchNL)
library(tidyverse)
#> Warning: package 'tidyverse' was built under R version 3.6.3
#> -- Attaching packages -------------------------------------------------------------- tidyverse 1.3.0 --
#> v ggplot2 3.3.2     v purrr   0.3.3
#> v tibble  3.0.1     v dplyr   1.0.2
#> v tidyr   1.0.2     v stringr 1.4.0
#> v readr   1.3.1     v forcats 0.4.0
#> Warning: package 'ggplot2' was built under R version 3.6.3
#> Warning: package 'tibble' was built under R version 3.6.3
#> Warning: package 'dplyr' was built under R version 3.6.3
#> -- Conflicts ----------------------------------------------------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(ggthemes)
#> Warning: package 'ggthemes' was built under R version 3.6.3
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
mortality_rate <- get_mortality_rate()
mortality_rate %>% 
  filter(Periods >'2019',!Periods %in% c('2019JJ00'),Sex == 'T001038',Age31December == 10000) %>% 
  ggplot(aes(x = seq_along(Periods),y = Deaths_1)) +
  geom_line() +
  #scale_x_continuous(labels = )
  facet_grid( Age31December~Sex,scales = 'free_y') +
  theme_fivethirtyeight()
```

<img src="man/figures/README-cars-1.png" width="100%" />
