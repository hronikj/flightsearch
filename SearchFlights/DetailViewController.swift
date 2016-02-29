//
//  DetailViewController.swift
//  SearchFlights
//
//  Created by Jiří Hroník on 29.02.16.
//  Copyright © 2016 Jiří Hroník. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var price: Int = Int()
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(animated: Bool) {
        print(price)
        //self.priceLabel.text = self.passedValue
        //print(self.priceLabel.text)
    }
}
