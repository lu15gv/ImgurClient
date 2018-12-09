//
//  Post.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit

import Alamofire
import AlamofireImage

class Post {
    let title: String?
    let images:[Image]?
    let link: String?
    let type: String?
    let points: Int
    var thumbnail: UIImage?
    var dowloadImagetask: URLSessionTask?
    
    init(title: String?, images: [Image]?, link: String?, type: String?, points: Int?) {
        self.title = title
        self.images = images
        self.link = link
        self.type = type
        if let points = points{
            self.points = points
        }else{
            self.points = 0
        }
        
    }
    
    func getThumnailURL() -> (isVideo: Bool, url: URL?){
        if type == "video/mp4"{
            return (true, nil)
        }
        if let image = images?.first, image.type == "video/mp4"{
            return (true, nil)
        }
        return (false,thumnailURL())
    }
    
    private func thumnailURL() -> URL?{
        if let link = link, type != nil, let url = URL(string: link) {
            return url
        }else if let link = images?.first?.link, let url = URL(string: link){
            return url
        }
        return nil
    }
    func downloadImage(completion: @escaping ()->()){
        if thumbnail != nil{
            completion()
            return
        }
        guard let url = getThumnailURL().url else {return}
        let task = Alamofire.request(url).responseImage {[weak self] response in
            if let image = response.result.value {
                self?.resize(image: image)
                completion()
            }
        }.task
        self.dowloadImagetask = task
        task?.resume()
    }
    private func resize(image: UIImage){
        let height = UIScreen.main.bounds.size.height * 0.5
        let width = UIScreen.main.bounds.size.width * 0.8
        let scaledImage = image.af_imageAspectScaled(toFit: CGSize(width: width, height: height))
        self.thumbnail = scaledImage
    }
}
