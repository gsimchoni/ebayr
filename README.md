<!-- README.md is generated from README.Rmd. Please edit that file -->
ATTENTION: It seems like ebay has decided to shut down its open API, in October-November 2018. This repo will be kept here for educational purposes only. It was fun while it lasted.
=====================================================================================================================================================================================

ebayr - R wrapper to the ebay Finding API
=========================================

This package allows you to search ebay for **live** items using
keywords, a category or both. It is a wrapper for the ebay Finding API,
specifically the “findItemsAdvanced” call. You can use it after you sign
up at <https://go.developer.ebay.com/> and get a valid token (a.k.a
AppID).

Install:

``` r
devtools::install_github("gsimchoni/ebayr")
```

Load:

``` r
library(ebayr)
```

Set ebay token:

``` r
setEbayToken("YOUR_EBAY_TOKEN")
```

Search by keywords:

``` r
search_ebay("elvis costume")
```

    #> # A tibble: 10 x 17
    #>    itemId title categoryId categoryName viewItemURL location sheepingType shipToLocations isMultiVariatio~
    #>    <chr>  <chr>      <dbl> <chr>        <chr>       <chr>    <chr>        <chr>           <lgl>           
    #>  1 36160~ Elvi~      52762 Men          http://www~ Travers~ Free         Worldwide       TRUE            
    #>  2 22275~ ELVI~      52762 Men          http://www~ Barring~ Calculated   Worldwide       FALSE           
    #>  3 26320~ Adul~      52762 Men          http://www~ Tonawan~ Free         Worldwide       TRUE            
    #>  4 12265~ Rubi~      52762 Men          http://www~ USA      Free         Worldwide       FALSE           
    #>  5 13243~ "Elv~      52762 Men          http://www~ Florenc~ Flat         Worldwide       FALSE           
    #>  6 28276~ ELVI~      52762 Men          http://www~ Las Veg~ Free         Worldwide       FALSE           
    #>  7 28226~ Elvi~      80913 Boys         http://www~ Chicago~ Free         Worldwide       FALSE           
    #>  8 28276~ ELVI~      52762 Men          http://www~ Las Veg~ Free         Worldwide       FALSE           
    #>  9 35221~ Elvi~      52762 Men          http://www~ Bakersf~ Free         Worldwide       FALSE           
    #> 10 22267~ Elvi~      52762 Men          http://www~ Clarenc~ Calculated   Worldwide       FALSE           
    #> # ... with 8 more variables: conditionId <dbl>, conditionName <chr>, listingType <chr>, startTime <date>,
    #> #   endTime <date>, watchCount <dbl>, price <dbl>, currency <chr>

Search by category (a.k.a Browse):

``` r
search_ebay(categoryName = "Video Game Consoles")
```

    #> # A tibble: 10 x 17
    #>    itemId title categoryId categoryName viewItemURL location sheepingType shipToLocations isMultiVariatio~
    #>    <chr>  <chr>      <dbl> <chr>        <chr>       <chr>    <chr>        <chr>           <lgl>           
    #>  1 19237~ Micr~     139971 Video Game ~ http://www~ USA      Free         Worldwide       FALSE           
    #>  2 33204~ Sony~     139971 Video Game ~ http://www~ Forest ~ Free         Worldwide       FALSE           
    #>  3 17303~ Nint~     139971 Video Game ~ http://www~ Grovepo~ Flat         Worldwide       FALSE           
    #>  4 18289~ Sony~     139971 Video Game ~ http://www~ Burbank~ Free         Worldwide       FALSE           
    #>  5 20213~ RETR~     139971 Video Game ~ http://www~ Bensale~ Free         Worldwide       FALSE           
    #>  6 12286~ Micr~     139971 Video Game ~ http://www~ USA      Flat         Worldwide       FALSE           
    #>  7 31198~ Sony~     139971 Video Game ~ http://www~ USA      Free         Worldwide       FALSE           
    #>  8 32279~ Supe~     139971 Video Game ~ http://www~ Dearbor~ Free         Worldwide       FALSE           
    #>  9 29235~ Micr~     139971 Video Game ~ http://www~ Atlanta~ Free         Worldwide       FALSE           
    #> 10 29233~ Play~     139971 Video Game ~ http://www~ USA      Free         Worldwide       FALSE           
    #> # ... with 8 more variables: conditionId <dbl>, conditionName <chr>, listingType <chr>, startTime <date>,
    #> #   endTime <date>, watchCount <dbl>, price <dbl>, currency <chr>

Search by both keywords and category:

``` r
search_ebay("Yahtzee", categoryName = c("Nonfiction", "Board & Traditional Games"))
```

    #> # A tibble: 10 x 17
    #>    itemId title categoryId categoryName viewItemURL location sheepingType shipToLocations isMultiVariatio~
    #>    <chr>  <chr>      <dbl> <chr>        <chr>       <chr>    <chr>        <chr>           <lgl>           
    #>  1 20162~ 250 ~     180349 Contemporar~ http://www~ Wellsto~ Free         Worldwide       FALSE           
    #>  2 20186~ " SA~     180349 Contemporar~ http://www~ Wellsto~ Flat         Worldwide       FALSE           
    #>  3 32185~ Yaht~     180349 Contemporar~ http://www~ USA      Free         Worldwide       FALSE           
    #>  4 20191~ LOWE~     180349 Contemporar~ http://www~ Wellsto~ Free         Worldwide       FALSE           
    #>  5 22238~ Yaht~     180349 Contemporar~ http://www~ Pasaden~ Free         Worldwide       FALSE           
    #>  6 16246~ Back~     180349 Contemporar~ http://www~ Hazleto~ Free         Worldwide       FALSE           
    #>  7 28277~ New ~     180349 Contemporar~ http://www~ North L~ Free         Worldwide       FALSE           
    #>  8 32265~ Yaht~     180349 Contemporar~ http://www~ USA      Free         Worldwide       FALSE           
    #>  9 32292~ Yaht~     180349 Contemporar~ http://www~ USA      Free         Worldwide       FALSE           
    #> 10 20176~ 50 T~     180349 Contemporar~ http://www~ Wellsto~ Free         Worldwide       FALSE           
    #> # ... with 8 more variables: conditionId <dbl>, conditionName <chr>, listingType <chr>, startTime <date>,
    #> #   endTime <date>, watchCount <dbl>, price <dbl>, currency <chr>

Search the UK site for new large size Fruit of the Loom women’s T-shirts
from top rated sellers at a max price of 10 pounds:

``` r
res <- search_ebay("women's t-shirts",
                   site = "UK",
                   condition = "New",
                   listingType = "FixedPrice",
                   topRatedSellerOnly = TRUE,
                   priceRange = c(0, 10),
                   aspectFilter = list(
                     Brand = "Fruit of the Loom",
                     Size = "L"
                     )
                   )

res[, c("title", "price", "currency")]
```

    #> # A tibble: 10 x 3
    #>    title                                                                              price currency
    #>    <chr>                                                                              <dbl> <chr>   
    #>  1 Mens Ladies Womens Novelty Print TShirt Funny Tee Rude Joke Xmas Top Gift Unisex    4.99 GBP     
    #>  2 WOMEN'S LADIES CUSTOM PRINTED PERSONALISED T-SHIRTS TEE SHIRT HEN WORK WHOLESALE    3.5  GBP     
    #>  3 LADIES 100% COTTON T-SHIRT - FRUIT of the LOOM PLAIN T SHIRT Womens Female          2.99 GBP     
    #>  4 Fruit of the Loom 100% Cotton Plain Blank Men's Women's Tee Shirt Tshirt T-Shirt    3.25 GBP     
    #>  5 Men's Women's Fruit of the Loom Plain 100% Cotton Blank Tee Shirt Tshirt T-Shirt    2.95 GBP     
    #>  6 DANGEROUS WOMAN MUSIC TOUR ARIANA GRANDE FAN TUMBLR FASHION MENS WOMENS TSHIRT      9.99 GBP     
    #>  7 Fruit of the Loom Long Sleeve 100% Cotton Plain Blank Men's Women's Tee Shirt's     4.08 GBP     
    #>  8 madness t-shirt retro style men's women's sizes                                     6    GBP     
    #>  9 Fruit of the Loom 100% Cotton Plain Blank Men's Women's T-Shirts Value Weight       3.57 GBP     
    #> 10 "VOGUE HIPSTER SWAG DOPE CELFIE GIFT TUMBLR FASHION FUNNY MENS WOMENS TOP TSHIRT "  8.99 GBP

Search the German site for black women’s handbags, ask for the 200 most
expensive results:

``` r
res <- search_ebay("Damentaschen",
                   site = "DE",
                   sortOrder = "PricePlusShippingHighest",
                   nResults = 200,
                   aspectFilter = list(
                     Farbe = "Schwarz"
                     )
                   )

res[, c("title", "price", "currency")]
```

    #> # A tibble: 200 x 3
    #>    title                                                                            price currency
    #>    <chr>                                                                            <dbl> <chr>   
    #>  1 Hermes Kelly Bag 35 M-Stamp aus Krokodil Leder - schwarz *NEUWERTIG*             44900 EUR     
    #>  2 HERMES KELLY ALLIGATOR BAG 28 GRAPHITE SCHWARZ BLACK CROCODILE                   26990 EUR     
    #>  3 Hermes Kelly Bag 32 X-Stamp aus Eidechsenleder in schwarz *NEUWERTIG*            24900 EUR     
    #>  4 Hermes Birkin Bag In PLOMB , Birkin Tasche, 40 Cm, Togo, Palladium Hardware 2016 21500 EUR     
    #>  5 Hermes Kelly Bag 28 cm Kroko                                                     14000 EUR     
    #>  6 Hermes Kelly II Togo Schwarz GHW Retourne original Tasche Togo Leder Bag Noir    12500 EUR     
    #>  7 Hermès Birkin 35 Veau Togo schwarz - NEU, OVP mit Rechnung 11.2017               11900 EUR     
    #>  8 HERMES Birkin Bag 40, schwarz, Hardware Palladium, NEU mit Box und Rechnung      11800 EUR     
    #>  9 Original Hermès Kelly Sellier 32 Bag Tasche NEU OVP & Rechnung schwarz + Zubehör 11800 EUR     
    #> 10 Hermes Constance  aus Leder und Wildleder in Cognac *NEU*                        10990 EUR     
    #> # ... with 190 more rows

The possibilities are endless, though ebay APIs have even more.

You should probably read ebay’s [API
Reference](https://developer.ebay.com/Devzone/finding/Concepts/FindingAPIGuide.html)
and [API license](https://go.developer.ebay.com/api-license-agreement)
and make sure you adhere to the rules.

Also note that the rate limit of the API wrapped here is 5,000 requests
a day, each request can bring up to 100 results (ebay items).

For more possibilities see the `search_ebay` function documentation, and
read
[this](http://giorasimchoni.com/2017/12/19/2017-12-19-e-is-for-elephant-the-ebayr-package/)
blog post.
