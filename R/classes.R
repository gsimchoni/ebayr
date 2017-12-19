EbayResponse <- R6::R6Class(
  "EbayResponse",
  public = list(
    url = NULL,
    queryList = NULL,
    site = NULL,
    nResultsRequested = NULL,
    items = NULL,
    timestamp = NULL,
    nResultsAvailable = NULL,
    itemSearchURL = NULL,
    page = NULL,
    totalPages = NULL,
    nResultsFinal = NULL,

    initialize = function(url = NA, parsed = NA, queryList = NA, site = NA,
                          nResultsRequested = NA) {
      self$url <- url
      self$queryList <- queryList
      self$site <- site
      self$nResultsRequested <- nResultsRequested
      self$items <- private$parseItemsTable(parsed)
      self$timestamp <- private$getTimestamp(parsed)
      self$itemSearchURL <- private$getSearchURL(parsed)
      self$nResultsAvailable <- private$getNResultsAvailable(parsed)
      self$page <- private$getPage(parsed)
      self$totalPages <- private$getTotalPages(parsed)
    },

    setItems = function(items) {
      self$items <<- items
    },

    setNResultsFinal = function() {
      self$nResultsFinal <- nrow(self$items)
    },

    print = function() {
      cat("<ebay Search Results>\n")
      str(self)
      invisible(self)
    }
  ),
  private = list(
    parseItem = function(item) {
      list(
        itemId = item$itemId[[1]],
        title = item$title[[1]],
        categoryId = as.numeric(item$primaryCategory[[1]]$categoryId[[1]]),
        categoryName = item$primaryCategory[[1]]$categoryName[[1]],
        viewItemURL = item$viewItemURL[[1]],
        location = item$location[[1]],
        shippingType = item$shippingInfo[[1]]$shippingType[[1]],
        shipToLocations = item$shippingInfo[[1]]$shipToLocations[[1]],
        isMultiVariationListing = as.logical(item$isMultiVariationListing[[1]]),
        conditionId = as.numeric(item$condition[[1]]$conditionId[[1]]),
        conditionName = item$condition[[1]]$conditionDisplayName[[1]],
        listingType = item$listingInfo[[1]]$listingType[[1]],
        startTime = as.Date(item$listingInfo[[1]]$startTime[[1]]),
        endTime = as.Date(item$listingInfo[[1]]$endTime[[1]]),
        watchCount = ifelse(is.null(item$listingInfo[[1]]$watchCount[[1]]),
                            NA,
                            as.numeric(item$listingInfo[[1]]$watchCount[[1]])),
        price = as.numeric(item$sellingStatus[[1]]$currentPrice[[1]]$`__value__`),
        currency = item$sellingStatus[[1]]$currentPrice[[1]]$`@currencyId`
      )
    },

    parseItemsTable = function(parsed) {
      dplyr::bind_rows(
        purrr::map(
          parsed$findItemsAdvancedResponse[[1]]$searchResult[[1]]$item,
          private$parseItem
        )
      )
    },

    getTimestamp = function(parsed) {
      as.Date(
        parsed$findItemsAdvancedResponse[[1]]$timestamp[[1]]
      )
    },

    getSearchURL = function(parsed) {
      parsed$findItemsAdvancedResponse[[1]]$itemSearchURL[[1]]
    },

    getNResultsAvailable = function(parsed) {
      as.numeric(
        parsed$findItemsAdvancedResponse[[1]]$paginationOutput[[1]]$totalEntries[[1]]
      )
    },

    getPage = function(parsed) {
      as.numeric(
        parsed$findItemsAdvancedResponse[[1]]$paginationOutput[[1]]$pageNumber[[1]]
      )
    },

    getTotalPages = function(parsed) {
      as.numeric(
        parsed$findItemsAdvancedResponse[[1]]$paginationOutput[[1]]$totalPages[[1]]
      )
    }
  )
)
