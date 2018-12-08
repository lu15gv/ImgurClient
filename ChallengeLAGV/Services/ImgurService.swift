//
//  ImgurService.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/6/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import Alamofire

class ImgurService {
    static let shared = ImgurService()
    private init(){}
    let headers = ["Authorization": "Client-ID 126701cd8332f32"]
    func getPosts(_ about: String, page: Int, completion: @escaping ([Post]) -> Void){
        let parameters: Parameters = ["q": about]
        Alamofire.request("https://api.imgur.com/3/gallery/search/time/\(page)", method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: headers).responseJSON { response in
            switch response.result {
            case .success(let JSON):
                let response = JSON as! [String:Any]
                let posts = ImgurParse.posts(with: response)
                completion(posts)
            case .failure(let error):
            print(error)
            }
        }
    }
}
