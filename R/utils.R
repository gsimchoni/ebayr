#' Search ebay
#'
#' Set your personal ebay developers token as an enviroment variable, so you don't
#' have to specify it in each \code{search_ebay} call
#' @param token Valid ebay developers token
#' @examples
#' setEbayToken("YOUR_TOKEN")
#' @export
setEbayToken <- function(token) {
  Sys.setenv(EBAY_TOK = token)
}


getEbayToken <- function(token) {
  Sys.getenv("EBAY_TOK")
}

getCatsTable <- function(site) {
  catsFile <- stringr::str_c(stringr::str_to_lower(site), "_cats.RData")
  catsFilePath <- system.file("extdata", catsFile,
                              package = "ebayr")
  readRDS(catsFilePath)
}

checkValidCategoryId <- function(categoryId, cats) {

  all(categoryId %in% cats$CategoryID)
}

checkValidCategoryName <- function(categoryName, cats) {
  all(stringr::str_to_lower(categoryName) %in% stringr::str_to_lower(cats$CategoryName))
}

# this should be used after the categoryName has been validated
getCategoryIDFromCategoryName <- function(categoryName, cats) {
  unname(unlist(cats[cats$CategoryName %in% categoryName, "CategoryID"]))
}

getTopCategoryNamesSuggestions <- function(categoryName, cats, n = 5) {
  uniqueCatNames <- unique(cats$CategoryName)
  catsDist <- stringdist::stringdist(categoryName[1], uniqueCatNames)
  uniqueCatNames[order(catsDist)[1:5]]
}

addItemFilterToQuery <- function(queryList, filterName, filterValue, emptyValue = NULL) {
  if (!is.null(filterValue) && filterValue != emptyValue) {
    itemFilterIdx <- nextItemFilterCounter()
    queryList[[stringr::str_c("itemFilter(", itemFilterIdx, ").name")]] <- filterName #deparse(substitute(filter))
    queryList[[stringr::str_c("itemFilter(", itemFilterIdx, ").value")]] <- filterValue
  }
  queryList
}

addAspectFilterListToQuery <- function(queryList, aspectFilter) {
  if (!is.null(aspectFilter) && is.list(aspectFilter) && length(aspectFilter) > 0) {
    if (length(aspectFilter) == 1) {
      queryList[["aspectFilter.aspectName"]] <- names(aspectFilter)[1]
      queryList[["aspectFilter.aspectValueName"]] <- aspectFilter[[1]]
    } else {
      for (i in 0:(length(aspectFilter) - 1)) {
        queryList[[stringr::str_c("aspectFilter(", i, ").aspectName")]] <- names(aspectFilter)[i + 1]
        queryList[[stringr::str_c("aspectFilter(", i, ").aspectValueName")]] <- aspectFilter[[i + 1]]
      }
    }
  }
  queryList
}

nextItemFilterCounter <- local({
  idCounter <- -1L
  function(v = NULL){
    if (is.null(v)) {
      idCounter <<- idCounter + 1L
      return(idCounter)
    } else {
      idCounter <<- -1L
    }
  }
})
