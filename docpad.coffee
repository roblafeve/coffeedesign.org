docpadConfig = {

	plugins:

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


  documentsPaths: [
    'documents',
    'documents/collections/events',
    'documents/collections/organizers'
  ]

  collections:
    events: ->   
      @getCollection("html").findAllLive({relativeOutDirPath: "collections/events"},[date:1])
    organizers: ->   
      @getCollection("html").findAllLive({relativeOutDirPath: "collections/organizers"},[sort_order:1])
    sponsors: ->   
      @getCollection("html").findAllLive({relativeOutDirPath: "collections/sponsors"},[sort_order:1])

  layoutsPaths: [
    'layouts',
    'templates'
  ]

  templateData:

    site:

      url: "http://kc.coffeedesign.org"

      title: "Coffee & Design"

      description: """
        Coffee & Design is a free, monthly event to connect design professionals in Kansas City.
        """
      keywords: """
        Kansas City, design, professionals, monthly, free, coffee, breakfast
        """

    # Get the prepared site/document description
    getPreparedDescription: ->
      # if we have a document description, then we should use that, otherwise use the site's description
      @document.description or @site.description

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
      # Merge the document keywords with the site keywords
      @site.keywords.concat(@document.keywords or []).join(', ')

}

module.exports = docpadConfig
