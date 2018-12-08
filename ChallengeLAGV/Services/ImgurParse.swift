//
//  ImgurParse.swift
//  ChallengeLAGV
//
//  Created by Gomez Luis on 12/7/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import Foundation

class ImgurParse {
    static func posts(with json: [String:Any]) -> [Post]{
        guard let postsDic = json["data"] as? [[String:Any]] else {return []}
        var posts = [Post]()
        for postDic in postsDic {
            
            let title = postDic["title"] as? String
            let link = postDic["link"] as? String
            let type = postDic["type"] as? String
            
            if let imagesDic = postDic["images"] as? [[String:Any]]{
                var images = [Image]()
                for imageDic in imagesDic {
                    let linkImage = imageDic["link"] as? String
                    let descriptionImage = imageDic["description"] as? String
                    let typeImage = imageDic["type"] as? String
                    let image = Image(type: typeImage, description: descriptionImage, link: linkImage)
                    images.append(image)
                }
                posts.append(Post(title: title, images: images, link: link, type: type))
            }else{
                posts.append(Post(title: title, images: nil, link: link, type: type))
            }
        }
        return posts
    }
}
