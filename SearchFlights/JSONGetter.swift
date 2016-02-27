//
//  File.swift
//  SearchFlights
//
//  Created by Jiří Hroník on 25.02.16.
//  Copyright © 2016 Jiří Hroník. All rights reserved.
//  Small stupid class with bad design, returning JSON from url or file in project

import Foundation

class JSONGetter {
    var JSON: NSDictionary? {
        get {
            return self.getJSON()
        }
    }
    
    func getJSON() -> NSDictionary? {
        preconditionFailure("This method must be overriden!")
    }
}

class JSONFromURL: JSONGetter {
    let url: String
    
    init (url: String) {
        self.url = url
    }
    
    override func getJSON () -> NSDictionary? {
        let json = NSDictionary()
        do {
            if let url = NSURL(string: self.url) {
                let data = try NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    if let json: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                        return json
                    }
                }
                    
                catch {
                    print("Error in JSON serialization!")
                    return nil
                }
            } else {
                print("Invalid URL!")
                return nil
            }
        }
            
        catch {
            print("Error while loading data from URL!")
            return nil
        }
        
        return json
    }
}

class JSONFromFile: JSONGetter {
    let file: (filename: String, filetype: String)

    init (file: (String, String)) {
        self.file = file
    }
    
    override func getJSON () -> NSDictionary? {
        if let path = NSBundle.mainBundle().pathForResource(self.file.filename, ofType: self.file.filetype) {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                if let json: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    return json
                }
            }
                
            catch  {
                print("Error while loading data from file!")
                return nil
            }
        } else {
            print("Invalid path!")
        }
        
        return nil
    }
}


//class JSONFromFile {
//    var jsonResult: NSDictionary
//    let url: NSURL
//    let file: (filename: String, filetype: String)
//    
//    init (file: (String, String)) {
//        self.file = file
//    }
//    
//    init (url: String) {
//        if let url = NSURL(string: url) {
//            self.url = url
//        }
//    }
//    
//    func getJsonFromFile () -> NSDictionary {
//        if let path = NSBundle.mainBundle().pathForResource(self.file.filename, ofType: self.file.filetype) {
//            do {
//                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
//                if let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
//                    self.jsonResult = jsonResult
//                }
//            }
//                
//            catch  {
//                print("Error while loading data from file!")
//            }
//        }
//    
//        return self.jsonResult
//    }
//    
//    // http://www.learnswift.io/blog/2014/7/30/parsing-json-in-swift
//    
//    func getJSONFromURL() -> NSDictionary {
//        var json: NSDictionary = NSDictionary()
//        do {
//            let data = try NSData(contentsOfURL: self.url, options: NSDataReadingOptions.DataReadingMappedIfSafe)
//            do {
//                if let json: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
//                    return json
//                }
//            }
//            
//            catch {
//                print("Error in JSON serialization!")
//            }
//        }
//        
//        catch {
//            print("Error while loading data from URL!")
//        }
//        
//        return json
//        
//    }

//    func getJsonFromURL () -> NSDictionary {
//        if (self.url != "") {
//            if let url = NSURL(string: self.url) {
//                let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
//                    dispatch_sync(dispatch_get_main_queue(), {
//                        if (error == nil) {
//                            do {
//                                print("inside closure")
//                                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
//                                    self.jsonResult = jsonResult
//                                }
//                            }
//                            catch {
//                                print("Error in JSON serialization!")
//                            }
//                        } else {
//                            print("Error loading data!")
//                        }
//                    })
//                }
//                task.resume()
//                print(self.jsonResult)
//            }
//        }
//        
//        return self.jsonResult
//    }
