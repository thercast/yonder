---
layout: page
slug: download-event
roxygen:
  rdname: ~
  name: downloadEvent
  doctype: ~
  title: Trigger a download
  description: |-
    An alternative to `downloadLink` and `downloadHelper`. `downloadEvent` allows
    a custom reactive event to trigger a download. Thus, a single handler may be
    used for a complex reactive input or widget.
  parameters:
  - name: event
    description: |-
      A reactive input value (e.g. `input$click`), a call to a
      reactive expression, or a new expression inside curly braces. When `event`
      is triggered the file download is triggered.
  - name: filename
    description: |-
      A reactive input value, a call to a reactive expression, a
      function, or a new expression inside curly braces which returns a string
      specifying the name of the downloaded file.
  - name: handler
    description: |-
      A **function** with one argument that is expected to write the
      content of the downloaded file. A temporary file is passed to the function,
      which is expected to write content (text, images, etc.) to the temporary
      file.
  - name: domain
    description: |-
      A shiny session object, defaults to
      [getDefaultReactiveDomain()].
  sections: ~
  examples: |
    if (interactive()) {
      shinyApp(
        ui = container(
          textInput("name", "File name"),
          buttonInput("trigger", "Download")
        ),
        server = function(input, output) {
          downloadEvent(input$trigger, {
            if (is.null(input$name)) {
              "default"
            } else {
              input$name
            }
          }, function(file) {
            cat("hello, world!", file = file)
          })
        }
      )
    }
  aliases: ~
  family: ~
  export: yes
  filename: download.R
  source:
  - downloadEvent <- function(event, filename, handler, domain = getDefaultReactiveDomain())
    {
  - '  priority <- -5000'
  - '  pframe <- parent.frame()'
  - '  quoted <- FALSE'
  - '  key <- deparse(substitute(event))'
  - '  eventFunc <- shiny::exprToFunction(event, pframe, quoted)'
  - '  eventFunc <- wrapFunctionLabel('
  - '    eventFunc, "downloadEvent",'
  - '    ..stacktraceon = TRUE'
  - '  )'
  - '  if (shiny::isolate(!is.function(filename))) {'
  - '    filenameFunc <- shiny::exprToFunction('
  - '      filename, pframe,'
  - '      quoted'
  - '    )'
  - '  }'
  - '  else {'
  - '    filenameFunc <- filename'
  - '  }'
  - '  handlerFunc <- wrapFunctionLabel('
  - '    handler, "downloadHandler",'
  - '    ..stacktraceon = TRUE'
  - '  )'
  - '  label <- sprintf("downloadEvent(%s)", paste('
  - '    deparse(body(eventFunc)),'
  - '    collapse = "\n"'
  - '  ))'
  - '  domain$downloads$set(key, list('
  - '    filename = filenameFunc, contentType = NA,'
  - '    func = handlerFunc'
  - '  ))'
  - '  initialized <- FALSE'
  - '  o <- observe('
  - '    {'
  - '      eventFunc()'
  - '      if (!initialized) {'
  - '        initialized <<- TRUE'
  - '        return()'
  - '      }'
  - '      domain$sendCustomMessage("dull:download", list('
  - '        token = domain$token,'
  - '        key = key, filename = shiny::isolate(filenameFunc())'
  - '      ))'
  - '    }, label = label, suspended = FALSE, priority = priority,'
  - '    domain = domain, autoDestroy = TRUE, ..stacktraceon = FALSE'
  - '  )'
  - '  invisible(o)'
  - '}'
---