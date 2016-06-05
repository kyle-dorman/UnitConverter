/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    private let userDefaultsLastRowKey = "defaultCelsiusPickerRow"

    private var temperatureLabel: UILabel
    private var celsiusPicker: UIPickerView

    private let temperatureRange: TemperatureRange

    private var dynamicConstraints: [NSLayoutConstraint] = []

    init() {
        temperatureLabel = UILabel()
        celsiusPicker = UIPickerView()

        temperatureRange = TemperatureRange()
        
        super.init(nibName: nil, bundle: nil)

        celsiusPicker.dataSource = temperatureRange
        celsiusPicker.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        celsiusPicker.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(temperatureLabel)
        view.addSubview(celsiusPicker)

        temperatureLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 100).active = true
        temperatureLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true

        celsiusPicker.topAnchor.constraintEqualToAnchor(temperatureLabel.bottomAnchor, constant: 100).active = true
        celsiusPicker.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true

        let row = initialPickerRow()
        celsiusPicker.selectRow(row, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: row, inComponent: 0)
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        NSLayoutConstraint.deactivateConstraints(dynamicConstraints)

        dynamicConstraints = []

        NSLayoutConstraint.activateConstraints(dynamicConstraints)
    }

    // MARK: UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        return "\(celsiusValue)°C"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row)
        saveSelectedRow(row)
    }

    // MARK: Private
    private func initialPickerRow() -> Int {
        let savedRow = NSUserDefaults.standardUserDefaults().objectForKey(userDefaultsLastRowKey) as? Int
        if let row = savedRow  {
            return row
        } else {
            return celsiusPicker.numberOfRowsInComponent(0) / 2
        }
    }

    private func displayConvertedTemperatureForRow(row: Int) {
        let degreesCelsius = temperatureRange.values[row]
        temperatureLabel.text = "\(UnitConverter.degreesFahrenheit(degreesCelsius))°F"
    }

    private func saveSelectedRow(row: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

