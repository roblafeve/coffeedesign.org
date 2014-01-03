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
        {raw: 'date', format: 'MMMM Do YYYY', formatted: 'humanDate'}
        {raw: 'date', format: 'YYYY-MM-DD', formatted: 'computerDate'}
      ]

  collections:
    events: ->   
      @getCollection("documents").findAllLive({relativeOutDirPath: "events"},[date:-1])

  # Environments

  environments:
    development:
      templateData:
        site:
          url: 'http://rob.local:9778'
    static:
      templateData:
        site:
          url: 'http://kc.coffeedesign.org'
}

# Export the DocPad Configuration
module.exports = docpadConfig
