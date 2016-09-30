#' @name gene_cell_info
#' @title Baseline expression information for genes across cell lines
#' @description This data set contains baseline expression measurements for 
#' genes in cell lines [without any experimental perturbations] as profiled
#' by the LINCS data consortium
#' @docType data
#' @usage data(gene_cell_info)
#' @return A data.frame object
#' @format A data frame with 1703457 observations on the following 6 variables.
#'\itemize{
#'\item{\code{pr_gene_symbol}}{a character vector}
#'\item{\code{cell}}{a character vector}
#'\item{\code{basex_affx}}{a numeric vector}
#'\item{\code{basex_rnaseq}}{a numeric vector}
#'\item{\code{copy_number}}{a numeric vector}
#'\item{\code{is_expressed}}{a logical vector}
#'}
#'@rdname gene_cell_info
"gene_cell_info"
