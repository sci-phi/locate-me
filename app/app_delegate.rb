class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame( UIScreen.mainScreen.bounds )
    
    @map = MapViewController.alloc.init
    @window.rootViewController = @map
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    location_manager = CLLocationManager.alloc.init
    alertOntLocationServicesDisabled unless location_manager.locationServicesEnabled

    true
  end  

end

def alertOntLocationServicesDisabled
  alert = UIAlertView.alloc.init
  alert.title = "Location Services Disabled"
  alert.message = "You currently have all location services for this device disabled. If you proceed, you will be asked to confirm whether location services should be reenabled."
  alert.addButtonWithTitle('OK')
  alert.show    
end
