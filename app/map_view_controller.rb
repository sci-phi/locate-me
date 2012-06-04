class MapViewController < UIViewController  
  def init
    self
  end

  def loadView
    self.view = MKMapView.alloc.init
    view.delegate = self

    # Add toolbar 
    @toolbar = UIToolbar.new
    @toolbar.barStyle = UIBarStyleDefault
    height = UIScreen.mainScreen.bounds.size.height
    width = UIScreen.mainScreen.bounds.size.width
    @toolbar.frame = CGRect.new [0, height - 32], [width, 32]

    # Add standard button for enabling location tracking
    @tracking_button = MKUserTrackingBarButtonItem.alloc.initWithMapView( self.view )
    @toolbar.setItems [@tracking_button]
    view.addSubview @toolbar

    # Add text label for simple user instruction
    @instruction = UILabel.alloc.initWithFrame CGRect.new [0, height/4], [width, 20]
    @instruction.text = "Tap the arrow icon to find your Location."
    self.view.addSubview @instruction
    
    # Add text labels for coordinates
    @lat_label = UILabel.alloc.initWithFrame CGRect.new [0, 20], [width, 20]
    @lat_label.setHidden(true)
    @lat_label.text = ""
    self.view.addSubview @lat_label

    @lon_label = UILabel.alloc.initWithFrame CGRect.new [0, 40], [width, 20]
    @lon_label.setHidden(true)
    self.view.addSubview @lon_label
    @lon_label.text = ""
  end

  def mapView( mapView, didUpdateUserLocation: userLocation )
    # hide instruction label
    @instruction.setHidden(true) if !(@instruction.isHidden)

    # display coordinates on-screen
    @lat_label.setHidden(false) if @lat_label.isHidden
    @lat_label.text = "Latitude : #{userLocation.coordinate.latitude}"

    @lon_label.setHidden(false) if @lon_label.isHidden
    @lon_label.text = "Longitude : #{userLocation.coordinate.longitude}"    
  end

end
