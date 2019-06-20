# Open Welfare Data Brazil

[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![](http://cranlogs.r-pkg.org/badges/grand-total/owdbr?color=blue)](https://cran.r-project.org/package=owdbr)
[![](https://www.r-pkg.org/badges/version/owdbr?color=orange)](https://cran.r-project.org/package=owdbr)

Tools for collecting municipal-level data from several Brazilian governmental social programs.

Collects data from Public APIs that contains information related to the following programs:
* Bolsa Familia Program  **OK [CRAN]**
* PETI (Child Labour Erradication Program)  **OK [CRAN]**
* Seguro Defeso  **OK [CRAN]** 
* FIES (Financiamento Estudantil)  *Soon*
* PROUNI  *Soon*

## Installation

```r
#You can install the latest version (under development and probably bit unstable, but with more functions) here on GitHub:
install.packages('devtools')
devtools::install_github('kimjoaoun/owdbr')

## or directly from CRAN

install.packages('owdbr')
```

## Introduction
The package has some simple functions that needs to be understood by the user. Only with the knowledge of these, one can make a good use of it. All these functions were written in a way to support multiple requests at once, in order to facilitate the download of data from multiple municipalities.

#### * **``uflist()`` function** 

The first step in using the package is running the ``uflist()`` function, this function takes **no arguments** and it returns a tibble with three columns: the first one is the ``num``(with the numeric identifier of the State); the second one being the ``State`` column, with the full name of the State; The ``UF`` column, which contains the UF code, that is a short name (abbreviation?) for a State; and finally, the ``region`` column, which contains the region of the State.

The function accepts the "region" arguments with the following inputs "Norte", "Sul", "Nordeste", "Centro-Oeste" and "Sudeste", the region argument filter the States by the desired region, for example:

```r
x <- uflist(region = 'Sul')
```

This input returns a tibble only with the states in the south region.

#### * **``munlist()`` function**

Then, having the list of the States, one should run the ``num`` of the desired state(s) inside the munlist() function. It's going to request the list of all the municipalities in the desired State and then it will return them in a tibble object. (Why a tibble? Click [here](https://www.r-bloggers.com/a-tour-of-the-tibble-package/).

This list is needed because each municipality has a unique identifier, and this one is needed to request municipal-level data from Government's APIs.

use: ``help(munlist)`` to get the meaning of each column in the tibble returned by the function.

#### * **``get[program]_mun`` function family**

Finally, to request the data, one should run the ``get(pbf/peti/sd)_mun()`` function in those numbers that are in the ``codigo_municipio_completo`` column that was generated by the ``munlist()`` function.

#### * Example
In the above example we are going to collect *Bolsa Familia Program* data from all municipalities in the state of Rondônia.

```r
library(dplyr)
states <- uflist()
View(states)
```

In the generated tibble, we can see that the ``num`` of the State of Rondônia is 11, so if we plan to collect data from this State, one should do the following:

```r
munis <- munlist(11)
```

Then, after a few seconds, the tibble with the list of municipalities in the state of Rondônia is returned and then we import the desired data by running:

```r
data.pbf <- getpbf_mun(munis$codigo_municipio_completo, 
                       AAAA = 2015, 
                       MM = 10, 
                       PAGE = 1
                       YEARLY = FALSE)      
```
If one desire data for an entire year, one can run:

```r
data.pbf <- getpbf_mun(munis$codigo_municipio_completo, 
                       AAAA= 2015, 
                       YEARLY=TRUE)
```

-----------

Huge thanks to: Pedro Cavalcante and Eduarda Oliveira for helping me out.

-----------

## Citation
To cite package ‘owdbr’ in publications use:

  Joao Pedro Oliveira dos Santos (2019). owdbr: Open Welfare Data Brazil. R package version
  1.0.0.35. https://CRAN.R-project.org/package=owdbr

A BibTeX entry for LaTeX users is:

```
  @Manual{,
    title = {owdbr: Open Welfare Data Brazil},
    author = {Joao Pedro {Oliveira dos Santos}},
    year = {2019},
    note = {R package version 1.0.0.35},
    url = {https://CRAN.R-project.org/package=owdbr},
  }
 
```
In Brazilian ABNT formatting rules: 

```
OLIVEIRA SANTOS, J; Open Welfare Data Brazil: Tools for collecting municipal-level data from several Brazilian governmental social programs. Versão 1.0.0.30. Rio de Janeiro, 06 Mai. 2019. Disponível em: https://github.com/kimjoaoun/owdbr/. Acesso em: *???*.
```

-----------

Please note that the 'owdbr' project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
