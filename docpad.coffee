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
}

# Export the DocPad Configuration
module.exports = docpadConfig