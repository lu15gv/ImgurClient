//
//  File.swift
//  ChallengeLAGV
//
//  Created by Luis Antonio Gómez Vázquez on 12/7/18.
//  Copyright © 2018 Luis Antonio Gómez Vázquez. All rights reserved.
//

import UIKit

//MARK: - CollectionView Delegate
extension ImgurPostsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PostDetail", sender: indexPath)
    }
}

//MARK: - CollectionView DataSource
extension ImgurPostsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgur.posts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgurCell", for: indexPath) as! ImgurCell
        cell.tag = indexPath.row
        guard let posts = imgur.posts else {
            return cell
        }
        guard posts.indices.contains(indexPath.row) else {return cell}
        let post = posts[indexPath.row]
        cell.fillWith(post, with: indexPath.row)
        return cell
    }
}

//MARK: - CollectionView Layout
extension ImgurPostsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width / 2 - 5, height: 150)
    }
}

//MARK: - CollectionView Prefetch
extension ImgurPostsViewController: UICollectionViewDataSourcePrefetching{
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            fetchPosts()
        }
    }
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        guard let posts = imgur.posts else {return false}
        return indexPath.row >= posts.count - 1
    }
}
