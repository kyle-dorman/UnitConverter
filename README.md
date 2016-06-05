# UnitConverter

## Goal: 
Build an app that allows a user to input a temperature in Celsius, and to convert the value to a temperature in Fahrenheit.

## Step 1: Make sure everything works. 
1. Compile the app (CMD B). Make sure everythign compiles. 
2. Run the app. Make sure everything works. You should see a blank white screen. 
3. Run the tests (CMD U). Make sure all tests pass. Open the debug area (bottom pannel) to see output.

## Step 2: Add a label
1. Add a UILabel named "temperatureLabel" to the view controller. 
2. Instantiate the label before the call to `super.init`
3. Add the label to the view hierarchy by calling [view.addSubview](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/#//apple_ref/occ/instm/UIView/addSubview:) before the call to [super.viewDidLoad](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIViewController_Class/#//apple_ref/occ/instm/UIViewController/viewDidLoad)
4. Add text to the [label](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UILabel_Class/#//apple_ref/occ/instp/UILabel/text)
5. Because we are going to use a constrant based layout, set the label's [translatesAutoresizingMaskIntoConstraints](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/#//apple_ref/occ/instp/UIView/translatesAutoresizingMaskIntoConstraints) to false.
6. Add two constraints to the label. The first, sets the [topAnchor](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UILayoutGuide_Class_Reference/#//apple_ref/occ/instp/UILayoutGuide/topAnchor) of the label 30 pixels below the top of the view controller's view. The second, centers the label horizontally. 

	``` 
	temperatureLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 30).active = true
	temperatureLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
	```
7. Run the app. Make sure you see text on the screen. 

## Step 3: Add a picker view
1. If you don't know what a picker view is, look [here](https://www.google.com/search?q=uipickerview+example&espv=2&biw=1440&bih=779&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjzttyS2JHNAhWJ4D4KHRX7DjQQ_AUIBygC#imgrc=scx7Kq9AB3Bj1M%3A)
2. Repeate the steps above and add a UIPickerView named "celciusPickerView". The picker view should be centered horizontally and 100 pixels below the bottom of the label. Good luck!
3. Run the app. If you see two grey lines in the center of the screen, good job you added a picker view. 

## Step 4: Add data to the picker view
1. View controllers, picker views and many other UI elements in iOS (& tvOS, watchOS ect.) rely on a delegate and a datasource reference. There are many reasons for doing this. It creates more composable elements, abstracts complexity, and enables better memory managment. Please look over [this](https://developer.apple.com/library/ios/documentation/General/Conceptual/CocoaEncyclopedia/DelegatesandDataSources/DelegatesandDataSources.html) resource. 
2. To have data to scroll through in our picker view, we need to add a datasource. Add a new Swift file to the project inside Sources called TemperatureRange. Create a class with the same name. 
2. Add `import UIKit` and remove `import Foundation`
3. Have the class inherit from `NSObject` and ` UIPickerViewDataSource`. NSObject should be first b/c it is the class our class is [inheriting](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Inheritance.html) from while UIPickerViewDataSource is a protocol.
4. At this point the compiler will complain b/c your new class does not contain all the methods in the UIPickerViewProtocol. CMD Click the UIPickerViewDataSource in XCode to see the two methods you need to impliment. Add the two required methods, returning whatever values you want. 

	![compiler error](https://github.com/kyle-dorman/UnitConverter/raw/master/ReadmeImages/UnitConverterError.png "compiler error")
5. Run the app. 
6. Nothing happened? Why? Because we forgot to tell the UI element about its new fancy data source. 
7. Add a let variable "temperatureRange" to the view controller with type TemperatureRange. 
8. Instantiate the TemperatureRange before the `super.init`
9. AFTER (not before) the `super.init` set the uipickerview's [datasource](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIPickerView_Class/#//apple_ref/occ/instp/UIPickerView/dataSource) to the unit converter. 
10. Run the app. If you see question marks, good job! 
11. Our class is called TemperatureRange but we haven't actually created a temperature range. Create an array called "values" with all the values you think someone might want to convert from Celcius to Faherenheit. There are many ways to do this. One way is to creae a [Range](http://swiftdoc.org/v2.2/type/Range/) and convert it to an array. Confused? Use Google. 
12. Instead of using random values for our two DataSource functions, return 1 for number of sections and the [count](http://swiftdoc.org/v2.2/protocol/CollectionType/#var-count_-self-index-distance) for the number of rows. 
13. Run the app. Still seeing question marks? Good. 

## Step 4: Show temperatures in the picker view
1. Add an [extension](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Extensions.html) to your `UnitConverterViewController`. The extension should inherit from `UIPickerViewDelegate`. 
2. All the `UIPickerViewDelegate` methods are optional so everything should still compile. 
3. To show a title instead of a question mark add the method

	```
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
	```
in the extension. Get the string from the `TemperatureRange` values variable and the row number. 
4. If you feel like being fancy, use string interpolation to include "°C".
5. Below the line where you set the `UIPickerView`'s datasource set the `delegate` equal to `self`.
6. Run the app. See numbers/strings? Awesome keep going. 

## Step 5: Listen for events on the picker view
1. Look at the list of `UIPickerViewDelegate` methods and determine which one will tell you when the value of the picker view has changed. 
2. Add this method to your `UnitConverterViewController` extension. 
3. Inside the method, print the value of the row selected. 
4. Run the app with the debug area open. When you change the value in the picker view, you should see the value printed to the debug console. 
5. Remove the code to print the selected value. Instead, update the `temperatureLabel` to selected value. 
6. Run the app. If the label is updating, good job. Keep going. If not, add some `print` statements to make sure you sure listening to the value correctly. 

## Step 6: Conversions
1. Showing the selection is Celcius is fun, but what really want to do is convert the Farhenheit and dislay that number. (See Goal above)
2. Create a new Swift file called UnitConverter and a `struct` with the same name. 
3. Inside the struct, add a [static](http://www.codingexplorer.com/instance-methods-and-type-methods-in-swift/) method `degreesFahrenheit` which takes a celcius integer and converts it to a Fahrenheit integer.
4. Back in the `UnitConverterViewController`, change the value in the label from the celcius value to the converted Fahrenheit value. 
5. Run the app. 0°C is 32°F and the human body runs at 37°C (98.6). 

## Step 7: Test your unit converter
1. Testing he UI can be difficult and error prone, so any time we can test a piece of logic that our UI depends on, we should. 
2. Right click on the Tests directory and add a Unit Test file call CelciusUnitConverterTests. Make sure you add it to the UnitConverterTests target not the UnitConverter target (the app).

	![unit converter tests](https://github.com/kyle-dorman/UnitConverter/raw/master/ReadmeImages/UnitConverterTests.png "test target")
3. Remove the timing tests. 
4. Import the app, look at `UnitConverterViewControllerTests` for reference. 
5. Write a few tests to make sure the unit converter works as exptected. `XCTAssertEqual` is your friend. 
6. Run tests using CMD U. 

## Step 8: Save previously selected rows
1. You might have noticed that every time you restart the app, the selected row is the very first value in your temperatue range. It doesn't have to be. 
2. After setting the onstraints in `viewDidLoad`, use `UIPickerView`'s selectRow method to select a different row. The middle of the range is a good place to start. The component should be 0 and do not animate it. 
3. Run the app. Make sure setting the picker row works. 
4. Notice that the value in the label does not change. Although we set the value, no one told the delegate the value was changed. After calling `selectRow`, call the view controller's `pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)`.
5. Run the app. The label should now change. 
6. Great! Now we can scroll in either direction. But it would be even better if the app remembered what we selected previously. To do this, we will use [NSUserDefaults](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/).
7. In the `UnitConverterViewController` extension, create a method `saveSelectedRow(row: Int)`.
8. Inside this method, first get the standard defaults

	```
	let defaults = NSUserDefaults.standardUserDefaults()
	```
9. Set the integer for the key `"SelectedUnitConvertedRow"`.
10. Make sure you save the row every time the user selects a new row. 
11. Create a private method `initialPickerRow() -> Int` inside `UnitConverterViewController` which gets the selected row. You can read from `NSUserDefaults using `objectForKey`. `objectForKey` returns an `AnyObject`. You will need to [type cast](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TypeCasting.html) it to an integer. Note: The first time the user opens the app, there won't be a saved row. Think about what to do in that case. 
12. Before calling `selectRow` on the UIPickerView, get the `initialPickerRow`. 
13. Run the app. Test until you are happy with the results. 
14. Congratulations, you are DONE!

## Advanced
1. Allow the user to toggle between converting from Celcius to Fahrenheit and Fahrenheit to Celcius. 
2. Select between Celcius, Fahrenheit and Kelvin.  





