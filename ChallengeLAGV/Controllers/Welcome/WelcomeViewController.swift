//
//  WelcomeViewController.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class WelcomeViewController: BaseViewController {
    
    @IBOutlet weak var serachField: ImgurField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addTap()
    }
    @IBAction func search(_ sender: Any) {
        if let text = serachField.text, text != ""{
            performSegue(withIdentifier: "SearchSegue", sender: text)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navController = segue.destination as? UINavigationController,
            let postsVC = navController.viewControllers.first as? ImgurPostsViewController,
            let text = sender as? String{
            postsVC.searchField.text = text
            postsVC.fetchPosts()
        }
    }
}
