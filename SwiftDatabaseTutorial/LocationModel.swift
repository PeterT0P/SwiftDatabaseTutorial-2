//
//  LocationModel.swift
//  SwiftDatabaseTutorial
//
//  Created by Christopher Ching on 2017-06-10.
//  Copyright © 2017 Christopher Ching. All rights reserved.
//

import UIKit

class LocationModel: NSObject {

    //properties
    
    var jobID: String?
    var dueDate: String?
    var siteCode: String?
    var siteName: String?
    var buildingName: String?
    var cabinetName: String?
    var switchID: String?
    
    
    
   
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(jobID: String, dueDate: String, siteCode: String, siteName: String, buildingName: String, cabinetName: String, switchID: String) {
        
        self.jobID = jobID
        self.dueDate = dueDate
        self.siteCode = siteCode
        self.siteName = siteName
        self.buildingName = buildingName
        self.cabinetName = cabinetName
        self.switchID = switchID
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "JobID: \(String(describing: jobID)), DueDate: \(String(describing: dueDate)), SiteCode: \(String(describing: siteCode)), SiteName: \(String(describing: siteName)), BuildingName: \(String(describing: buildingName)), CabinetName: \(String(describing: cabinetName)), SwitchID: \(String(describing: switchID))"
        
    }
    
}
