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
    
    var photo : Photo?
    
    
    var selectedPhotoName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(data: (photo?.imageData)!)
        
        self.photoView.image = image
        self.title = photo?.title
    }
}