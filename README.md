reuropeana
=========



`reuropeana`: R client for Europeana

* [Europeana](http://europeana.eu/)
* [API docs](http://labs.europeana.eu/api/)

## Authentication

An API key is required. Get one at [their registration page](http://labs.europeana.eu/api/registration/). Then use that in the functions within this package. See examples.

## Quick start

### Installation

Install `reuropeana` from GitHub:


```r
install.packages("devtools")
devtools::install_github("ropensci/reuropeana")
```


```r
library('reuropeana')
```

### Search Europena providers


```r
out <- eu_providers(limit=3)
out$meta
#> $apikey
#> [1] "oHMKBqoeR"
#> 
#> $action
#> [1] "/v2/providers.json"
#> 
#> $success
#> [1] TRUE
#> 
#> $statsStartTime
#> [1] 1.414539e+12
#> 
#> $statsDuration
#> [1] 10
#> 
#> $requestNumber
#> [1] 39
#> 
#> $itemsCount
#> [1] 3
#> 
#> $totalResults
#> [1] 201
```


```r
out$items[[1]]
#> $identifier
#> [1] "002"
#> 
#> $country
#> [1] "NO"
#> 
#> $name
#> [1] "Norsk Lydinstitutt"
#> 
#> $acronym
#> [1] "NL"
#> 
#> $altname
#> [1] "Norwegian Institute of Recorded Sound"
#> 
#> $scope
#> [1] "Other/None"
#> 
#> $geolevel
#> [1] "National"
#> 
#> $role
#> [1] "Data Aggregator"
#> 
#> $website
#> [1] "www.recordedsound.no/"
```

### Search Europena metadata

Search for _Leonardo da Vinci_ in the _who_ field.


```r
out <- eu_search(query='who:"Leonardo da Vinci"')
sapply(out$items, "[[", "title")
#> [[1]]
#> [1] "Des vortreflichen Florentinischen Mahlers Lionardo da Vinci höchst-nuetzlicher Tractat von der Mahlerey"
#> 
#> [[2]]
#> [1] "Annunciazione"
#> 
#> [[3]]
#> [1] "Adorazione dei Magi"
#> 
#> [[4]]
#> [1] "Battaglia di Anghiari"
#> 
#> [[5]]
#> [1] "Ritratto di donna"
#> 
#> [[6]]
#> [1] "Ritratto di Leonardo da Vinci"
#> 
#> [[7]]
#> [1] "San Girolamo"
#> 
#> [[8]]
#> [1] "San Girolamo"
#> 
#> [[9]]
#> [1] "Bildnis einer alten Frau im Profil"
#> 
#> [[10]]
#> [1] "Bildnis eines alten Mannes im Profil"
```

Range search, from _a_ to _b_


```r
out <- eu_search(query='[a TO b]', limit=3)
sapply(out$items, "[[", "title")
#> [[1]]
#> [1] "Context information: Rijksfotoarchief: Collectie Heidemaatschappij, 1910-1970 - positieven >> Rijksfotoarchief: Collectie Heidemaatschappij, positieven"
#> 
#> [[2]]
#> [1] "Context information: Rijksfotoarchief: Collectie Heidemaatschappij, 1910-1970 - positieven >> Rijksfotoarchief: Collectie Heidemaatschappij, positieven"
#> 
#> [[3]]
#> [1] "Context information: Rijksfotoarchief: Collectie Heidemaatschappij, 1910-1970 - positieven >> Rijksfotoarchief: Collectie Heidemaatschappij, positieven"
```

Time range search, from _1525_ to _1527_


```r
out <- eu_search(query='YEAR:[1525 TO 1527]', limit=10)
sapply(out$items, "[[", "title")
#> [[1]]
#> [1] "busto ritratto d'uomo"
#> 
#> [[2]]
#> [1] "figura maschile distesa"
#> 
#> [[3]]
#> [1] "adorazione dei pastori"
#> 
#> [[4]]
#> [1] "busto ritratto d'uomo"
#> 
#> [[5]]
#> [1] "busto ritratto d'uomo"
#> 
#> [[6]]
#> [1] "Sposalizio di Santa Caterina"
#> 
#> [[7]]
#> [1] "busto di Andrea Palladio"
#> 
#> [[8]]
#> [1] "motivi decorativi vegetali stilizzati"
#> 
#> [[9]]
#> [1] "busto di Girolamo Grimani"
#> 
#> [[10]]
#> [1] "cavallo"
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/reuropeana/issues).
* License: MIT
* Get citation information for `reuropeana` in R doing `citation(package = 'reuropeana')`

[![ropensci](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
