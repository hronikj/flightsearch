//
//  TableViewCell.swift
//  SearchFlights
//
//  Created by Jiří Hroník on 28.02.16.
//  Copyright © 2016 Jiří Hroník. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numberOfTransfersLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    
}
