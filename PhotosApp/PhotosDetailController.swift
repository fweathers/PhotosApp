//
//  PhotosDetailController.swift
//  PhotosApp
//
//  Created by Felicia Weathers on 5/3/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import Foundation
import UIKit

class PhotosDetailController: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    var photo : Photo?
    var photos : [Photo]!
    var selectedPhotoName: String = ""
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitionToNextImage()
    }
    
    func transitionToNextImage() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target:self, selector: #selector(PhotosDetailController.transitionImage), userInfo: nil, repeats: true)
        
    }
    
    func transitionImage() {
        
        let numImages = photos.count
        print("Number of Images: \(numImages)")
        let imagesIndex = Int(numImages - 1)
        var nextImage: UIImage
        
        if self.photoView.image == photos.last!.imageData {
            let firstImage = photos.first
            nextImage = UIImage(data: (firstImage?.imageData)!)!
        } else {
            let x  = photos[imagesIndex - 1]
            nextImage = UIImage(data: (x.imageData)!)!
        }
        //        if self.photoView.image == numImages {
        //            nextImage = photos[0]
        //            self.currentCell = 0
        //        } else {
        //            let x = currentCell + 1
        //            nextImage = photos[x]
        //            self.currentCell = x
        //        }
        
        let image = UIImage(data: (photo?.imageData)!)
        self.photoView.image = image
    }
    
    
    @IBAction func deleteButton(sender: UIBarButtonItem) {
        
        print("trash")
        
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this photo?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: {(alertAction)in
            print("Confirmed deletion")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: {(alertAction)in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}