//
//  ViewController.swift
//  SearchFlights
//
//  Created by Jiří Hroník on 25.02.16.
//  Copyright © 2016 Jiří Hroník. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var flightsCollection: [Flight] = []
    // var flightsCollection = Array <Flight>()
    
    @IBAction func showActionSheet(sender: UIBarButtonItem) {
        func reloadData () {
            self.tableView.reloadData()
            self.tableView.setContentOffset(CGPoint.zero, animated: true)
        }
        
        let optionMenu = UIAlertController(title: nil, message: "Sort by:", preferredStyle: .ActionSheet)
        
        let sortByPriceOption = UIAlertAction(title: "Price", style: .Default, handler: { (alert: UIAlertAction!) -> Void in
            self.flightsCollection.sortInPlace({$0.price < $1.price})
            reloadData()
        })
        
        let sortByNumberOfTransfers = UIAlertAction(title: "Number of Transfers", style: .Default, handler: { (alert: UIAlertAction!) -> Void in
            self.flightsCollection.sortInPlace({$0.numberOfTransfers < $1.numberOfTransfers})
            reloadData()
        })
        
        let sortByDepartureTime = UIAlertAction(title: "Departure Time", style: .Default) { (alert: UIAlertAction!) -> Void in
            self.flightsCollection.sortInPlace({$0.departureTimeUTC.timeIntervalSince1970 < $1.departureTimeUTC.timeIntervalSince1970})
            self.tableView.reloadData()
            reloadData()
        }
        
        let cancelOption = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (alert: UIAlertAction!) -> Void in
            // do nothing
        })
        
        optionMenu.addAction(sortByPriceOption)
        optionMenu.addAction(sortByNumberOfTransfers)
        optionMenu.addAction(sortByDepartureTime)
        optionMenu.addAction(cancelOption)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        let file = ("flights", "json")
        let json = JSONFromFile(file: file)
        
        if let jsontest = json.JSON {
            if let dataArray = jsontest["data"] as? Array <AnyObject> {
                for asset in dataArray {
                    if let item = asset as? NSDictionary {
                        let flightSlice = Flight(data: item)
                        flightsCollection.append(flightSlice)
                    }
                }
            }
            
        } else {
            print("There was an error")
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flightsCollection.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TableViewCellIdentifier"
        let cellData = self.flightsCollection[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd.MM hh:mm"
        
        cell.fromLabel.text = cellData.cityFrom
        cell.toLabel.text = cellData.cityTo
        cell.priceLabel.text = "\(cellData.price) €"
        cell.numberOfTransfersLabel.text = String(cellData.numberOfTransfers)
        cell.arrivalTimeLabel.text = String(dateFormatter.stringFromDate(cellData.arrivalTimeUTC))
        cell.departureTimeLabel.text = String(dateFormatter.stringFromDate(cellData.departureTimeUTC))
        
        return cell
    }
    
// TODO - detail of the cell
    
//    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        print("Selected row \(indexPath)")
//        
//        // let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! TableViewCell
//            
//        // self.valueToPass = currentCell.priceLabel.text!
//        
//        performSegueWithIdentifier("ShowDetailSegueIdentifier", sender: self)
//    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "DetailViewSegueIdentifier") {
//            let viewController = segue.destinationViewController as! DetailViewController
//            
//            if let selectedCell = sender as? TableViewCell {
//                let indexPath = tableView.indexPathForCell(selectedCell)
//                let data = flightsCollection[indexPath!.row]
//                viewController.price = data.price
//            }
//        }
//    }

}