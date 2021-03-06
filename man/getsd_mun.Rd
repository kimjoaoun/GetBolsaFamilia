% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getsd_mun.R
\name{getsd_mun}
\alias{getsd_mun}
\title{Collects municipal level data from the Seguro Defeso Program database.}
\usage{
getsd_mun(IBGECODE, AAAA, MM = NULL, PAGE = 1, YEARLY = TRUE)
}
\arguments{
\item{IBGECODE}{IBGE unique identifier of the municipality which you want the data. The list of municipalities and its codes might be requested with the function owdbr::munlist()}

\item{AAAA}{Year of the data (AAAA format)}

\item{MM}{Month of the data (MM format)}

\item{PAGE}{Request's page. In normal situations: page=1.}

\item{YEARLY}{If True, it is not needed to fill the MM param, the package will request the data for the entire year (AAAA). Default= TRUE.}
}
\value{
a tibble with the requested data, if there are more than one IBGECODE, returns all of them in the same tibble.
\describe{
  \item{dataReferencia}{Reference date}
  \item{valor}{Amount of money invested in the municipality.}
  \item{quantidadeBeneficiados}{Number of citizens wich are enrolled in the program in that moment}
  \item{municipio.codigoIBGE}{IBGE code of the municipality.}
  \item{municipio.nomeIBGE}{Name of the municipality.}
  \item{municipio.pais}{Country of the municipality.}
  \item{municipio.uf.sigla}{Abbreviation of name of the state in which the municipality is.}
  \item{municipio.uf.nome}{Full name of the state in wich the municipality is.}
  \item{tipo.id}{Type}
  \item{tipo.descricao}{Abbreviation of the program's name.}
  \item{tipo.descricaoDetalhada}{Full name of the program.}
  }
}
\description{
The program Seguro Defeso is a brazilian social welfare program that provides financial aid for fisherman and fisherwoman in periods in which this activity is prohibited by law due to the fish reproduction season.
This function collects municipal level data from the program, some data like the number of citizens in a municipality which are enrolled in the program, and the total amount of money invested by the program in that city.
}
\examples{
\dontrun{
getsd_mun("3304557", AAAA = "2015", MM = "05", PAGE = 1, YEARLY = FALSE)
}
}
\author{
Joao Pedro Oliveira dos Santos, International Relations Institute, Pontifical Catholic University of Rio de Janeiro
}
