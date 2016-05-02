//
//  Photos.swift
//  PhotosApp
//
//  Created by Felicia Weathers on 5/1/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import Foundation

class Photo {
    var id : Int!
    var title : String!
    var url : String!
    var thumbnailUrl : String!
    
    var imageData : NSData?
    
    init(data: NSDictionary) {
        
        self.id = data["id"] as! Int
        
        self.title = getStringFromJSON(data, key: "title")
        self.url = getStringFromJSON(data, key: "url")
        self.thumbnailUrl = getStringFromJSON(data, key: "thumbnailUrl")
        
    }
    
    func getStringFromJSON(data: NSDictionary, key: String) -> String {
                
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
}