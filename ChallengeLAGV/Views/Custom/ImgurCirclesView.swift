//
//  imgurCirclesView.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/7/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit

@IBDesignable
class ImgurCirclesView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
