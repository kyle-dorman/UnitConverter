# UnitConverter

Goal: Build an app that allows a user to input a temperature in Celsius, and to convert the value to a temperature in Fahrenheit.

Step 1:
Compile the app (CMD B). Make sure everythign compiles. 
Run the app. Make sure everything works. You should see a blank white screen. 
Run the tests (CMD U). Make sure all tests pass. Open the debug area (bottom pannel) to see output.

Step 2:
Add a UILabel named "temperatureLabel" to the view controller. 
Instantiate the label before the call to super.init
Add the label to the view hierarchy by calling (view.addSubview)[https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/#//apple_ref/occ/instm/UIView/addSubview:] before the call to (super.viewDidLoad)[https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIViewController_Class/#//apple_ref/occ/instm/UIViewController/viewDidLoad]s
Add text to the (label)[https://developer.apple.com/library/ios/documentation/UIKit/Reference/UILabel_Class/#//apple_ref/occ/instp/UILabel/text]
Because we are gong to use a constrant based layout, set the label's (translatesAutoresizingMaskIntoConstraints)[https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/#//apple_ref/occ/instp/UIView/translatesAutoresizingMaskIntoConstraints] to false.
Add two constraints to the label. The first sets the (topAnchor)[https://developer.apple.com/library/ios/documentation/UIKit/Reference/UILayoutGuide_Class_Reference/#//apple_ref/occ/instp/UILayoutGuide/topAnchor] of the label 30 pixels below the top of the view controller's view. The second centers the label horizontally. 
````
temperatureLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 30).active = true
temperatureLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
````
Run the app. Make sure you see text on the screen. 

Step 3:



