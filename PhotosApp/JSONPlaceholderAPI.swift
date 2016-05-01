//
//  JSONPlaceholderAPI.swift
//  PhotosApp
//
//  Created by Felicia Weathers on 5/1/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import Foundation

class JSONPlaceholderAPI {
    // This class will contain logic to fetch placeholder photos
    
    func loadPhotos(completion: ((AnyObject) -> Void)!) {
        
        var urlString = "http://jsonplaceholder.typicode.com/photos?albumId=1"
        
        let session = NSURLSession.sharedSession()
        let photosUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(photosUrl!) {
            (data, response, error) -> Void in
            
            if error != nil {
                print(error?.localizedDescription)
            } else {
                
            }
        }
        
        task.resume()
    }
}