reuropeana
=========



[![Build Status](https://api.travis-ci.org/ropensci/reuropeana.png)](https://travis-ci.org/ropensci/reuropeana)
[![codecov.io](https://codecov.io/github/ropensci/reuropeana/coverage.svg?branch=master)](https://codecov.io/github/ropensci/reuropeana?branch=master)

`reuropeana`: R client for Europeana

* [Europeana](http://europeana.eu/)
* [API docs](http://labs.europeana.eu/api/)

## Authentication

An API key is required. Get one at [their registration page](http://labs.europeana.eu/api/registration/). Then use that in the functions within this package. See examples.

## Installation

Install `reuropeana` from GitHub:


```r
install.packages("devtools")
devtools::install_github("ropensci/reuropeana")
```


```r
library('reuropeana')
```

## Search Europena providers


```r
out <- eu_providers(limit=3)
out$meta
#> $apikey
#> [1] "oHMKBqoeR"
#> 
#> $action
#> [1] "--deprecated--"
#> 
#> $success
#> [1] TRUE
#> 
#> $statsStartTime
#> [1] 1.452788e+12
#> 
#> $statsDuration
#> [1] 325
#> 
#> $requestNumber
#> [1] 999
#> 
#> $itemsCount
#> [1] 3
#> 
#> $totalResults
#> [1] 114
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

## Search Europena metadata

Search for _Leonardo da Vinci_ in the _who_ field.


```r
out <- eu_search(query='who:"Leonardo da Vinci"')
sapply(out$items, "[[", "title")
#> [[1]]
#> [1] "Fruits of the Spirit from BL Arundel 44, f. 83v"
#> 
#> [[2]]
#> [1] "[La ]Società Leonardo da Vinci, riunita in assemblea generale straordinaria l'11 gennaio 1915, votava all'unanimita il seguente ordine del giorno ... : Firenze, marzo 1915"
#> 
#> [[3]]
#> [1] "Leonardo da Vinci: Della natura, peso e moto delle acque: il Codice Leicester"
#> 
#> [[4]]
#> [1] "Model of boring machine from design of Leonardo da Vinci"
#> 
#> [[5]]
#> [1] "Wise and Fooling Virgins from BL Arundel 44, f. 57v"
#> 
#> [[6]]
#> [1] "Model of screw-cutting machine from design of Leonardo da Vi"
#> 
#> [[7]]
#> [1] "Temple of Wisdom from BL Arundel 44, f. 114v"
#> 
#> [[8]]
#> [1] "Trattato della pittura di Lionardo da Vinci nuovamente dato in luce, colla vita dell'istesso autore, scritta da Rafaelle Du Fresne. Si sono giunti i tre libri della Pittura, ed il trattato della Statua di Leon Battista Alberti, colla vita del medesimo"
#> 
#> [[9]]
#> [1] "Leonardo: Mona Lisa (XVI. sz.)"
#> 
#> [[10]]
#> [1] "Head and neck of an elderly man, seen in left profile. Etchi"
```

Range search, from _a_ to _b_


```r
out <- eu_search(query='[a TO b]', limit=3)
sapply(out$items, "[[", "title")
#> [[1]]
#> [1] "Anicius Manlius Severinus Boetius , De consolatione Philisophiae. [Paris, BnF, MSS Latin 6405]"
#> 
#> [[2]]
#> [1] "Vaticinia Sibyllae . – Vaticinia Merlini . – Gaufridus de Monemuta [Geofroy de Monmouth], Historia regum Britanniae , c. 111-117 . – Pseudo-Joachim Florensis , Expositio super Sibillis et Merlino (ff. 9v-25) ; Expositio brevior Sibyllae Erythrae et Merlini (ff. 28-38v); Prophéties sur le royaume de Sicile (ff. 40-40v) . – Joachim Florensis ? , Super numero bestiae Apocalypseos . – Rainerius de Pontio ? , De decem plagis . – Versus de Antechristo . – Sibylla Delphica . – Gebeno Eberbacensis , Speculum futurorum temporum . – Petrus de Alliaco , Invectiva Ezechielis prophete contra pseudo pastores. [Paris, BnF, MSS Latin 3319]"
#> 
#> [[3]]
#> [1] "Caius Sollius Apollinaris , Epistolae ; Carmina . – Decimus Magnus Ausonius , De XII Caesaribus per Suetonium Tranquillum scriptis (fragment) . Epistola Deidamiae ad Achillem. [Paris, BnF, MSS Latin 2782]"
```

Time range search, from _1525_ to _1527_


```r
out <- eu_search(query='YEAR:[1525 TO 1527]', limit=10)
sapply(out$items, "[[", "title")
#> [[1]]
#> [[1]][[1]]
#> [1] "Postille maiores cum questionibus"
#> 
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] "Melanchthon, Philipp"
#> 
#> 
#> [[3]]
#> [[3]][[1]]
#> [1] "Erasmus von Rotterdam"
#> 
#> 
#> [[4]]
#> [[4]][[1]]
#> [1] "Erasmus von Rotterdam"
#> 
#> 
#> [[5]]
#> [[5]][[1]]
#> [1] "Johann, Kurfürst von Sachsen"
#> 
#> 
#> [[6]]
#> [[6]][[1]]
#> [1] "Leyden, Lucas van"
#> 
#> 
#> [[7]]
#> [[7]][[1]]
#> [1] "Romance of Don Virgilios glossed with other two romances on love"
#> 
#> [[7]][[2]]
#> [1] "Romance de don Virgilios glosado con otros dos romances del amor"
#> 
#> 
#> [[8]]
#> [[8]][[1]]
#> [1] "Tweede Wereldoorlog - Nederland. Overzicht van een tentoonstelling in huize Kneuterdijk in Den Haag. De opening wordt op 15 oktober 1941 verricht door de Rijkscommissaris Dr. A. Seyss Inquart."
#> 
#> 
#> [[9]]
#> [[9]][[1]]
#> [1] "Tweede Wereldoorlog - Nederland. In een grote vergadering in de Dierentuin in Den Haag spreekt Generaalarbeidsführer, Dr. W. Decker het aanwezige publiek toe. Het thema van de vergadering is 'het nut van de Rijksarbeidsdienst'.Op de voorgrond: militairen in uniform met een schop. Foto : 11 oktober 1941."
#> 
#> 
#> [[10]]
#> [[10]][[1]]
#> [1] "Tweede Wereldoorlog - Nederland. Op 11 oktober wordt in Rotterdam een grote RAD (?)-tentoonstelling geopend in aanwezigheid van Rijkscommissaris Dr. A. Seyss Inquart (links) en Generaalcommissaris Schmidt. 1941."
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/reuropeana/issues).
* License: MIT
* Get citation information for `reuropeana` in R doing `citation(package = 'reuropeana')`

[![ro_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
