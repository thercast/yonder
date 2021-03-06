% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/button.R
\name{buttonInput}
\alias{buttonInput}
\alias{submitInput}
\alias{linkInput}
\title{Button and submit inputs}
\usage{
buttonInput(id, label, ..., block = FALSE)

submitInput(label = "Submit", block = FALSE, ...)

linkInput(id, text, ...)
}
\arguments{
\item{id}{A character string specifying the id of the button or link input.}

\item{label}{A character string specifying the label text on the button
input.}

\item{...}{Additional named arguments passed as HTML attributes to the parent
element.}

\item{block}{If \code{TRUE}, the input is block-level instead of inline, defaults
to \code{FALSE}. A block-level element will occupy the entire width of its
parent element.}

\item{text}{A character string specifying the text displayed as part of the
link input.}
}
\description{
Button inputs are useful as triggers for reactive or observer expressions.
The reactive value of a button input is the number of times it has been
clicked.

A submit input is a special type of button used to control HTML form
submission. Unlike shiny's \code{submitButton}, yonder's submit inputs will not
freeze all reactive inputs on the page.
}
\details{
A submit input is automatically included as part of a \code{\link{formInput}}.
}
\examples{
### Simple vs block button

buttonInput(
  id = NULL,
  label = "Simple"
) \%>\%
  background("green")

# Block buttons will fill the width of their parent element
buttonInput(
  id = NULL,
  label = "Block",
  block = TRUE
) \%>\%
  background("red")

### A submit button

submitInput()

### Possible colors

colors <- c(
  "red", "purple", "indigo", "blue", "cyan", "teal", "green",
  "yellow", "amber", "orange", "grey"
)

div(
  lapply(
    colors,
    function(color) {
      buttonInput(
        id = NULL,
        label = color
      ) \%>\%
        background(color) \%>\%
        margin(2)
    }
  )
) \%>\%
  display("flex") \%>\%
  flex(wrap = TRUE)

### Reactive links

div("Curabitur ", linkInput("inline", "vulputate"), " vestibulum lorem.")

}
\seealso{
Other inputs: \code{\link{addressInput}},
  \code{\link{buttonGroupInput}},
  \code{\link{checkboxInput}}, \code{\link{dateInput}},
  \code{\link{fileInput}}, \code{\link{formInput}},
  \code{\link{groupInput}}, \code{\link{loginInput}},
  \code{\link{radioInput}}, \code{\link{rangeInput}},
  \code{\link{selectInput}}, \code{\link{textInput}}
}
\concept{inputs}
