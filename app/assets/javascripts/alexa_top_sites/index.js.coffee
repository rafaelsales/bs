AlexaTopSites = AlexaTopSites || {}

class AlexaTopSites.Index
  constructor: ->
    $('#alexa-top-sites.table').DataTable({
      pageLength: 25,
     columnDefs: [{
       targets: 'actions',
       orderable: false
     }]
    })

$ ->
  new AlexaTopSites.Index
