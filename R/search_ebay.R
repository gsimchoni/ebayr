#' Search ebay
#'
#' The primary \code{ebayr} function which allows you to search ebay using keywords,
#' using one or more categories, or both.
#' The function uses the "ebay Finding API" and the "findItemsAdvanced" call.
#' @param keywords Specify one or more words to use in a search query for finding items on eBay.
#' By default, queries search item titles only.
#' @param site The ebay site to search, a.k.a GLOBAL-ID. Currently only US, UK,
#' DE and AU are supported. Defaults to US.
#' @param categoryName Name of the ebay category or categories, if known.
#' Unused if the \code{categoryId} is specified. Defaults to searching all categories but see details.
#' @param aspectFilter List of name-value aspect to limit the query,
#' e.g. \code{list(Color = "Black")}. See details.
#' @param nResults Number of items requested, defaults to 10. The maximum allowed
#' by ebay is 10000 (max. 100 pages x max 100 items per page, where each page is a \emph{separate} request)
#' @param sortOrder The order by which results are sorted. Defaults to "BestMatch", the site's default.
#' @param condition Condition of item requested, e.g. "New". Defaults to "All".
#' @param listingType Type of item requested, e.g. "Auction". Defaults to "All", see details.
#' @param priceRange An integer vector of length 2 specifying the minimum and
#' maximum item price requested, in the site's currency. Defaults to \code{c(0, Inf)}.
#' @param quantityRange An integer vector of length 2 specifying the minimum and
#' maximum item quantity requested. Defaults to \code{c(1, Inf)}.
#' @param topRatedSellerOnly A boolean indicating whether only "Top Rated
#' Sellers" are requested. Defaults to \code{FALSE}.
#' @param hideDuplicateItems A boolean indicating whether to force return only
#' distinct items. Defaults to \code{TRUE}. See details on why this is necessary.
#' @param freeShippingOnly A boolean indicating whether only items with Free
#' Shipping are requested. Defaults to \code{FALSE}.
#' @param sellerFeedbackRange An integer vector of length 2 specifying the minimum and
#' maximum seller feedback score requested. Defaults to \code{c(0, Inf)}.
#' @param ebayToken The ebay AppID you got at \url{https://go.developer.ebay.com}.
#' Default is to look for it with \code{Sys.getenv()}
#' @param categoryId ID of the ebay category or categories, if known. Defaults
#' to searching all categories but see details.
#' @param returnAll A boolean indicating whether to return all API response
#' parameters (for the last page) (\code{TRUE}) or just the items tibble (\code{FALSE}).
#' Defaults to \code{FALSE}.
#' @param verbose A boolean indicating whether to print to console the page
#' progress which might be useful if \code{nResults} is very large. Defaults to \code{TRUE}.
#'
#' @return If \code{returnAll == TRUE}, a \code{EbayResponse} R6 Class instance containing:
#' \item{url}{The URL that was formed for the API GET request}
#' \item{queryList}{The list of name-value pairs attached to the GET request}
#' \item{site}{The site requested}
#' \item{nResultsRequested}{Number of results requested}
#' \item{nResultsAvailable}{Number of results in potential, on site}
#' \item{nResultsFinal}{Final number of results found (could be quite lower than
#' \code{nResultsRequested}, not only because \code{nResultsAvailable} is less
#' requested. If \code{hideDuplicateItems == TRUE} (default) many duplicates might have been removed.)}
#' \item{timestamp}{The time of the last page request}
#' \item{itemSearchURL}{The URL to view the results for the last page on ebay -
#' this comes from ebay and is not accurate}
#' \item{page}{The number of the last page}
#' \item{totalPages}{No. of pages for this request}
#' \item{items}{The tibble holding the items data, see details.}
#' Otherwise only the \code{items} tibble will be returned (the default).
#'
#' @details
#' The \code{search_ebay} function wraps a GET request to the ebay Finding API,
#' using the \code{httr} package. Currently only the "findItemsAdvanced" call is
#' supported, which means you can search for active items (i.e. still live on site)
#' by keywords, by category or both.
#'
#' In order to use this function you must either supply it with a valid "AppID"
#' from \url{https://go.developer.ebay.com} via the \code{ebayToken} parameter,
#' or register it to last for your entire R session with \code{\link{setEbayToken}}.
#' For more details see README and blog post in References. Please note the
#' \href{https://go.developer.ebay.com/api-license-agreement}{API license}
#' ebay sets when signing up for a token as well as a daily rate
#' limit of 5,000 requests.
#'
#' \code{keywords}: For rules regarding keywords, see \href{https://developer.ebay.com/devzone/finding/Concepts/FindingAPIGuide.html#usekeywords}{here}
#' \code{categoryName}: in general the API does not accept category names which
#' are not unique (e.g. \emph{Digital Cameras}), but only one or more category IDs.
#' If more than a single categoryID belongs to each of the names specified, the
#' function will warn you this happened but will continue regardless. If no
#' category is found whose name matches the input exactly, the function will suggest
#' a few similar ones, try and pick one. Where to find the category name or ID?
#' \itemize{
#'   \item through the ebay site (in an item's page, in the URL)
#'   \item through previous results in the \code{items} tibble
#'   \item or you might not need it, as the ebay search is quite good
#'   (e.g. shouldn't get results for "Nikon DSLR" in "Women's Handbags")
#' }
#'
#' \code{aspectFilter}: this parameter allows you to further refine your results,
#' e.g. specifying \code{aspectFilter = list("Storage Capacity" = "64GB")} when
#' searching for "iPhone X", will only return iPhones with the specified Storage
#' Capacity. Naturally these possible name-values differ from category to category
#' and currently the best place to look for them is by looking at the left side bar
#' in the search results page. Only one "value" per "name" is supported in this function.
#'
#' \code{listingType}:
#' \itemize{
#'   \item FixedPrice: no auction activity on this item, either from a private seller
#'   or from a store ("StoreInventory"). Most items on ebay.
#'   \item Auction: an auction item, most importantly this means that the price
#'   you see is not finite!
#'   \item AuctionWithBIN: these are auction items which also have a "Buy It Now"
#'   option, which means you can bypass the auction and just pay a certain price
#' }
#'
#' \code{hideDuplicateItems}: this parameter defaults to \code{TRUE} because there's
#' a good chance that without it you'll get quite a few duplicate items. One of the
#' reasons might be "Multi Variation" items, when a seller uses a single item to list
#' different versions of the same "thing", e.g. a shirt which comes in various colors.
#' Without specifying \code{hideDuplicateItems = TRUE} each of these shirts might
#' return as a separate item, with its own price. There are other reasons, and
#' this could get confusing. For example when comparing prices you might want to
#' consider removing all items in the \code{items} tibble which have \code{TRUE}
#' in the \code{isMultiVariationListing} column.
#'
#' Details regrding the \code{items} tibble (these are the tibble's columns):
#' \itemize{
#'   \item itemId: ebay's unique item ID for each item
#'   \item title: item's title as it appears on site
#'   \item categoryId: item's \emph{primary} category ID, note that an item can
#'   have a secondary category, not returned here
#'   \item categoryName: category's name
#'   \item viewItemURL: item's URL on ebay
#'   \item location: a string specifying the item's location, e.g. "Melbourne, Australia"
#'   \item shippingType: free or some other values, see API Reference
#'   \item shipToLocations: Worldwide or other values, see API Reference
#'   \item isMultiVariationListing: see details on the \code{hideDuplicateItems} parameter
#'   \item conditionId: ebay's ID for a condition, e.g. "1000" for "New"
#'   \item conditionName: name of condition, e.g. "New", "Used"
#'   \item listingType: see details on the \code{listingType} parameter
#'   \item startTime: the time the item successfully uploaded to site
#'   \item endTime: the time the item is scheduled to end, this could be sooner if it sells
#'   \item watchCount: no. of users watching the item in their watchlist, could be \code{NA} for some reason
#'   \item price: current price of the item in the site's currency, notice what this means for auction items
#'   \item currency: the price currency, e.g. "AUD" for Australian Dollars
#' }
#'
#' @references
#' A blog post describing the package with more examples: \url{http://giorasimchoni.com/} TODO
#' The ebay Finding API documentation: \url{https://developer.ebay.com/Devzone/finding/Concepts/FindingAPIGuide.html}
#'
#' @examples
#' search_ebay("iPhone X")
#' search_ebay("Nikon DSLR", categoryName = "Digital Cameras",
#'   aspectFilter = list(Model = "Nikon D5500"), condition = "New",
#'   listingType = "FixedPrice")
#'
#' @export
search_ebay <- function(
  keywords = NULL,
  site = c("US", "UK", "DE", "AU"),
  categoryName = NULL,
  aspectFilter = NULL,
  nResults = 10,
  sortOrder = c("BestMatch", "EndTimeSoonest", "PricePlusShippingHighest",
                "PricePlusShippingLowest", "StartTimeNewest"),
  condition = c("All", "New", "Used", "Unspecified"),
  listingType = c("All", "FixedPrice", "Auction", "AuctionWithBIN"),
  priceRange = c(0, Inf),
  quantityRange = c(1, Inf),
  topRatedSellerOnly = FALSE,
  hideDuplicateItems = TRUE,
  freeShippingOnly = FALSE,
  sellerFeedbackRange = c(0, Inf),
  ebayToken = getEbayToken(),
  categoryId = NULL,
  returnAll = FALSE,
  verbose = TRUE
  ){
  # verify token
  if (ebayToken == "") {
    stop(paste0("You don't have a token for this API (environment variable 'EBAY_TOK').",
                "\nPlease get one at https://go.developer.ebay.com/ and set it using setEbayToken(YOUR_TOKEN)."))
  }

  # verify either keywords or category were input
  if (is.null(keywords) && is.null(categoryName) && is.null(categoryId)) {
    stop("One of keywords, categoryName or categoryId must be specified")
  }

  # verify keywords
  if (!is.null(keywords) && !dplyr::between(stringr::str_length(keywords), 2, 350)) {
    stop("Keywords string must be between 2 and 350 characters long")
  }

  # verify site
  site <- match.arg(site, c("US", "UK", "DE", "AU"))

  # verify categoryId/categoryName
  if (!is.null(categoryId) || !is.null(categoryName)) {
    cats <- getCatsTable(site)

    if (!is.null(categoryId) && !is.null(categoryName)) {
      warning("Ignoring categoryName because categoryId was specified")
      categoryName <- NULL
    }

    if (!is.null(categoryId) && !checkValidCategoryId(categoryId, cats)) {
      warning("Ignoring categoryId specified at least one categoryId is not a valid ID for this site")
      categoryId <- NULL
      if (missing(keywords) && missing(categoryName)) {
        stop("After ignoring categoryId there are no essentail paramters left for this query")
      }
    }

    if (!is.null(categoryName)) {

      if (!checkValidCategoryName(categoryName, cats)) {
        message(stringr::str_c("No CategoryName specified was found for this site.",
                               "\nPlease choose one of the closest choices or 0 to ignore this parameter:"))
        categoryChoices <- getTopCategoryNamesSuggestions(categoryName, cats)
        choice <- menu(categoryChoices)
        if (choice == 0) {
          categoryName <- NULL
          warning("Ignoring categoryName to your choosing")
          if (missing(keywords) && missing(categoryId)) {
            stop("After ignoring categoryName there are no essential paramters left for this query")
          }
        } else {
          categoryName <- categoryChoices[choice]
        }
      }
      categoryId <- getCategoryIDFromCategoryName(categoryName, cats)
      if (length(categoryId) > length(categoryName)) {
        warning("There were more categoryIds than categoryNames entered")
      }
    }

    if (length(categoryId) > 3) {
      warning("There were over 3 categoryIds requested, taking the first 3")
      categoryId <- categoryId[1:3]
    }
  }

  # site header
  siteId <- stringr::str_c("EBAY-", site)
  if (site == "UK") {
    siteId <- "EBAY-GB"
  }

  # buildQuery
  queryList <- list()

  if (!is.null(keywords)) {
    queryList$keywords <- keywords
  }

  if (!is.null(categoryId)) {
    if (length(categoryId) == 1) {
      queryList$categoryId <- categoryId
    } else {
      for (i in 0:(length(categoryId) - 1)) {
        queryList[[stringr::str_c("categoryId(", i, ")")]] <- categoryId[i + 1]
      }
    }
  }

  sortOrder <- match.arg(sortOrder, c("BestMatch", "EndTimeSoonest", "PricePlusShippingHighest",
                           "PricePlusShippingLowest", "StartTimeNewest"))
  queryList$sortOrder <- sortOrder

  listingType <- match.arg(listingType, c("All", "FixedPrice", "Auction", "AuctionWithBIN"))
  queryList <- addItemFilterToQuery(queryList, "ListingType", listingType, "All")

  condition <- match.arg(condition, c("All", "New", "Used", "Unspecified"))
  queryList <- addItemFilterToQuery(queryList, "Condition", condition, "All")

  if (is.null(priceRange) || !is.numeric(priceRange) || length(priceRange) != 2 ||
      priceRange[1]  > priceRange[2] || any(priceRange < 0)) {
    warning("Ignoring priceRange as it is invalid")
    priceRange <- c(0, Inf)
  }
  queryList <- addItemFilterToQuery(queryList, "MinPrice", priceRange[1], 0)
  queryList <- addItemFilterToQuery(queryList, "MaxPrice", priceRange[2], Inf)

  if (is.null(quantityRange) || !is.numeric(quantityRange) || length(quantityRange) != 2 ||
      quantityRange[1]  > quantityRange[2] || any(quantityRange < 0)) {
    warning("Ignoring quantityRange as it is invalid")
    priceRange <- c(1, Inf)
  }
  queryList <- addItemFilterToQuery(queryList, "MinQuantity", quantityRange[1], 1)
  queryList <- addItemFilterToQuery(queryList, "MaxQuantity", quantityRange[2], Inf)

  if (is.null(sellerFeedbackRange) || !is.numeric(sellerFeedbackRange) || length(sellerFeedbackRange) != 2 ||
      sellerFeedbackRange[1]  > sellerFeedbackRange[2] || any(sellerFeedbackRange < 0)) {
    warning("Ignoring sellerFeedbackRange as it is invalid")
    sellerFeedbackRange <- c(0, Inf)
  }
  queryList <- addItemFilterToQuery(queryList, "FeedbackScoreMin", sellerFeedbackRange[1], 0)
  queryList <- addItemFilterToQuery(queryList, "FeedbackScoreMax", sellerFeedbackRange[2], Inf)

  topRatedSellerOnly <- stringr::str_to_lower(as.character(topRatedSellerOnly))
  queryList <- addItemFilterToQuery(queryList, "TopRatedSellerOnly", topRatedSellerOnly, "false")

  hideDuplicateItems <- stringr::str_to_lower(as.character(hideDuplicateItems))
  queryList <- addItemFilterToQuery(queryList, "HideDuplicateItems", hideDuplicateItems, "false")

  freeShippingOnly <- stringr::str_to_lower(as.character(freeShippingOnly))
  queryList <- addItemFilterToQuery(queryList, "FreeShippingOnly", freeShippingOnly, "false")

  queryList <- addAspectFilterListToQuery(queryList, aspectFilter)

  # dealing with nResults and pagination
  if (!is.numeric(nResults) || nResults > 10000 || nResults < 0 || nResults %% 1 != 0) {
    warning("Setting nResults to 100, input was not valid")
    nResults <- 100
  }

  nResults <- as.integer(nResults)
  if (nResults %% 100 == 0) {
    nPages <- nResults / 100
  } else {
    nPages <- nResults %/% 100 + 1
  }

  respObjList <- list()

  # loop through pages
  for (page in 1:nPages) {
    if (page == nPages) {
      if (nResults %% 100 == 0) {
        entriesPerPage <- 100
      } else {
        entriesPerPage <- nResults %% 100
      }
    } else {
      entriesPerPage <- 100
    }

    queryList[[stringr::str_c("paginationInput.pageNumber")]] <- page
    queryList[[stringr::str_c("paginationInput.entriesPerPage")]] <- entriesPerPage

    # call API
    resp <- httr::GET(url = stringr::str_c("http://svcs.ebay.com/services/search/FindingService/v1",
                                           "?",
                                           "OPERATION-NAME=findItemsAdvanced&",
                                           "SERVICE-VERSION=1.0.0&",
                                           "RESPONSE-DATA-FORMAT=JSON&",
                                           "SECURITY-APPNAME=", ebayToken, "&",
                                           "REST-PAYLOAD"),
                      query = queryList,
                      httr::add_headers(`x-ebay-soa-global-id` = siteId))

    if (httr::http_error(resp)) {
      stop(
        sprintf(
          "ebay API request failed [%s]",
          httr::status_code(resp)
        ),
        call. = FALSE
      )
    }

    if (httr::headers(resp)$`x-ebay-soa-response-data-format` != "JSON") {
      stop("API did not return json", call. = FALSE)
    }

    # parse JSON response
    parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

    # put it in a class
    respObj <- EbayResponse$new(resp$url, parsed, queryList, site, nResults)

    respObjList <- c(respObjList, respObj)

    if (verbose) {
      cat("Finished page ", page, "\n")
    }

    if (respObj$totalPages == 0 || respObj$totalPages == page) break;
  }

  # set itemFilterIndex to zero
  nextItemFilterCounter(1)

  # unite respObjs
  allItems <- if (hideDuplicateItems){
    dplyr::distinct(purrr::map_dfr(respObjList, function(x) x$items))
  } else {
    purrr::map_dfr(respObjList, function(x) x$items)
  }

  if (verbose) {
    cat("Returning ", nrow(allItems), " Results.\n")
  }

  if (returnAll) {
    respObj$setItems(allItems)
    respObj$setNResultsFinal()
    return(respObj)
  } else {
    return(allItems)
  }
}
