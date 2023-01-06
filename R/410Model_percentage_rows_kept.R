#' Table with percentage of rows left after filtering
#'
#' `percentage_rows_kept()` takes a prepared data frame as input, and compares
#'     the number of rows to the unfiltered tidy data
#'     `TCRSequenceFunctions::data_combined_tidy` for each donor. The comparison
#'     is shown in a table.
#'
#' @inheritParams summarise_with_filter
#'
#' @return A table with a percentage representing number of rows left compared
#'     to unfiltered tidy data.
#'
#' @family Modelling functions
#' @export
#'
#' @examples
#' # A prepared data frame is simply piped through the function:
#' data_combined_tidy %>%
#'     percentage_rows_kept()
#'

percentage_rows_kept <- function(.data,
                                  identifier = barcode) {
  prep_data <- function(.data_to_prep,
                        name) {
    data_prep <- .data_to_prep %>%
      dplyr::select(is_binder,
                    {{identifier}},
                    donor,
                    pMHC) %>%
      dplyr::filter(is_binder == TRUE) %>%
      dplyr::distinct(donor,
                      {{identifier}},
                      pMHC,
                      .keep_all = TRUE) %>%
      dplyr::count(donor,
                   name = name)

    return(data_prep)
  }

  data_old <- TCRSequenceFunctions::data_combined_tidy %>%
    prep_data(name = "count_old")

  data_new <- .data %>%
    prep_data(name = "count_new")

  data_model <- data_new %>%
    dplyr::left_join(data_old,
                     by = "donor") %>%
    dplyr::mutate(percentage_left = (count_new / count_old) * 100) %>%
    dplyr::select(donor, percentage_left)

  return(data_model)
}