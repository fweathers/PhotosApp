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
    
    func loadPhotos(completion: (([Photo]) -> Void)!) {
        
        let urlString = "http://jsonplaceholder.typicode.com/photos?albumId=1"
        
        let session = NSURLSession.sharedSession()
        let photosUrl = NSURL(string: urlString)
        
        let task = session.dataTaskWithURL(photosUrl!) {
            (data, response, error) -> Void in
            
            do {
                let photosData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
                
                var photos = [Photo]()
                
                for photo in photosData {
                    let photo = Photo(data: photo as! NSDictionary)
                    photos.append(photo)
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(photos)
                    }
                }
            } catch let error {
                print("JSON Serialization failed. Error: \(error)")
            }
        }
        
        task.resume()
    }
}