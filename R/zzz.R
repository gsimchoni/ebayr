.onLoad <- function(libname = find.package("ebayr"),
                    pkgname = "ebayr") {
  ebay_token <- Sys.getenv("EBAY_TOK")
  
  if (ebay_token == "") {
    message(paste0("Welcome to the R wrapper to the ebay Finding API.",
                   "\nI see you don't have a token for this API (environment variable 'EBAY_TOK').",
                   "\nPlease get one at https://go.developer.ebay.com/ and set it using setEbayToken(YOUR_TOKEN)."))
  }
}