//
//  BaseViewController.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/7/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController{
    var indicator: NVActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func addTap(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func configureActivityIndicator(){
        indicator = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width/2 - 25, y: self.view.frame.height/2 - 25, width: 50, height: 50), type: .pacman, color: UIColor.black, padding: 0)
        self.view.addSubview(indicator!)
        indicator!.startAnimating()
    }
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
