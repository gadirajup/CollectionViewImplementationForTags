//
//  ViewController.swift
//  TagCollectionView
//
//  Created by Prudhvi Gadiraju on 3/20/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var tags = [Tag]()

    let cellIdentifier = "tagCell"
    var tagCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTagCollectionView()
        createDummyTags()
    }
    
    fileprivate func createDummyTags() {
        tags = [
            Tag(name: "Javascript"),
            Tag(name: "Swift"),
            Tag(name: "C++"),
            Tag(name: "Javascript"),
            Tag(name: "Swift"),
            Tag(name: "C++"),
            Tag(name: "Javascript"),
            Tag(name: "Swift"),
            Tag(name: "C++"),
            Tag(name: "Javascript"),
            Tag(name: "Swift"),
            Tag(name: "C++")
        ]
    }
    
    fileprivate func setupTagCollectionView() {
        // Set Layout of Collection View
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 50, height: 24)
        layout.minimumLineSpacing = 2
        
        tagCollectionView = UICollectionView(frame: CGRect(x: 16, y: 48, width: view.frame.width-32, height: 24), collectionViewLayout: layout)
        
        tagCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        view.addSubview(tagCollectionView)
        
        tagCollectionView.backgroundColor = .white
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tagCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TagCollectionViewCell
        cell.cellTag = tags[indexPath.row]
        return cell
    }
}
