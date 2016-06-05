//
//  UnitConverterViewController.swift
//  UnitConverter
//
//  Created by Kyle Dorman on 6/5/16.
//  Copyright © 2016 Your School. All rights reserved.
//

import UIKit

class UnitConverterViewController: UIViewController {

    private let temperatureLabel: UILabel

    init() {
        temperatureLabel = UILabel()

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(temperatureLabel)

        temperatureLabel.text = "Test"

        temperatureLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 30).active = true
        temperatureLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true

        super.viewDidLoad()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
