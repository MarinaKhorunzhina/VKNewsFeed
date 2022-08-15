//
//  GalleryCollectionView.swift
//  VKNewsFeed
//
//  Created by Marina on 15.08.22.
//

import Foundation
import UIKit


class GalleryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var photos = [FeedCellPhotoAttachementViewModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
      
        backgroundColor = .yellow
        
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
    }
    
    func set(photos: [FeedCellPhotoAttachementViewModel]) {
        self.photos = photos
        reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.set(imageUrl: photos[indexPath.row].photoUrlString)
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

