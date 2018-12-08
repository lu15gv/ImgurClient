//
//  File.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit

@IBDesignable
class ImgurField: UITextField {
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
    @IBInspectable var placeholderColor: UIColor = UIColor.white {
        didSet{
            self.attributedPlaceholder = NSAttributedString(string: "Search",attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        }
    }
}
