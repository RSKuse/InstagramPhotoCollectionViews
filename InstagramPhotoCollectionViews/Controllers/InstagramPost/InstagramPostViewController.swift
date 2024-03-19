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
        collectionView.delegate = self
        collectionView.dataSource = self
        flowLayout.minimumLineSpacing = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
    }
    
    func registerCollectionCells() {
        instacollectionView.register(InstaPostCollectionViewCell.self, forCellWithReuseIdentifier: "InstaPostCollectionViewCellID")
    }
}

