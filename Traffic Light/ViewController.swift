//
//  ViewController.swift
//  Traffic Light
//
//  Created by g.semshchikov on 24.08.2020.
//  Copyright © 2020 g.semshchikov. All rights reserved.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet var redColor: UIView!
    @IBOutlet var yellowColor: UIView!
    @IBOutlet var greenColor: UIView!
    @IBOutlet var nextButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        nextButton.layer.cornerRadius = 10
        
        redColor.alpha = lightIsOff
        yellowColor.alpha = lightIsOff
        greenColor.alpha = lightIsOff
    }

    override func viewWillLayoutSubviews() {
        redColor.layer.cornerRadius = redColor.frame.width / 2
        yellowColor.layer.cornerRadius = yellowColor.frame.width / 2
        greenColor.layer.cornerRadius = greenColor.frame.width / 2
    }
    
    @IBAction func buttonPressed() {
        
        nextButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            greenColor.alpha = lightIsOff
            redColor.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redColor.alpha = lightIsOff
            yellowColor.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenColor.alpha = lightIsOn
            yellowColor.alpha = lightIsOff
            currentLight = .red
        }
    }
}

