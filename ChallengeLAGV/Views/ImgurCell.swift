//
//  ImgurCell.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit

@IBDesignable
class ImgurCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.black.cgColor
        }
    }
    func fillWith(_ post: Post, with tag: Int){
        titleLabel.text = post.title
        setThumbnail(of: post, with: tag)
    }
    func setThumbnail(of post: Post, with tag: Int){
        self.imageView.image = nil
        post.downloadImage {
            DispatchQueue.main.async {
                if self.tag == tag{
                    self.imageView.image = post.thumbnail
                }
            }
        }
    }
}
