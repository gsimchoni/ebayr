<!-- README.md is generated from README.Rmd. Please edit that file -->
ebayr - R wrapper to the ebay Finding API
=========================================

This package allows you to search ebay for **live** items using keywords, a category or both. It is a wrapper for the ebay Finding API, specifically the "findItemsAdvanced" call. You can use it after you sign up at <https://go.developer.ebay.com/> and get a valid token (a.k.a AppID).

Install:

``` r
devtools::install_github("gsimchoni/ebayr")
```

Load:

``` r
library(ebayr)
#> Welcome to the R wrapper to the ebay Finding API.
#> I see you don't have a token for this API (environment variable 'EBAY_TOK').
#> Please get one at https://go.developer.ebay.com/ and set it using setEbayToken(YOUR_TOKEN).
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
    #>          itemId                                                                            title categoryId
    #>           <chr>                                                                            <chr>      <dbl>
    #>  1 361600561711                                               Elvis Presley / Adult Male Costume      52762
    #>  2 222757368483                                                          ELVIS STYLE   TOUR BELT      52762
    #>  3 263200865065                          Adults Licensed Deluxe Gold Satin Elvis Presley Costume      52762
    #>  4 122657226058        Rubies Adult Elvis Presley Impersonator Costume Cape-One Size-Made in USA      52762
    #>  5 132438178557                     Elvis jumpsuit belt (professional) goes with most anything!       52762
    #>  6 282766777028                                            ELVIS STYLE MATT BLACK PUFFY SHIRT XL      52762
    #>  7 282269304226                                                 Elvis Child's Costume, Large New      80913
    #>  8 282766792358                                     ELVIS STYLE 50's SHIRT BLACK & WHITE - LARGE      52762
    #>  9 352211151488           Elvis Eagle White Cape Licensed King Of Rock Vegas Halloween Accessory      52762
    #> 10 222677654896 Elvis Costume 70's Style 3 Pc Wht Jumpsuit W/ Gld Sequin Trim Belt & Satin Scarf      52762
    #> # ... with 14 more variables: categoryName <chr>, viewItemURL <chr>, location <chr>, sheepingType <chr>,
    #> #   shipToLocations <chr>, isMultiVariationListing <lgl>, conditionId <dbl>, conditionName <chr>,
    #> #   listingType <chr>, startTime <date>, endTime <date>, watchCount <dbl>, price <dbl>, currency <chr>

Search by category (a.k.a Browse):

``` r
search_ebay(categoryName = "Video Game Consoles")
```

    #> # A tibble: 10 x 17
    #>          itemId                                                                            title categoryId
    #>           <chr>                                                                            <chr>      <dbl>
    #>  1 192378276474 Microsoft - Xbox One S 500GB Madden NFL 18 Bundle with 4K Ultra HD Blu-ray - ...     139971
    #>  2 332044790216                 Sony Playstation PS Vita - New Slim Model - PCH-2006 (Aqua Blue)     139971
    #>  3 173037034786                                        Nintendo Switch Console with Gray Joy-Con     139971
    #>  4 182891810676    Sony Playstation Vita - PS Vita - New Slim Model - PCH-2006 (Aqua Blue) NEW!!     139971
    #>  5 202138426458               RETRO NES Nintendo MINI CONSOLE 620 Games  FAST SHIPPING FROM USA!     139971
    #>  6 122865047812    Microsoft Xbox One X Project Scorpio Edition - 1TB - Black Console - SOLD OUT     139971
    #>  7 311983051175                             Sony PlayStation 4 Pro 1TB Console PS4 Pro Brand NEW     139971
    #>  8 322795045685  Super Nintendo Entertainment System SNES Classic Edition Mini IN HAND SHIPS NOW     139971
    #>  9 292352820223                 Microsoft Xbox One S Minecraft Complete Adventure Bundle (500GB)     139971
    #> 10 292331271596                 PlayStation 4 Slim 1TB Console - Star Wars Battlefront II Bundle     139971
    #> # ... with 14 more variables: categoryName <chr>, viewItemURL <chr>, location <chr>, sheepingType <chr>,
    #> #   shipToLocations <chr>, isMultiVariationListing <lgl>, conditionId <dbl>, conditionName <chr>,
    #> #   listingType <chr>, startTime <date>, endTime <date>, watchCount <dbl>, price <dbl>, currency <chr>

Search by both keywords and category:

``` r
search_ebay("Yahtzee", categoryName = c("Nonfiction", "Board & Traditional Games"))
```

    #> # A tibble: 10 x 17
    #>          itemId                                                                         title categoryId
    #>           <chr>                                                                         <chr>      <dbl>
    #>  1 201620664639                                    250 Triple Yahtzee Score Sheets Pads Cards     180349
    #>  2 201861869361                        SALE!!!! YAHTZEE SCORE PADS CARDS  600 SHEETS YAHTZEE      180349
    #>  3 321852161038                                                               Yahtzee Classic     180349
    #>  4 201915780340           LOWEST PRICE!!!! YAHTZEE SCORE PADS CARDS  2000 SHEETS YAHTZEE GAME     180349
    #>  5 222388708716                                                    Yahtzee Classic Board Game     180349
    #>  6 162465852979                         Back to the Future Yahtzee Dice Game UPC 700304046840     180349
    #>  7 282775230522 New - Yahtzee Steal the Deal Dice Game by Hasbro Gaming Ages 8+ (2-5 players)     180349
    #>  8 322654819049                                                                       Yahtzee     180349
    #>  9 322923844346                                                            Yahtzee Electronic     180349
    #> 10 201761399117                                          50 Triple Yahtzee Score Sheets Cards     180349
    #> # ... with 14 more variables: categoryName <chr>, viewItemURL <chr>, location <chr>, sheepingType <chr>,
    #> #   shipToLocations <chr>, isMultiVariationListing <lgl>, conditionId <dbl>, conditionName <chr>,
    #> #   listingType <chr>, startTime <date>, endTime <date>, watchCount <dbl>, price <dbl>, currency <chr>

Search the UK site for new large size Fruit of the Loom women's T-shirts from top rated sellers at a max price of 10 pounds:

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
    #>                                                                               title price currency
    #>                                                                               <chr> <dbl>    <chr>
    #>  1 Mens Ladies Womens Novelty Print TShirt Funny Tee Rude Joke Xmas Top Gift Unisex  4.99      GBP
    #>  2 WOMEN'S LADIES CUSTOM PRINTED PERSONALISED T-SHIRTS TEE SHIRT HEN WORK WHOLESALE  3.50      GBP
    #>  3       LADIES 100% COTTON T-SHIRT - FRUIT of the LOOM PLAIN T SHIRT Womens Female  2.99      GBP
    #>  4 Fruit of the Loom 100% Cotton Plain Blank Men's Women's Tee Shirt Tshirt T-Shirt  3.25      GBP
    #>  5 Men's Women's Fruit of the Loom Plain 100% Cotton Blank Tee Shirt Tshirt T-Shirt  2.95      GBP
    #>  6   DANGEROUS WOMAN MUSIC TOUR ARIANA GRANDE FAN TUMBLR FASHION MENS WOMENS TSHIRT  9.99      GBP
    #>  7  Fruit of the Loom Long Sleeve 100% Cotton Plain Blank Men's Women's Tee Shirt's  4.08      GBP
    #>  8                                  madness t-shirt retro style men's women's sizes  6.00      GBP
    #>  9    Fruit of the Loom 100% Cotton Plain Blank Men's Women's T-Shirts Value Weight  3.57      GBP
    #> 10 VOGUE HIPSTER SWAG DOPE CELFIE GIFT TUMBLR FASHION FUNNY MENS WOMENS TOP TSHIRT   8.99      GBP

Search the German site for black women's handbags, ask for the 200 most expensive results:

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
    #>                                                                               title price currency
    #>                                                                               <chr> <dbl>    <chr>
    #>  1             Hermes Kelly Bag 35 M-Stamp aus Krokodil Leder - schwarz *NEUWERTIG* 44900      EUR
    #>  2                   HERMES KELLY ALLIGATOR BAG 28 GRAPHITE SCHWARZ BLACK CROCODILE 26990      EUR
    #>  3            Hermes Kelly Bag 32 X-Stamp aus Eidechsenleder in schwarz *NEUWERTIG* 24900      EUR
    #>  4 Hermes Birkin Bag In PLOMB , Birkin Tasche, 40 Cm, Togo, Palladium Hardware 2016 21500      EUR
    #>  5                                                     Hermes Kelly Bag 28 cm Kroko 14000      EUR
    #>  6    Hermes Kelly II Togo Schwarz GHW Retourne original Tasche Togo Leder Bag Noir 12500      EUR
    #>  7               Hermès Birkin 35 Veau Togo schwarz - NEU, OVP mit Rechnung 11.2017 11900      EUR
    #>  8      HERMES Birkin Bag 40, schwarz, Hardware Palladium, NEU mit Box und Rechnung 11800      EUR
    #>  9 Original Hermès Kelly Sellier 32 Bag Tasche NEU OVP & Rechnung schwarz + Zubehör 11800      EUR
    #> 10                        Hermes Constance  aus Leder und Wildleder in Cognac *NEU* 10990      EUR
    #> # ... with 190 more rows

The possibilities are endless, though ebay APIs have even more.

You should probably read ebay's [API Reference](https://developer.ebay.com/Devzone/finding/Concepts/FindingAPIGuide.html) and [API license](https://go.developer.ebay.com/api-license-agreement) and make sure you adhere to the rules.

Also note that the rate limit of the API wrapped here is 5,000 requests a day, each request can bring up to 100 results (ebay items).

For more possibilities see the `search_ebay` function documentation, and read [this](TODO) blog post.
