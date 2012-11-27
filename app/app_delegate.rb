class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    # Read in the JSON file from the /resources folder
    localFile = File.join(App.resources_path, 'data.json')
    tableData = BW::JSON.parse( File.read( localFile ) )

    opsTVC = NestingTableViewController.alloc.initializeWithData( tableData )

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController( opsTVC )
    @window.makeKeyAndVisible
    true
  end
end
