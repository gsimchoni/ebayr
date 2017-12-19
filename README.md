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
```

Set ebay token:

``` r
setEbayToken("YOUR_EBAY_TOKEN")
```

Search by keywords:

``` r
search_ebay("elvis costume")
```

    #>          itemId
    #> 1  361600561711
    #> 2  222757368483
    #> 3  263200865065
    #> 4  122657226058
    #> 5  132438178557
    #> 6  282766777028
    #> 7  282269304226
    #> 8  282766792358
    #> 9  352211151488
    #> 10 222677654896
    #>                                                                               title
    #> 1                                                Elvis Presley / Adult Male Costume
    #> 2                                                           ELVIS STYLE   TOUR BELT
    #> 3                           Adults Licensed Deluxe Gold Satin Elvis Presley Costume
    #> 4         Rubies Adult Elvis Presley Impersonator Costume Cape-One Size-Made in USA
    #> 5                      Elvis jumpsuit belt (professional) goes with most anything! 
    #> 6                                             ELVIS STYLE MATT BLACK PUFFY SHIRT XL
    #> 7                                                  Elvis Child's Costume, Large New
    #> 8                                      ELVIS STYLE 50's SHIRT BLACK & WHITE - LARGE
    #> 9            Elvis Eagle White Cape Licensed King Of Rock Vegas Halloween Accessory
    #> 10 Elvis Costume 70's Style 3 Pc Wht Jumpsuit W/ Gld Sequin Trim Belt & Satin Scarf
    #>    categoryId categoryName
    #> 1       52762          Men
    #> 2       52762          Men
    #> 3       52762          Men
    #> 4       52762          Men
    #> 5       52762          Men
    #> 6       52762          Men
    #> 7       80913         Boys
    #> 8       52762          Men
    #> 9       52762          Men
    #> 10      52762          Men
    #>                                                                                                           viewItemURL
    #> 1                                         http://www.ebay.com/itm/Elvis-Presley-Adult-Male-Costume-/361600561711?var=
    #> 2                                                         http://www.ebay.com/itm/ELVIS-STYLE-TOUR-BELT-/222757368483
    #> 3                  http://www.ebay.com/itm/Adults-Licensed-Deluxe-Gold-Satin-Elvis-Presley-Costume-/263200865065?var=
    #> 4        http://www.ebay.com/itm/Rubies-Adult-Elvis-Presley-Impersonator-Costume-Cape-One-Size-Made-USA-/122657226058
    #> 5                           http://www.ebay.com/itm/Elvis-jumpsuit-belt-professional-goes-most-anything-/132438178557
    #> 6                                         http://www.ebay.com/itm/ELVIS-STYLE-MATT-BLACK-PUFFY-SHIRT-XL-/282766777028
    #> 7                                                http://www.ebay.com/itm/Elvis-Childs-Costume-Large-New-/282269304226
    #> 8                                       http://www.ebay.com/itm/ELVIS-STYLE-50s-SHIRT-BLACK-WHITE-LARGE-/282766792358
    #> 9           http://www.ebay.com/itm/Elvis-Eagle-White-Cape-Licensed-King-Rock-Vegas-Halloween-Accessory-/352211151488
    #> 10 http://www.ebay.com/itm/Elvis-Costume-70s-Style-3-Pc-Wht-Jumpsuit-W-Gld-Sequin-Trim-Belt-Satin-Scarf-/222677654896
    #>                location sheepingType shipToLocations
    #> 1  Traverse City,MI,USA         Free       Worldwide
    #> 2     Barrington,RI,USA   Calculated       Worldwide
    #> 3      Tonawanda,NY,USA         Free       Worldwide
    #> 4                   USA         Free       Worldwide
    #> 5       Florence,AL,USA         Flat       Worldwide
    #> 6      Las Vegas,NV,USA         Free       Worldwide
    #> 7        Chicago,IL,USA         Free       Worldwide
    #> 8      Las Vegas,NV,USA         Free       Worldwide
    #> 9    Bakersfield,CA,USA         Free       Worldwide
    #> 10      Clarence,NY,USA   Calculated       Worldwide
    #>    isMultiVariationListing conditionId conditionName    listingType
    #> 1                     TRUE        1000 New with tags StoreInventory
    #> 2                    FALSE        3000     Pre-owned        Auction
    #> 3                     TRUE        1000 New with tags     FixedPrice
    #> 4                    FALSE        1000 New with tags     FixedPrice
    #> 5                    FALSE        3000     Pre-owned        Auction
    #> 6                    FALSE        3000     Pre-owned     FixedPrice
    #> 7                    FALSE        1000 New with tags     FixedPrice
    #> 8                    FALSE        3000     Pre-owned     FixedPrice
    #> 9                    FALSE        1000 New with tags     FixedPrice
    #> 10                   FALSE        3000     Pre-owned StoreInventory
    #>     startTime    endTime watchCount  price currency
    #> 1  2016-06-17 2018-01-08         14  39.99      USD
    #> 2  2017-12-15 2017-12-22          6  25.00      USD
    #> 3  2017-09-11 2018-01-09          2  41.98      USD
    #> 4  2017-08-19 2018-01-16         17  24.50      USD
    #> 5  2017-12-18 2017-12-25          3 125.00      USD
    #> 6  2017-12-10 2018-01-09          1  50.00      USD
    #> 7  2016-11-26 2017-12-21          5  19.78      USD
    #> 8  2017-12-10 2018-01-09          1  40.00      USD
    #> 9  2017-11-16 2018-01-15          3  19.40      USD
    #> 10 2017-10-13 2018-01-11          9 199.98      USD

Search by category (a.k.a Browse):

``` r
search_ebay(categoryName = "Video Game Consoles")
```

    #>          itemId
    #> 1  192378276474
    #> 2  332044790216
    #> 3  173037034786
    #> 4  182891810676
    #> 5  202138426458
    #> 6  122865047812
    #> 7  311983051175
    #> 8  322795045685
    #> 9  292352820223
    #> 10 292331271596
    #>                                                                               title
    #> 1  Microsoft - Xbox One S 500GB Madden NFL 18 Bundle with 4K Ultra HD Blu-ray - ...
    #> 2                  Sony Playstation PS Vita - New Slim Model - PCH-2006 (Aqua Blue)
    #> 3                                         Nintendo Switch Console with Gray Joy-Con
    #> 4     Sony Playstation Vita - PS Vita - New Slim Model - PCH-2006 (Aqua Blue) NEW!!
    #> 5                RETRO NES Nintendo MINI CONSOLE 620 Games  FAST SHIPPING FROM USA!
    #> 6     Microsoft Xbox One X Project Scorpio Edition - 1TB - Black Console - SOLD OUT
    #> 7                              Sony PlayStation 4 Pro 1TB Console PS4 Pro Brand NEW
    #> 8   Super Nintendo Entertainment System SNES Classic Edition Mini IN HAND SHIPS NOW
    #> 9                  Microsoft Xbox One S Minecraft Complete Adventure Bundle (500GB)
    #> 10                 PlayStation 4 Slim 1TB Console - Star Wars Battlefront II Bundle
    #>    categoryId        categoryName
    #> 1      139971 Video Game Consoles
    #> 2      139971 Video Game Consoles
    #> 3      139971 Video Game Consoles
    #> 4      139971 Video Game Consoles
    #> 5      139971 Video Game Consoles
    #> 6      139971 Video Game Consoles
    #> 7      139971 Video Game Consoles
    #> 8      139971 Video Game Consoles
    #> 9      139971 Video Game Consoles
    #> 10     139971 Video Game Consoles
    #>                                                                                                           viewItemURL
    #> 1           http://www.ebay.com/itm/Microsoft-Xbox-One-S-500GB-Madden-NFL-18-Bundle-4K-Ultra-HD-Blu-ray-/192378276474
    #> 2                    http://www.ebay.com/itm/Sony-Playstation-PS-Vita-New-Slim-Model-PCH-2006-Aqua-Blue-/332044790216
    #> 3                                          http://www.ebay.com/itm/Nintendo-Switch-Console-Gray-Joy-Con-/173037034786
    #> 4           http://www.ebay.com/itm/Sony-Playstation-Vita-PS-Vita-New-Slim-Model-PCH-2006-Aqua-Blue-NEW-/182891810676
    #> 5                   http://www.ebay.com/itm/RETRO-NES-Nintendo-MINI-CONSOLE-620-Games-FAST-SHIPPING-USA-/202138426458
    #> 6       http://www.ebay.com/itm/Microsoft-Xbox-One-X-Project-Scorpio-Edition-1TB-Black-Console-SOLD-OUT-/122865047812
    #> 7                          http://www.ebay.com/itm/Sony-PlayStation-4-Pro-1TB-Console-PS4-Pro-Brand-NEW-/311983051175
    #> 8  http://www.ebay.com/itm/Super-Nintendo-Entertainment-System-SNES-Classic-Edition-Mini-HAND-SHIPS-NOW-/322795045685
    #> 9                http://www.ebay.com/itm/Microsoft-Xbox-One-S-Minecraft-Complete-Adventure-Bundle-500GB-/292352820223
    #> 10               http://www.ebay.com/itm/PlayStation-4-Slim-1TB-Console-Star-Wars-Battlefront-II-Bundle-/292331271596
    #>               location sheepingType shipToLocations
    #> 1                  USA         Free       Worldwide
    #> 2  Forest Hills,NY,USA         Free       Worldwide
    #> 3     Groveport,OH,USA         Flat       Worldwide
    #> 4       Burbank,CA,USA         Free       Worldwide
    #> 5      Bensalem,PA,USA         Free       Worldwide
    #> 6                  USA         Flat       Worldwide
    #> 7                  USA         Free       Worldwide
    #> 8      Dearborn,MI,USA         Free       Worldwide
    #> 9       Atlanta,GA,USA         Free       Worldwide
    #> 10                 USA         Free       Worldwide
    #>    isMultiVariationListing conditionId conditionName    listingType
    #> 1                    FALSE        1000           New     FixedPrice
    #> 2                    FALSE        1000           New StoreInventory
    #> 3                    FALSE        1000           New     FixedPrice
    #> 4                    FALSE        1000           New StoreInventory
    #> 5                    FALSE        1000           New StoreInventory
    #> 6                    FALSE        1000           New StoreInventory
    #> 7                    FALSE        1000           New StoreInventory
    #> 8                    FALSE        1000           New StoreInventory
    #> 9                    FALSE        1000           New     FixedPrice
    #> 10                   FALSE        1000           New     FixedPrice
    #>     startTime    endTime watchCount  price currency
    #> 1  2017-11-27 2017-12-27        572 199.99      USD
    #> 2  2016-11-26 2017-12-21        657 198.99      USD
    #> 3  2017-12-17 2018-01-16        141 299.99      USD
    #> 4  2017-11-10 2018-01-09        106 198.79      USD
    #> 5  2017-12-06 2018-01-05        669 159.99      USD
    #> 6  2017-12-16 2017-12-26         23 575.00      USD
    #> 7  2017-10-18 2018-01-16        920 384.99      USD
    #> 8  2017-09-30 2017-12-29        745 179.95      USD
    #> 9  2017-12-01 2017-12-31        950 229.00      USD
    #> 10 2017-11-15 2018-01-14        464 249.99      USD

Search by both keywords and category:

``` r
search_ebay("Yahtzee", categoryName = c("Nonfiction", "Board & Traditional Games"))
```

    #>          itemId
    #> 1  201620664639
    #> 2  201861869361
    #> 3  321852161038
    #> 4  201915780340
    #> 5  222388708716
    #> 6  162465852979
    #> 7  282775230522
    #> 8  322654819049
    #> 9  322923844346
    #> 10 201761399117
    #>                                                                            title
    #> 1                                     250 Triple Yahtzee Score Sheets Pads Cards
    #> 2                         SALE!!!! YAHTZEE SCORE PADS CARDS  600 SHEETS YAHTZEE 
    #> 3                                                                Yahtzee Classic
    #> 4            LOWEST PRICE!!!! YAHTZEE SCORE PADS CARDS  2000 SHEETS YAHTZEE GAME
    #> 5                                                     Yahtzee Classic Board Game
    #> 6                          Back to the Future Yahtzee Dice Game UPC 700304046840
    #> 7  New - Yahtzee Steal the Deal Dice Game by Hasbro Gaming Ages 8+ (2-5 players)
    #> 8                                                                        Yahtzee
    #> 9                                                             Yahtzee Electronic
    #> 10                                          50 Triple Yahtzee Score Sheets Cards
    #>    categoryId             categoryName
    #> 1      180349 Contemporary Manufacture
    #> 2      180349 Contemporary Manufacture
    #> 3      180349 Contemporary Manufacture
    #> 4      180349 Contemporary Manufacture
    #> 5      180349 Contemporary Manufacture
    #> 6      180349 Contemporary Manufacture
    #> 7      180349 Contemporary Manufacture
    #> 8      180349 Contemporary Manufacture
    #> 9      180349 Contemporary Manufacture
    #> 10     180349 Contemporary Manufacture
    #>                                                                                                viewItemURL
    #> 1                         http://www.ebay.com/itm/250-Triple-Yahtzee-Score-Sheets-Pads-Cards-/201620664639
    #> 2                   http://www.ebay.com/itm/SALE-YAHTZEE-SCORE-PADS-CARDS-600-SHEETS-YAHTZEE-/201861869361
    #> 3                                                    http://www.ebay.com/itm/Yahtzee-Classic-/321852161038
    #> 4     http://www.ebay.com/itm/LOWEST-PRICE-YAHTZEE-SCORE-PADS-CARDS-2000-SHEETS-YAHTZEE-GAME-/201915780340
    #> 5                                         http://www.ebay.com/itm/Yahtzee-Classic-Board-Game-/222388708716
    #> 6                     http://www.ebay.com/itm/Back-Future-Yahtzee-Dice-Game-UPC-700304046840-/162465852979
    #> 7  http://www.ebay.com/itm/New-Yahtzee-Steal-Deal-Dice-Game-Hasbro-Gaming-Ages-8-2-5-players-/282775230522
    #> 8                                                            http://www.ebay.com/itm/Yahtzee-/322654819049
    #> 9                                                 http://www.ebay.com/itm/Yahtzee-Electronic-/322923844346
    #> 10                              http://www.ebay.com/itm/50-Triple-Yahtzee-Score-Sheets-Cards-/201761399117
    #>                  location sheepingType shipToLocations
    #> 1         Wellston,MI,USA         Free       Worldwide
    #> 2         Wellston,MI,USA         Flat       Worldwide
    #> 3                     USA         Free       Worldwide
    #> 4         Wellston,MI,USA         Free       Worldwide
    #> 5         Pasadena,CA,USA         Free       Worldwide
    #> 6         Hazleton,PA,USA         Free       Worldwide
    #> 7  North Las Vegas,NV,USA         Free       Worldwide
    #> 8                     USA         Free       Worldwide
    #> 9                     USA         Free       Worldwide
    #> 10        Wellston,MI,USA         Free       Worldwide
    #>    isMultiVariationListing conditionId conditionName    listingType
    #> 1                    FALSE        1000           New StoreInventory
    #> 2                    FALSE        1000           New StoreInventory
    #> 3                    FALSE        1000           New     FixedPrice
    #> 4                    FALSE        1000           New StoreInventory
    #> 5                    FALSE        1000           New     FixedPrice
    #> 6                    FALSE        1000           New     FixedPrice
    #> 7                    FALSE        1000           New     FixedPrice
    #> 8                    FALSE        1000           New     FixedPrice
    #> 9                    FALSE        1000           New     FixedPrice
    #> 10                   FALSE        1000           New StoreInventory
    #>     startTime    endTime watchCount price currency
    #> 1  2016-07-10 2018-01-01         55 17.95      USD
    #> 2  2017-03-21 2018-01-15        104  3.75      USD
    #> 3  2015-09-02 2017-12-20         22  7.99      USD
    #> 4  2017-05-04 2017-12-30         43 24.95      USD
    #> 5  2017-01-25 2017-12-21         46 11.92      USD
    #> 6  2017-04-09 2018-01-04         26 15.99      USD
    #> 7  2017-12-16 2018-01-15          1  9.95      USD
    #> 8  2017-08-15 2018-01-12          3  7.49      USD
    #> 9  2017-12-05 2018-01-04          1  9.99      USD
    #> 10 2016-12-25 2017-12-20         25  5.25      USD

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

    #>                                                                               title
    #> 1  Mens Ladies Womens Novelty Print TShirt Funny Tee Rude Joke Xmas Top Gift Unisex
    #> 2  WOMEN'S LADIES CUSTOM PRINTED PERSONALISED T-SHIRTS TEE SHIRT HEN WORK WHOLESALE
    #> 3        LADIES 100% COTTON T-SHIRT - FRUIT of the LOOM PLAIN T SHIRT Womens Female
    #> 4  Fruit of the Loom 100% Cotton Plain Blank Men's Women's Tee Shirt Tshirt T-Shirt
    #> 5  Men's Women's Fruit of the Loom Plain 100% Cotton Blank Tee Shirt Tshirt T-Shirt
    #> 6    DANGEROUS WOMAN MUSIC TOUR ARIANA GRANDE FAN TUMBLR FASHION MENS WOMENS TSHIRT
    #> 7   Fruit of the Loom Long Sleeve 100% Cotton Plain Blank Men's Women's Tee Shirt's
    #> 8                                   madness t-shirt retro style men's women's sizes
    #> 9     Fruit of the Loom 100% Cotton Plain Blank Men's Women's T-Shirts Value Weight
    #> 10 VOGUE HIPSTER SWAG DOPE CELFIE GIFT TUMBLR FASHION FUNNY MENS WOMENS TOP TSHIRT 
    #>    price currency
    #> 1   4.99      GBP
    #> 2   3.50      GBP
    #> 3   2.99      GBP
    #> 4   3.25      GBP
    #> 5   2.95      GBP
    #> 6   9.99      GBP
    #> 7   4.08      GBP
    #> 8   6.00      GBP
    #> 9   3.57      GBP
    #> 10  8.99      GBP

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

    #>                                                                                                                                                         title
    #> 1                                                                                        Hermes Kelly Bag 35 M-Stamp aus Krokodil Leder - schwarz *NEUWERTIG*
    #> 2                                                                                              HERMES KELLY ALLIGATOR BAG 28 GRAPHITE SCHWARZ BLACK CROCODILE
    #> 3                                                                                       Hermes Kelly Bag 32 X-Stamp aus Eidechsenleder in schwarz *NEUWERTIG*
    #> 4                                                                            Hermes Birkin Bag In PLOMB , Birkin Tasche, 40 Cm, Togo, Palladium Hardware 2016
    #> 5                                                                                                                                Hermes Kelly Bag 28 cm Kroko
    #> 6                                                                               Hermes Kelly II Togo Schwarz GHW Retourne original Tasche Togo Leder Bag Noir
    #> 7                                                                                          Hermès Birkin 35 Veau Togo schwarz - NEU, OVP mit Rechnung 11.2017
    #> 8                                                                                 HERMES Birkin Bag 40, schwarz, Hardware Palladium, NEU mit Box und Rechnung
    #> 9                                                                            Original Hermès Kelly Sellier 32 Bag Tasche NEU OVP & Rechnung schwarz + Zubehör
    #> 10                                                                                                  Hermes Constance  aus Leder und Wildleder in Cognac *NEU*
    #> 11                                                                                HERMÈS Handtasche Schwarz Damen Tasche Birkin Bag 35 Henkeltasche Sac Purse
    #> 12                                                                             HERMÈS Handtasche Schwarz Damen Tasche HAC 40 Henkeltasche Tragetasche Bag Sac
    #> 13                                                                              HERMÈS Handtasche Schwarz Damen Tasche Birkin Bag 35 Leather Tragetasche Cuir
    #> 14                                                                                       HERMÈS Handtasche Schwarz Damen Birkin 40 Bag Sac Tote Leder Leather
    #> 15                                                                              Original Hermes Tasche Birkin Bag 35 Graphite Grau Braun Togo Leder Palladium
    #> 16                                                                                            Hermes Birkin Bag 40 Schwarz Togo Leder mit Goldenen Beschlägen
    #> 17                                                                                 Handtaschen Salvatore Ferragamo sofia Damen - Leder Krokodil (21A99005656)
    #> 18                                                                                 HERMÈS Handtasche Schwarz Damen Birkin Bag 35 Sac Leder Tote Leather Black
    #> 19                                                                       HERMES Birkin Bag 40 Ardennes Schwarz Black Noir Tasche <U+25A1>A Dustbag GOLD SUPER
    #> 20                                                                                                               CHANEL  Schwarz Gepacktasche Clutch Mini Bag
    #> 21                                                                            HERMÈS Handtasche *Birkin Bag*- schwarzes Leder - Staubbeutel - ca. 34x18x25 cm
    #> 22                                                                           BULGARI Hand-/Schultertasche Krokodilleder, NEU&ORIGINAL inkl.Originalrechnung !
    #> 23                                                                           Hermés *Sac Mallette* Handtasche Kroko schwarz mit Schmuck-Abteil Vintage 1950er
    #> 24                                                                                                            Hermes Kroko Handtasche, in schwarz, unbenutzt.
    #> 25                                                                             HERMÈS Handtasche Schwarz Damen Tasche Birkin Bag 30 Tragetasche Leather Leder
    #> 26                                                                                                        Original HERMES Kelly Sellier 32 Black Schwarz Box 
    #> 27                                                                                  original Hermès Birkin 35 in Schwarz mit Palladium Hardware  Top Zustand 
    #> 28                                                                             Sehr seltene Orig. GUCCI Doctorbag Lim.Edtition Tom Ford*Straußenleder*Schwarz
    #> 29                                                                                 Original Hermès JPG Birkin Bag Schwarz, mit Box, goldene HW, Wunderschön ,
    #> 30                                                                             Original CHANEL BOY Bag Old Medium, Kalbsleder Tasche schwarz black, NEU + OVP
    #> 31                                                                           Original Hermes Tasche "Kelly Bag" 28 cm, schwarzes Kalbsleder, goldene Hardware
    #> 32                                                                             limited Chanel Tasche aus Leder/Stoff Camélia NP 9.500 <U+0080> schwarz 255 bag flap 
    #> 33                                                                            DELVAUX Tempête PM - Croco Noir Vernis - VINTAGE - Authentique - Excellent état
    #> 34                                                                                                          CHANEL BAG -- CLASSIC 255 FLAP MADEMOISELLE BLACK
    #> 35                                                                                        HERMES ORIGINAL Kelly Bag Vintage schwarz Abendtasche große Rarität
    #> 36                                                                            CHANEL Handtasche-Double Flap Bag-2.55-Original 1A Zustand-mit Rechnung März 17
    #> 37                                                                            Hermes Constanze Tasche Box-Calf-Leather.  Vintage, neu aufbereitet bei Hermes,
    #> 38                                                                                 Hermès Handtasche Schwarz Damen Tasche Henkeltasche Birkin Bag Sac Leather
    #> 39                                                                                             Chanel Chevron Le Boy Bag Tasche Old Mediem Kalb Leder Schwarz
    #> 40                                                                                          CHANEL 2.55 Double Flap Bag Chevron Rechnung Vestiaire Collective
    #> 41                                                                                              Chanel Boy Tasche schwarz Gold Chevron Leder mit Rechnung NEU
    #> 42                                                                              CHANEL Abendtasche Schwarz Damen Tasche Rare Chanel Black Lucite Mini Handbag
    #> 43                                                                                                       Fendi Damen 8Bn290sr5f0kur Schwarz Leder Handtaschen
    #> 44                                                                           Original Chanel Jumbo Bag, schwarz, mit Original Rechnung 2017 u Box, ungetragen
    #> 45                                                                           Chanel Matelasse Double Flap Double Chain Bag A01112 Damen Kaviarleder  BF313333
    #> 46                                                                           Chanel Matelasse Double Flap Double Chain Bag A01112 Damen Kaviarleder  BF313095
    #> 47                                                                           Chanel Matelasse Double Flap Double Chain Bag A01112 Damen Kaviarleder  BF313094
    #> 48                                                                                          CHANEL KLASSIK DOUBLE FLAP JUMBO LAMMLEDER SCHWARZ GOLD HARDWARE 
    #> 49  100%Original HERMES PARIS <f0><U+009F><U+008E><U+0084>JYPSIERE 34 Black BIRKIN Timeless<f0><U+009F><U+008C><U+009F>TOP<f0><U+009F><U+008C><U+009F>NP7000<U+0080>
    #> 50                                                                           Original CHANEL Le Boy Bag Tasche, new medium, pearlblack CC, limitiert, schwarz
    #> 51                                                                                                            ORIGINAL Chanel "Boy Bag" in Schwarz  *WIE NEU*
    #> 52                                                                           Chanel Matelasse Double Flap Double Chain Bag A01112 Damen Kaviarleder  BF314006
    #> 53                                                                                 ORIGINAL CHANEL TASCHE 2.55 DOUBLE FLAP BAG MAXI  JUBILÄUM SPEZIAL EDITION
    #> 54                                                                           Chanel Matelasse Double Flap Double Chain Bag A01112 Damen Kaviarleder  BF314005
    #> 55                                                                                                Salvatore Ferragamo Damen 0666780 Schwarz Leder Handtaschen
    #> 56                                                                                                                  Lady Dior Studded - Brand New & Full Set 
    #> 57                                                                           Chanel Matelasse Double Flap Double Chain Bag A01112 Damen Kaviarleder  BF314058
    #> 58                                                                                                                                    Chanel Tasche *Rarität*
    #> 59                                                                                                       Chanel Medium Graffiti Logo Newspaper Print SO BLACK
    #> 60                                                                                             HERMÈS Tasche Plume 32 schwarz Leder black leather bag ID 4787
    #> 61                                                                                      CHANEL 100% ORIGINAL Boy Handtasche, Lammleder, Medium Size, schwarz.
    #> 62                                                                             Chanel Boy Bag Handtasche Neu OVP 2.55 Timeless Classic Tasche Edition schwarz
    #> 63                                                                                                        CHANEL Chanel Coco Cocoon Backpack Rucksack schwarz
    #> 64                                                                                       CHANEL,Maxi Classic Flap Bag,Damentasche,Tasche,Schwarz,KP 5420 Euro
    #> 65                                                                                                      CHANEL BAG -- GRAND SHOPPER LACKLEDER SCHWARZ GOLD HW
    #> 66                                                                                                                              CHANEL MAXI BAG , ORIGINAL!!!
    #> 67                                                                                                                 Louis Vuitton Case (NEU/Original verpackt)
    #> 68                                                                                                          New CHANEL Caviar Drawing Portfolio Bag - Leather
    #> 69                                                                            HERMÈS HERMES BOLIDE 27 Leder Crossbody Handtasche Bag Clémence Leather Schwarz
    #> 70                                                                                        LOUIS VUITTON TWIST MM Noir Chain Flower Epi NEU streng limitiert* 
    #> 71                                                                                Chanel Tasche 2.55 Reissue Quilted Classic 226, schwarz, sehr guter Zustand
    #> 72                                                                                                                            Louis Vuitton W tote pm schwarz
    #> 73                                                                                                                                Louis Vuitton Python Lockme
    #> 74                                                                            CHANEL Tasche 2.55 Flap Bag Kaviar Leder Small/Medium 23x14x6 cm NEUWERTIG, OVP
    #> 75                                                                           Louis Vuitton Parnassea Line Capucines MM M48864 Damen Handtasche Noir  BF313014
    #> 76                                                                                         CHANEL Tasche schwarz Lammfell Wildleder black bag lambskin suede 
    #> 77                                                                                           CHANEL BAG -- CLASSIC SHOPPER TOTE IN BLACK HARDWARE IN GOLD MAT
    #> 78                                                                                  Original XL CHANEL® Flap Bag Maxi Schwarz Lambskin Chain LUXUS NP: 5420 <U+0080>
    #> 79                                                                                  CHANEL Lambskin Quilted Extra Mini Emoji Flap Black Bag, NEU MIT RECHNUNG
    #> 80                                                                                                      Original 2.55 CHANEL Jumbo Reissue in schwarz mit GHW
    #> 81                                                                                                                      Fendi Peekaboo - Tasche / Aktentasche
    #> 82                                                                                                 NEU Original Chanel Girl Bag / Tweed / Little Black Jacket
    #> 83                                                                                                      DUNHILL - BAG 24 STUNDEN, OFFICE -  Kalbsleder - BAG 
    #> 84                                                                                                                 Chanel Rucksack / Backpack 2016 Size Small
    #> 85                                                                                                      Gucci Damen 488800Dt9yt8915 Schwarz Leder Handtaschen
    #> 86                                                                                                      Gucci Damen 488715Dzfmx8239 Schwarz Leder Handtaschen
    #> 87                                                                                                     Balmain Damen W7fs220pgpc176 Schwarz Leder Handtaschen
    #> 88                                                                                                                                      CHANEL Tasche schwarz
    #> 89                                                                                                Handtaschen Fendi PEEKABOO GRANDE Damen - Leder (8BN2105B2)
    #> 90                                                                           Chanel Matelasse A01112 Double Flap Double Chain Bag Damen Leder Schult BF314581
    #> 91                                                                                                   Gucci Damen 443496Dtdot1000 Schwarz Leder Schultertasche
    #> 92                                                                                  HERMES MALLETTE VINTAGE HANDTASCHE MIT SEPARATEM SCHMUCKKASTEN - SCHWARZ 
    #> 93                                                                                 LANVIN Weekender Schwarz Damen Tasche Bag Sac Leder Leather Krokodil Purse
    #> 94                                                                                                     Saint Laurent Damen 464960Dti0e1000 Schwarz Leder Tote
    #> 95                                                                                  Chanel GST Tasche Schwarz Kaviar Leder  Rechnung Full Set Chanel Flap Bag
    #> 96                                                                                                               Gucci New Bamboo Pythonleder Tasche, Schwarz
    #> 97                                                                                        Chanel Matelasse A01094 Damen Leder Schultertasche Schwarz BF311432
    #> 98                                                                           Chanel Caviar Skin Grand-Einkaufstote GST A50995 Damen Leder Schulterta BF313361
    #> 99                                                                                        Chanel Matelasse A01094 Damen Leder Schultertasche Schwarz BF310074
    #> 100                                                                                CHANEL Lamb Quilted maxi XL Jumbo 2.55 XXL Tasche Bag Flap 34x23 Matelasse
    #> 101                                                                          Original TOM FORD Gucci Bag Messenger 2.800 <U+0080> Jades Luisaviaroma Handtasche Top 
    #> 102                                                                                                   Fendi Damen 8Bn29381bf03du Schwarz Leder Schultertasche
    #> 103                                                                                       Dolce E Gabbana Damen Bb6343ai48980999 Schwarz Leder Schultertasche
    #> 104                                                                                       Dolce E Gabbana Damen Bb6343ab99880999 Schwarz Leder Schultertasche
    #> 105                                                                                                  Gucci Damen 409154A7m0t1000 Schwarz Leder Schultertasche
    #> 106                                                                           Louis Vuitton "Babylone PM Mahina Noir  M50031" Tasche,100% Original. Gebraucht
    #> 107                                                                                 CHANEL Schultertasche Schwarz Damen Tasche Handtasche Bag Sac Purse Leder
    #> 108                                                                                                   Fendi Damen 8Bn2999jbf0gxn Schwarz Leder Schultertasche
    #> 109                                                                                     MARK CROSS LEDER HANDTASCHE DAMEN TASCHE BAG NEU DGOLDTHY SCHWARZ EBE
    #> 110                                                                                              schwarze Luxus Damenhandtasche "Peekaboo" in large von Fendi
    #> 111                                                                                                    Givenchy Damen Bb05117479001 Schwarz Leder Handtaschen
    #> 112                                                                           Original Chanel Handtasche 2.55 (22x16cm) aus gestepptem Lammleder zu verkaufen
    #> 113                                                                                    LUXUS CHAIN SCHULTER Bag v CHANEL m CC LOGOS-PATENT LEDER m CARD U BOX
    #> 114                                                                             Chanel Caviar Mini Flap Bag Square Tasche Black Gold Schwarz Vintage Original
    #> 115                                                                                 Original Chanel Tasche, Bag, schwarz, silber Hardware, medium,selten, Top
    #> 116                                                                   Christian Dior <U+2728> <U+0080>4k Lady Dior Soft Shopper  Tasche GST Weihnachten Geschenk NEU
    #> 117                                                                                                  Valentino Damen Lw2b0977vit0no Schwarz Leder Handtaschen
    #> 118                                                                          Chanel Matelasse Classic Flap Medium A01112 Damen Leder Schultertasche  BF310500
    #> 119                                                                           HERMES SAC A DEPECHES Brieftasche Business Bag Aktentasche Tasche Rare BOX CALF
    #> 120                                                                            FENDI LEDER HANDTASCHE DAMEN TASCHE BAG NEU DOT COM KALBSLEDER CENTURY WAV C8F
    #> 121                                                                                                            Dior Lady Dior Tasche Medium, neu mit Rechnung
    #> 122                                                                           <U+2764> Original CHANEL Tasche Schwarz Echt Leder Massiv 2 in 1 Jades NEU !!!!
    #> 123                                                                                                                     Black CHANEL Bag - Calf Leather - NEW
    #> 124                                                                              +Garantiert Original CHANEL 2.55 Timeless JUMBO Flap Bag Patent Leather SHW+
    #> 125                                                                                                 Louis Vuitton Vivienne Neuwertig! Mit Rechnung 04.03.2017
    #> 126                                                                               CHANEL Schultertasche Schwarz Damen Tasche Bag Sac Leder Leather Purse Tote
    #> 127                                                                            LOUIS VUITTON Koffer Grau Schwarz Damen Tasche Bag Tasche Weekender Sac Canvas
    #> 128                                                                             LOUIS VUITTON Weekender Schwarz Multicolor Damen Tasche Keepall 45 Bag Tasche
    #> 129                                                                                    CHANEL Schultertasche Schwarz Damen Tasche Bag Sac Leder Leather Purse
    #> 130                                                                          Chanel Matelasse A01112 Double Flap Double Chain Bag Damen Leder Schult BF313093
    #> 131                                                                           CHANEL Handtasche Clutch Schwarz Damen Tasche 2.55 Bag Sac Purse Schultertasche
    #> 132                                                                                                            BOTTEGA  VENETA, Shopper groß, Farbe Schwarz  
    #> 133                                                                          Chanel Matelasse Classic Double Flap Double Chain A01113 Damen Leder Sc BF314002
    #> 134                                                                                                                  Diorama Tasche Medium Dior Leder Schwarz
    #> 135                                                                          Louis Vuitton 2006 Collection Speedy Fringe 25 Damen Handtasche Noir (K BF313013
    #> 136                                                                                                      Fendi Damen 8Bn293i8df07ha Schwarz Leder Handtaschen
    #> 137                                                                                                 Balmain Damen W7msb043306176 Schwarz Leder Schultertasche
    #> 138                                                                                                    *CHANEL*Half Moon*Flap*Caviar*Leder*Bag*Schwarz*NEU !!
    #> 139                                                                                      CHANEL Flapbag schwarz Leder mit Camelia selten Weihnachtsgeschenk!!
    #> 140                                                                                                      Fendi Damen 8Bh3338e5f0x93 Schwarz Leder Handtaschen
    #> 141                                                                                                                          Celine Luggage Mini Bag schwarz 
    #> 142                                                                          Louis Vuitton Monogram Victoire M41730 Damen Schultertasche Noir (Kouri BF310756
    #> 143                                                                                                Balmain Damen W7msb033002r176 Schwarz Leder Schultertasche
    #> 144                                                                                               Tod's Damen Xbwamujt100t0pb999 Schwarz Leder Schultertasche
    #> 145                                                                                                  Christian Louboutin Damen 3175020Cm53 Schwarz Leder Tote
    #> 146                                                                                       Chanel Girl Chanel A90766 Women's Shoulder Bag Brown,Black BF308423
    #> 147                                                                                               PRADA Tasche / Bag 1BA874 schwarz-grau 100% Leder / Leather
    #> 148                                                                            Original Chanel PST Petite Shopping Tote Caviar Gold Top!! mit ID Card, Tasche
    #> 149                                                                              Original Louis Vuitton Metis Monogram Bag/Tasche (schwarz) im Full Set *NEU*
    #> 150                                                                              CHANEL 2.55 Tasche Bag ZEITLOS Schwarz Noir matelassé LACK PATENT 25.5x17cm 
    #> 151                                                                             Chanel Matelasse Classic Double Flap Double Chain A01113 Damen Leder BF310443
    #> 152                                                                                                   Fendi Damen 8Bn2999njf0gxn Schwarz Leder Schultertasche
    #> 153                                                                                         Alexander Mcqueen Damen 469260Dx50g1000 Schwarz Leder Handtaschen
    #> 154                                                                                            FENDI LEDER HANDTASCHE DAMEN TASCHE BAG NEU DOTCOM SCHWARZ EE5
    #> 155                                                                                                     Original Celine Luggage Bag große Tasche Schwarz NEU!
    #> 156                                                                                                      Fendi Damen 8Bn2935qlf01f3 Schwarz Leder Handtaschen
    #> 157                                                                                                    Givenchy Damen Bb05096538001 Schwarz Leder Handtaschen
    #> 158                                                                                                 Balmain Damen W7fs204pgaz181 Schwarz Leder Schultertasche
    #> 159                                                                                          Dolce E Gabbana Damen Bb6002ai585hnf27 Schwarz Leder Handtaschen
    #> 160                                                                             Chanel Matelasse Classic Double Flap Double Chain A01113 Damen Leder BF310444
    #> 161                                                                               Dolce & Gabbana Damentasche Handtasche Clutch Etui Brokat Kristalle Schwarz
    #> 162                                                                                                   Balmain Damen W7msc062806m176 Schwarz Leder Handtaschen
    #> 163                                                                           orig CHANEL WOC BOY Wallet on chain Caviar schwarz silber +  ID Card + Rechnung
    #> 164                                                                          Bvlgari Bulgari Serpenti Diva Hypnotic Tasche. Rarität. Eidechse Leder NP: 4500<U+0080>
    #> 165                                                                            Chanel Sac Bowling Bag 31 Rue Cambon Paris Leder Schulter Trage Tasche Schwarz
    #> 166                                                                                                                                louis vuitton Babylone PM 
    #> 167                                                                                                        Antheia Louis Vuitton Hobo black absolut neuwertig
    #> 168                                                                              CHANEL Weekender Schwarz Damen Tasche Bag Weekender Sac Schultertasche Leder
    #> 169                                                                               CHANEL Schultertasche Schwarz Weiß Damen Tasche Bag Sac Umhängetasche Purse
    #> 170                                                                                CHANEL Schultertasche Schwarz Damen Tasche Mademoiselle Bag Sac Handtasche
    #> 171                                                                               CHANEL Shopper Schwarz Damen Tasche Bag Sac Handtasche Schultertasche Purse
    #> 172                                                                                Original Louis Vuitton Handtasche Mazarine MM M.Emp.Noir M50643, neuwertig
    #> 173                                                                                  Orig. Chanel Tasche Boho Hobo * Mini Beutel * Beuteltasche schwarz * TOP
    #> 174                                                                           Original Gucci Echt Python Leder, Tasche, XL Shopper, Weekender mit Clutch, NEU
    #> 175                                                                                        Dolce E Gabbana Damen Bb6344am27980999 Schwarz Samt Schultertasche
    #> 176                                                                                       Dolce E Gabbana Damen Bb6344ai49080999 Schwarz Leder Schultertasche
    #> 177                                                                                                          Fendi Damen 8Bz038i8f0gxn Schwarz Leder Rucksack
    #> 178                                                                                                                            Louis Vuitton ARTSY MM SCHWARZ
    #> 179                                                                             HERMES SAC A DEPECHES Brieftasche Business Bag Aktentasche Tasche Rare CHEVRE
    #> 180                                                                             Dolce & Gabbana Luxus Designer Tasche Box Bag Kamera Optik schwarz gold 6450<U+0080>
    #> 181                                                                                  DOLCE&GABBANA LEDER HANDTASCHE DAMEN TASCHE BAG NEU BEATRICE SCHWARZ D32
    #> 182                                                                                        Louis Vuitton Metis Monogram Leder Schwarz Tasche Mit Rechnung NEU
    #> 183                                                                                                  Valentino Damen Nw0b0a81vsl0no Schwarz Leder Handtaschen
    #> 184                                                                           Chanel Caviar Skin Damen Kaviarleder Schultertasche,Handtasche Schwarz BF311161
    #> 185                                                                          Louis Vuitton Monogram Pallas M41064 Damen Handtasche Monogram,Noir (Ko BF314521
    #> 186                                                                                                  Tod's Damen Xbwamuyy201tiab999 Schwarz Leder Handtaschen
    #> 187                                                                                                  Tod's Damen Xbwamuu0200pupb999 Schwarz Leder Handtaschen
    #> 188                                                                                                  Tod's Damen Xbwldmu0300pupb999 Schwarz Leder Handtaschen
    #> 189                                                                              Chanel Matelasse A01112 Doppelte Klappe Doppelte Kette Tasche Damen BF309634
    #> 190                                                                                                 Chloe Tasche, schwarz, Echtleder, Neuwertig und makellos 
    #> 191                                                                               DIOR, D-Bee Einkaufstasche/Shopper schwarzes genarbtes Kalbsleder  NEU!!!!!
    #> 192                                                                             PRADA BR5096 Vitello Phenix Hobo Bag Leather, Leder, schwarz, NEU mit Ettiket
    #> 193                                                                           Céline Celine Tri Fold Medium Shopper Black Schwarz grained genarbtes Leder Neu
    #> 194                                                                                CÉLINE Handtasche Schwarz Damen Tasche Luggage medium Bag Sac Henkeltasche
    #> 195                                                                            CHANEL Schultertasche Schwarz Damen Tasche Jersey Tweed Chanel Flap with Chain
    #> 196                                                                              BOTTEGA VENETA Hobo Bag Schwarz Damen Tasche Handtasche Bag Sac Python Belly
    #> 197                                                                                              CÉLINE Handtasche Schwarz Damen Tasche Luggage Bag Sac Leder
    #> 198                                                                                                               NEU Original CHANEL Boy Brick Plexiglas Bag
    #> 199                                                                           MCM Leder Rucksack Original schwarz Michael Cromer von 1995 aus München Leather
    #> 200                                                                                       Dolce E Gabbana Damen Bb6344ai64780999 Schwarz Leder Schultertasche
    #>        price currency
    #> 1   44900.00      EUR
    #> 2   26990.00      EUR
    #> 3   24900.00      EUR
    #> 4   21500.00      EUR
    #> 5   14000.00      EUR
    #> 6   12500.00      EUR
    #> 7   11900.00      EUR
    #> 8   11800.00      EUR
    #> 9   11800.00      EUR
    #> 10  10990.00      EUR
    #> 11   9995.00      EUR
    #> 12   9598.00      EUR
    #> 13   9398.00      EUR
    #> 14   9198.00      EUR
    #> 15   8990.00      EUR
    #> 16   8500.00      EUR
    #> 17   8515.00      EUR
    #> 18   8398.00      EUR
    #> 19   8075.00      EUR
    #> 20   7609.99      EUR
    #> 21   7499.00      EUR
    #> 22   6999.00      EUR
    #> 23   6900.00      EUR
    #> 24   6900.00      EUR
    #> 25   6398.00      EUR
    #> 26   6250.00      EUR
    #> 27   5990.00      EUR
    #> 28   5900.00      EUR
    #> 29   5900.00      EUR
    #> 30   5500.00      EUR
    #> 31   5500.00      EUR
    #> 32   4990.00      EUR
    #> 33   5000.00      EUR
    #> 34   4990.00      EUR
    #> 35   4955.00      EUR
    #> 36   4950.00      EUR
    #> 37   4900.00      EUR
    #> 38   4798.00      EUR
    #> 39   4500.00      EUR
    #> 40   4400.00      EUR
    #> 41   4390.00      EUR
    #> 42   4298.00      EUR
    #> 43   4294.00      EUR
    #> 44   4150.00      EUR
    #> 45   4139.00      EUR
    #> 46   4138.00      EUR
    #> 47   4138.00      EUR
    #> 48   4000.00      EUR
    #> 49   3990.00      EUR
    #> 50   3949.00      EUR
    #> 51   3850.00      EUR
    #> 52   3835.00      EUR
    #> 53   3800.00      EUR
    #> 54   3753.00      EUR
    #> 55   3729.00      EUR
    #> 56   3600.00      EUR
    #> 57   3585.00      EUR
    #> 58   3500.00      EUR
    #> 59   3390.00      EUR
    #> 60   3400.00      EUR
    #> 61   3399.00      EUR
    #> 62   3350.00      EUR
    #> 63   3300.00      EUR
    #> 64   3299.00      EUR
    #> 65   3290.00      EUR
    #> 66   3250.00      EUR
    #> 67   3250.00      EUR
    #> 68   3200.00      EUR
    #> 69   3199.00      EUR
    #> 70   3199.00      EUR
    #> 71   3190.00      EUR
    #> 72   2990.00      EUR
    #> 73   2990.00      EUR
    #> 74   2995.00      EUR
    #> 75   3000.00      EUR
    #> 76   2990.00      EUR
    #> 77   2990.00      EUR
    #> 78   2990.00      EUR
    #> 79   2950.00      EUR
    #> 80   2950.00      EUR
    #> 81   2950.00      EUR
    #> 82   2900.00      EUR
    #> 83   2895.00      EUR
    #> 84   2899.00      EUR
    #> 85   2863.00      EUR
    #> 86   2863.00      EUR
    #> 87   2861.00      EUR
    #> 88   2850.00      EUR
    #> 89   2850.00      EUR
    #> 90   2835.00      EUR
    #> 91   2814.00      EUR
    #> 92   2798.00      EUR
    #> 93   2798.00      EUR
    #> 94   2769.00      EUR
    #> 95   2750.00      EUR
    #> 96   2686.00      EUR
    #> 97   2671.00      EUR
    #> 98   2663.00      EUR
    #> 99   2653.00      EUR
    #> 100  2604.00      EUR
    #> 101  2590.00      EUR
    #> 102  2577.00      EUR
    #> 103  2543.00      EUR
    #> 104  2543.00      EUR
    #> 105  2532.00      EUR
    #> 106  2500.00      EUR
    #> 107  2495.00      EUR
    #> 108  2486.00      EUR
    #> 109  2473.00      EUR
    #> 110  2450.00      EUR
    #> 111  2430.00      EUR
    #> 112  2399.00      EUR
    #> 113  2370.00      EUR
    #> 114  2400.00      EUR
    #> 115  2399.00      EUR
    #> 116  2390.00      EUR
    #> 117  2373.00      EUR
    #> 118  2353.00      EUR
    #> 119  2327.50      EUR
    #> 120  2325.00      EUR
    #> 121  2299.00      EUR
    #> 122  2300.00      EUR
    #> 123  2300.00      EUR
    #> 124  2299.00      EUR
    #> 125  2300.00      EUR
    #> 126  2298.00      EUR
    #> 127  2298.00      EUR
    #> 128  2298.00      EUR
    #> 129  2298.00      EUR
    #> 130  2283.00      EUR
    #> 131  2280.00      EUR
    #> 132  2250.00      EUR
    #> 133  2258.00      EUR
    #> 134  2250.00      EUR
    #> 135  2242.00      EUR
    #> 136  2210.00      EUR
    #> 137  2210.00      EUR
    #> 138  2199.99      EUR
    #> 139  2195.00      EUR
    #> 140  2204.00      EUR
    #> 141  2200.00      EUR
    #> 142  2184.00      EUR
    #> 143  2161.00      EUR
    #> 144  2147.00      EUR
    #> 145  2136.00      EUR
    #> 146  2135.00      EUR
    #> 147  2120.00      EUR
    #> 148  2099.00      EUR
    #> 149  2099.00      EUR
    #> 150  2100.00      EUR
    #> 151  2099.00      EUR
    #> 152  2091.00      EUR
    #> 153  2091.00      EUR
    #> 154  2051.00      EUR
    #> 155  2050.00      EUR
    #> 156  2034.00      EUR
    #> 157  2023.00      EUR
    #> 158  2022.00      EUR
    #> 159  2018.00      EUR
    #> 160  2015.00      EUR
    #> 161  2014.89      EUR
    #> 162  2011.00      EUR
    #> 163  1999.00      EUR
    #> 164  2000.00      EUR
    #> 165  1999.95      EUR
    #> 166  2000.00      EUR
    #> 167  1990.00      EUR
    #> 168  1995.00      EUR
    #> 169  1995.00      EUR
    #> 170  1995.00      EUR
    #> 171  1995.00      EUR
    #> 172  1980.00      EUR
    #> 173  1980.00      EUR
    #> 174  1980.00      EUR
    #> 175  1978.00      EUR
    #> 176  1978.00      EUR
    #> 177  1978.00      EUR
    #> 178  1950.00      EUR
    #> 179  1953.00      EUR
    #> 180  1950.00      EUR
    #> 181  1945.00      EUR
    #> 182  1930.00      EUR
    #> 183  1938.00      EUR
    #> 184  1932.00      EUR
    #> 185  1925.00      EUR
    #> 186  1921.00      EUR
    #> 187  1921.00      EUR
    #> 188  1921.00      EUR
    #> 189  1913.00      EUR
    #> 190  1900.00      EUR
    #> 191  1900.00      EUR
    #> 192  1899.00      EUR
    #> 193  1899.00      EUR
    #> 194  1898.00      EUR
    #> 195  1898.00      EUR
    #> 196  1898.00      EUR
    #> 197  1898.00      EUR
    #> 198  1890.00      EUR
    #> 199  1890.00      EUR
    #> 200  1873.00      EUR

The possibilities are endless, though ebay APIs have even more.

You should probably read ebay's [API Reference](https://developer.ebay.com/Devzone/finding/Concepts/FindingAPIGuide.html) and [API license](https://go.developer.ebay.com/api-license-agreement) and make sure you adhere to the rules.

Also note that the rate limit of the API wrapped here is 5,000 requests a day, each request can bring up to 100 results (ebay items).

For more possibilities see the `search_ebay` function documentation, and read [this](TODO) blog post.
