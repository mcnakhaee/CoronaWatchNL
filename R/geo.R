
#' Title
#'
#'
#' @return
#' @export
#'
#' @examples
get_data_geo_national <- function(lang = 'nl'){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-geo/data-national/RIVM_NL_national.csv'
  data_geo_national <- readr::read_csv(pins::pin(url))
  data_geo_national


}



#' Title
#'
#'
#' @return
#' @export
#'
#' @examples
get_data_geo_provincial <- function(lang = 'nl'){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-geo/data-provincial/RIVM_NL_provincial.csv'
  data_geo_provincial <- readr::read_csv(pins::pin(url))
  data_geo_provincial


}


#' Title
#'
#'
#' @return
#' @export
#'
#' @examples
get_data_geo_municipal <- function(){

  url <- 'https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-geo/data-municipal/RIVM_NL_municipal.csv'
  data_geo_municipal <- readr::read_csv(pins::pin(url))
  data_geo_municipal


}
