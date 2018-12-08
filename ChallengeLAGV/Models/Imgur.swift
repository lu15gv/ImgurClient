//
//  Imgur.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import Foundation

class Imgur {
    var posts:[Post]?
    private var page = 1
    
    private enum CodingKeys: String, CodingKey {
        case posts = "data"
    }
    
    func getPosts(_ about:String, withVideos flag: Bool, completion: @escaping (_ isFirstPage:Bool, _ isEmpty: Bool)->()){
        if posts != nil{
            page += 1
        }
        downloadPosts(about, withVideos: flag) { (posts) in
            if self.posts != nil{
               self.posts! += posts
            }else{
                self.posts = posts
            }
            let isFirstPage = self.page == 1 ? true : false
            let isEmpty = self.posts?.count == 0 ? true : false
            
            completion(isFirstPage,isEmpty)
        }
    }
    
    private func downloadPosts(_ about:String, withVideos: Bool, completion: @escaping ([Post])->()){
        ImgurService.shared.getPosts(about, page: page) { (posts) in
            if withVideos{
                completion(posts)
            }else{
                let posts = self.depureVideosOf(posts: posts)
                completion(posts)
            }
        }
    }
    private func depureVideosOf(posts: [Post])->[Post]{
        var newPosts = [Post]()
        for post in posts{
            let thumbnail = post.getThumnailURL()
            if !thumbnail.isVideo{
                newPosts.append(post)
            }
        }
        return newPosts
    }
}
