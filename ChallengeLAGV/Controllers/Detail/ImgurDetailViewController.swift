//
//  ImgurDetailViewController.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit

class ImgurDetailViewController: UIViewController {
    var post: Post?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = post?.title
        titleLabel.text = post?.title
        loadImage()
    }
    func loadImage(){
        imageView.image = post?.thumbnail
        /*if let url = post?.url() {
            //imageView.kf.setImage(with: url)
        }*/
    }
}
