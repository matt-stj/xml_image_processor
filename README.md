# Rebubble Image Processor

This is an image processor that takes exif data from an xml api-endpoint and creates html pages from the incoming data.

## Dependencies
  * `ruby 2.3.0` is required to run this app.  If you aren't running it on your machine, visit the [official docs](https://www.ruby-lang.org/en/documentation/installation/) to download it.  If you're using a ruby version manager, please be sure to read [how to switch ruby versions](https://www.ruby-lang.org/en/documentation/installation/#managers).

  * This app's gems can be downloaded via `bundler` by opening the project directory and running the command `bundle` in your terminal.  If you don't have the gem, run `gem install bundler`.

## Running the program

Download or clone the project files to your machine and open the base directory of the application.  From there you can run the following command that takes two arguments:
`ruby lib/batch_processor.rb api-endpoint.xml output_directory`

## Tests

To run the test suite, run `rake` in your terminal from the app's base directory.
