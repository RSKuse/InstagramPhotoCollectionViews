//
//  ViewController.swift
//  InstagramPhotoCollectionViews
//
//  Created by Reuben Simphiwe Kuse on 2024/03/14.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    lazy var imagesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical // Change to vertical scrolling
        flowLayout.minimumLineSpacing = 8 // Spacing between rows
        flowLayout.minimumInteritemSpacing = 8 // Spacing between items in the same row
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupConstraints()
        registerCollectionCells()
    }
    
    func setupConstraints() {
        view.addSubview(imagesCollectionView)

        imagesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imagesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imagesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imagesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func registerCollectionCells() {
        imagesCollectionView.register(InstagramCollectionCell.self, forCellWithReuseIdentifier: "InstagramCollectionCellID")
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let instaCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstagramCollectionCellID", for: indexPath) as! InstagramCollectionCell
//        instaCollectionCell.instaImageView.image = UIImage(named: "sir_NastyC")
        return instaCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate cell size based on the number of items per row and spacing
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = 8
        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacing)
        let cellWidth = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let postViewController = InstagramPostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
    
    

