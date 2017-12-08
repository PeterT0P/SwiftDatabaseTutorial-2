//
//  HomeModel.swift
//  SwiftDatabaseTutorial
//
//  Created by Christopher Ching on 2017-06-10.
//  Copyright © 2017 Christopher Ching. All rights reserved.
//

import UIKit

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class HomeModel: NSObject {

    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://www.jamit.ezyro.com/service.php/" //this will be changed to the path where service.php lives
 
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }

    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = LocationModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let jobID = jsonElement["JobID"] as? String,
                let dueDate = jsonElement["DueDate"] as? String,
                let siteCode = jsonElement["SiteCode"] as? String,
                let siteName = jsonElement["SiteName"] as? String,
                let buildingName = jsonElement["BuildingName"] as? String,
                let cabinetName = jsonElement["CabinetName"] as? String,
                let switchID = jsonElement["SwitchID"] as? String
                
            
            
            {
                
                location.jobID = jobID
                location.dueDate = dueDate
                location.siteCode = siteCode
                location.siteName = siteName
                location.buildingName = buildingName
                location.cabinetName = cabinetName
                location.switchID = switchID
                
            }
            
            locations.add(location)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }

}
