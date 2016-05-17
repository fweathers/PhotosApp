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
        
    var selectedPhotoName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    //    override func viewWillAppear(animated: Bool) {
    //        [self.view layoutIfNeeded];
    //        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
    
    //    }
}