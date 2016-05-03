//
//  PhotosGridController.swift
//  PhotosApp
//
//  Created by Felicia Weathers on 5/1/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import Foundation
import UIKit

class PhotosGridController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var photos : [Photo]!
    var cellHeight : CGFloat = 75
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photos"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = self.view.frame.width/4
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
        photos = [Photo]()
        let api = JSONPlaceholderAPI()
        api.loadPhotos(didLoadPhotos)
    }
    
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        collectionView.reloadData()
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        
        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title
        
        asyncLoadPhotoImage(photo, imageView: cell.placeholderImageView)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func asyncLoadPhotoImage(photo: Photo, imageView: UIImageView) {
        
        let downloadQueue = dispatch_queue_create("com.PhotosApp.processdownload", nil)
        
        dispatch_async(downloadQueue) {
            let data = NSData(contentsOfURL: NSURL(string: photo.thumbnailUrl)!)
            
            var image : UIImage?
            if data != nil {
                photo.imageData = data
                image = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
    }
}