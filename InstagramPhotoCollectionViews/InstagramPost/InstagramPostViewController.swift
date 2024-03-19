//
//  InstagramPostViewController.swift
//  InstagramPhotoCollectionViews
//
//  Created by Reuben Simphiwe Kuse on 2024/03/16.
//

import UIKit

class InstagramPostViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    lazy var instacollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isScrollEnabled = true
        //collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        flowLayout.minimumLineSpacing = 0
//        flowLayout.minimumInteritemSpacing = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.backgroundColor = UIColor.green
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        registerCollectionCells()
    }

    func setupCollectionView() {
        view.addSubview(instacollectionView)
        
        instacollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        instacollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        instacollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        instacollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        InstacollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        

        
    }
    
    func registerCollectionCells() {
        instacollectionView.register(InstaPostCollectionViewCell.self, forCellWithReuseIdentifier: "InstaPostCollectionViewCellID")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 620)
    }
    
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let postCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstaPostCollectionViewCellID", for: indexPath) as! InstaPostCollectionViewCell
        return postCollectionCell
    }

}

    
    
    
    
//
//    // MARK: - UICollectionViewDataSource
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return post?.postImages.count ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCell", for: indexPath) as! PostImageCell
//        cell.imageView.image = post?.postImages[indexPath.item]
//        return cell
//    }
//
//    // MARK: - UICollectionViewDelegateFlowLayout
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return collectionView.bounds.size
//    }





//    lazy var InstacollectionView: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .vertical
//        flowLayout.minimumLineSpacing = 0
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        collectionView.isPagingEnabled = true
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .green
//        return collectionView
//    }()
//
//  
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .blue
//        setupCollectionView()
//        registerCollectionCells()
//    }
//
//    func setupCollectionView() {
//        view.addSubview(InstacollectionView)
//        InstacollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        InstacollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        InstacollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        InstacollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    }
//
//    func registerCollectionCells() {
//        InstacollectionView.register(InstaPostImageCell.self, forCellWithReuseIdentifier: "InstaPostImageCellID")
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return collectionView.bounds.size
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return instagramPosts.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let postCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstaPostImageCellID", for: indexPath) as! InstaPostImageCell
//        let post = instagramPosts[indexPath.item]
//        postCollectionCell.imageView.image = post.images.first // Displaying only the first image, you can customize as per your logic
//        return postCollectionCell
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
