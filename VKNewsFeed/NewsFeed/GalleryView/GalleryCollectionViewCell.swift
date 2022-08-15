//
//  GalleryCollectionViewCell.swift
//  VKNewsFeed
//
//  Created by Marina on 15.08.22.
//

import Foundation
import  UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let myImageView: WebImageView = {
       let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .green
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
    
        addSubview(myImageView)
        // myImageView constraints
        myImageView.fillSuperview()
    }
    
    override func prepareForReuse() {
        myImageView.image = nil
    }
    
    func set(imageUrl: String?) {
        myImageView.set(imageURL: imageUrl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
