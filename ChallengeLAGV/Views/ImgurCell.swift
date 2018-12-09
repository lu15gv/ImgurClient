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
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet{
            self.layer.borderWidth = 1
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    func fillWith(_ post: Post, with tag: Int){
        titleLabel.text = post.title
        likesLabel.text = String(post.points)
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
