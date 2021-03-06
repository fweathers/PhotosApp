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
    var timer = NSTimer()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        index = photos.indexOf{$0 === photo}!
        transitionToNextImage()
    }
    
    func transitionToNextImage() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target:self, selector: #selector(PhotosDetailController.transitionImage), userInfo: nil, repeats: true)
    }
    
    func transitionImage() {
        self.photoView.image = UIImage(data: (photos[index].imageData)!)
        index = index + 1
        self.title = String("\(index)/\(photos.count)")
    }
    
    @IBAction func deleteButton(sender: UIBarButtonItem) {
        timer.invalidate()
        
        print("trash")
        
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this photo?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: {(alertAction)in
            print("Confirmed deletion")
            self.transitionToNextImage()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: {(alertAction)in
            alert.dismissViewControllerAnimated(true, completion: nil)
            self.transitionToNextImage()
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}