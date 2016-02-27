//
//  ViewController.swift
//  SearchFlights
//
//  Created by Jiří Hroník on 25.02.16.
//  Copyright © 2016 Jiří Hroník. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let url = "https://api.wunderground.com/api/7ca42c8c31208b05/conditions/q/CA/Brno.json"
        // let url = "asdf  dsf"
//        
//        let json = JSONFromURL(url: url)
//        if let jsontest = json.JSON {
//            print("It's okay, the JSON is: \(jsontest)")
//        } else {
//            print("There was an error!")
//        }
        
        let file = ("adfs", "json")
        let json = JSONFromFile(file: file)
        
        if let jsontest = json.JSON {
            print("It's okay, the JSON is: \(jsontest)")
        } else {
            print("There was an error")
        }
        
        // print(jsonParser.getJsonFromFile("flights", filetype: "json"))
        // print(jsonParser.getJsonFromURL("https://api.wunderground.com/api/7ca42c8c31208b05/conditions/q/CA/Brno.json"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

