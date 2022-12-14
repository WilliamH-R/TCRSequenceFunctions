% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/450Model_alpha_beta_category_distribution.R
\name{alpha_beta_category_distribution}
\alias{alpha_beta_category_distribution}
\title{Bar plot showing distribution of TCR-sequence promiscuity}
\usage{
alpha_beta_category_distribution(.data, identifier = barcode)
}
\arguments{
\item{.data}{An prepared data frame ready for modelling.}

\item{identifier}{A variable in the data frame with which the data set should
be distinct by to avoid a bias towards experiments with many observations.}
}
\value{
Returns a bar plot with a frequency distribution of the different
combinations of alpha- beta pairs.
}
\description{
\code{alpha_beta_category_distribution()} takes as input a prepared data frame. It plots
the distribution of categories found in the column \code{TCR_combination}.
A total of four categories exist:
* Only one alpha chain and no beta chain
* No alpha chain and one beta chain
* One alpha- and one beta chain
* Other combinations
}
\examples{
# The function is run by simply piping `.data` into it:
data_combined_tidy \%>\%
    alpha_beta_category_distribution()


}
\seealso{
Other Modelling functions: 
\code{\link{alpha_beta_sequence_distinctiveness}()},
\code{\link{boxplot_protein_expressions}()},
\code{\link{count_binding_pr_allele}()},
\code{\link{percentage_rows_kept}()},
\code{\link{relevant_binders_plot}()},
\code{\link{summarise_with_filter}()},
\code{\link{umap_of_protein_expressions}()}
}
\concept{Modelling functions}
