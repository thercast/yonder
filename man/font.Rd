% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/design.R
\name{font}
\alias{font}
\title{Tag element font}
\usage{
font(.tag, color = NULL, size = NULL, weight = NULL, align = NULL)
}
\arguments{
\item{.tag}{A tag element.}

\item{color}{A character string specifying the text color of the tag element,
defaults to \code{NULL} in which case the text color is unchanged.}

\item{size}{One of \code{"2x"}, \code{"3x"}, ..., or \code{"10x"} specifying a factor to
increase a tag element's font size by (e.g. \code{"2x"} is double the base font
size), defaults to \code{NULL}, in which case the font size is unchanged.}

\item{weight}{One of \code{"bold"}, \code{"normal"}, \code{"light"}, \code{"italic"}, or
\code{"monospace"} specifying the font weight of the element's text, defaults to
\code{NULL}, in which case the font weight is unchanged.}

\item{align}{A \link{responsive} argument. One of \code{"left"}, \code{"center"}, \code{"right"},
or \code{"justify"}.}
}
\description{
The \code{font()} utility may be used to change the color, size, or weight of a
tag element's text font. Font size's are changed relative to the base font
size of the web page.
}
\details{
The possible font colors are,
\itemize{
\item red
\item purple
\item indigo
\item blue
\item cyan
\item teal
\item green
\item yellow
\item amber
\item orange
\item body (this "color" sets the tag element's font color to the default body
color)
\item grey
\item white
}
}
\examples{

### Possible colors

colors <- c(
  "red", "purple", "indigo", "blue", "cyan", "teal", "green",
  "yellow", "amber", "orange", "body", "grey", "white"
)

div(
  lapply(
    head(colors, -1),
    font,
    .tag = div("Pellentesque tristique imperdiet tortor.") \%>\%
      padding(5)
  )
) \%>\%
  display("flex") \%>\%
  flex(wrap = TRUE)

}
\seealso{
Other design: \code{\link{affix}},
  \code{\link{background}}, \code{\link{border}},
  \code{\link{display}}, \code{\link{float}},
  \code{\link{padding}}, \code{\link{rounded}},
  \code{\link{scroll}}, \code{\link{shadow}},
  \code{\link{width}}
}
\concept{design}
