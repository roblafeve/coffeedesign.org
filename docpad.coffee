# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {

	plugins:  # example
    # Disable NIB within the Stylus Plugin
    stylus:
      stylusLibraries:
        nib: true
      stylusOptions:
        compress: true

    moment:
      formats: [
        {raw: 'date', format: 'MMMM D, YYYY', formatted: 'humanDate'}
        {raw: 'date', format: 'H:mm', formatted: 'humanTime'}
      ]


  documentsPaths: [  # default
    'documents',
    'documents/collections/events',
    'documents/collections/organizers'
  ]

  collections:
    events: ->   
      @getCollection("html").findAllLive({relativeOutDirPath: "collections/events"},[date:1])
    organizers: ->   
      @getCollection("html").findAllLive({relativeOutDirPath: "collections/organizers"},[sort_order:1])

  # # Environments

  layoutsPaths: [  # default
    'layouts',
    'templates'
  ]
}

# Export the DocPad Configuration
module.exports = docpadConfig
