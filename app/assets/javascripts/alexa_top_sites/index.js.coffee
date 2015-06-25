AlexaTopSites = AlexaTopSites || {}

class AlexaTopSites.Index
  constructor: ->
    @initDatatable()
    @initScreenshotPopover()

  initDatatable: ->
    $('#alexa-top-sites.table').DataTable({
      pageLength: 25,
     columnDefs: [{
       targets: 'actions',
       orderable: false
     }]
    })

  initScreenshotPopover: ->
    $('#alexa-top-sites [data-toggle="popover"]').popover({
      html: true,
      container: 'body',
      content: ->
        $('<img/>', { src: $(this).data('screenshot-url'), width: 320 })
    })

$ ->
  new AlexaTopSites.Index
