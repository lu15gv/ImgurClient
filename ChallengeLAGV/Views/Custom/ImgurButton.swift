//
//  ImgurButton.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit

@IBDesignable
class ImgurButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = UIColor(named: "blue")?.cgColor
        }
    }
}
