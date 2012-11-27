# JSONTableMotion

## What is this?

This RubyMotion project is an example of how to use nesting inside a JSON file to create a series of UITableViews. You could extend this to pull the JSON from a server somewhere to dynamically update your menu structure.

The project has 3 main files:

1. The ```AppDelegate``` class
2. The ```NestingTableViewController``` class
3. The JSON data file.

The ```NestingTableViewController``` class calls itself and pushes a new instance of itself on the navigation stack and passes down the correct instance needed for the nesting of data.


## OK, Sounds interesting... how do I get started?

###Prerequisites:

1. XCode 4.5 with iOS 6 SDK.
2. You must have a registered and licensed copy or RubyMotion on your computer. If you do not, you will need to [purchase a license here](http://www.rubymotion.com/).
5. Valid Apple Developer signing certificate (if you want to install on a device).

*This project has been tested using RubyMotion 1.29 and iOS SDK 6*


###Compiling:

1. Clone the respoitory and ```cd``` into the directory
2. Run ```bundle update``` then ```rake``` and the application will build and launch the iOS simulator.

## Looks like I can do a bunch of things with the JSON, huh?

Yup! There's no limit to the nesting you can do with this project! In fact, check out the very last row in the table and you'll see what I mean ;)

Explore the JSON and modify it to suit your needs. Just make sure to [validate your JSON](http://jsonlint.com/) or it'll crash the app at runtime.

## Feedback

I'd love [feedback](mailto:mjar81@gmail.com) on if you find this useful. If you find an issue, please fork fix, fix it, and submit a pull request (or submit an issue through github).

#### Credits

Inspiration to do this came from @diemer's [JSONTableView](https://github.com/diemer/JSONTableView) project. I simply wanted more control over how the data was presented and needed nesting. Check out his project for an example of loading the data from a server.

Thanks to Laurent Sansonetti for creating RubyMotion!