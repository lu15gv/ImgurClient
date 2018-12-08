//
//  ViewController.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit

class ImgurPostsViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicationsLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!

    var imgur = Imgur()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self
        configureActivityIndicator()
    }

    //MARK: - Retrive Data
    func fetchPosts(){
        guard let search = searchField.text else {return}
        guard search != "" else {return}
        imgur.getPosts(search, withVideos: false) { (isFirstPage, isEmpty) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.indicator?.stopAnimating()
                if isEmpty{
                    self.emptyResponse()
                }else{
                if isFirstPage {
                    self.scrollToBegin()
                    }
                }
            }
        }
    }
    
    func emptyResponse(){
        indicationsLabel.isHidden = false
        indicationsLabel.text = "Parece que tu busqueda no arrojó resultados"
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? ImgurDetailViewController,
            let indexPath = sender as? IndexPath,
            let posts = imgur.posts{
            detailVC.post = posts[indexPath.row]
        }
    }
    private func scrollToBegin(){
        self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
        }
    }
}

//MARK: - TextField Methods
extension ImgurPostsViewController: UITextFieldDelegate{

    @IBAction func startEditing(_ sender: Any) {
        indicationsLabel.isHidden = true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.resignFirstResponder()
        return false
    }
    @IBAction func search(_ sender: Any) {
        searchField.resignFirstResponder()
    }
    @IBAction func endEditing(_ sender: Any) {
        imgur = Imgur()

        indicator?.startAnimating()
        fetchPosts()
    }
}

//MARK: - MemoryWarning
extension ImgurPostsViewController{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        imgur = Imgur()
    }
}
