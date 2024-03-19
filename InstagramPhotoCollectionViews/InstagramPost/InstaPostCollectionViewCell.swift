//
//  InstaPostCollectionViewCell.swift
//  InstagramPhotoCollectionViews
//
//  Created by Reuben Simphiwe Kuse on 2024/03/16.
//

import Foundation
import UIKit

class InstaPostCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let imagePostCellHeight = CGFloat(450)
    
    lazy var userProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lord_KO")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var usernameTitlelabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.078, green: 0.086, blue: 0.098, alpha: 1)
        label.text = "Lord_KO"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var activityTitlelabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.078, green: 0.086, blue: 0.098, alpha: 1)
        label.text = "🎵 Blaudiss • Eight Twenty Two"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var usernameActivityTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameTitlelabel, activityTitlelabel])
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Three Dots
    lazy var postSettingsButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "threeDots_icon")
        button.layer.cornerRadius = 10
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var postImageCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        flowLayout.minimumLineSpacing = 0.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
//        flowLayout.minimumInteritemSpacing = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.green
        return collectionView
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "likes_icon")
        button.layer.cornerRadius = 30
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "instagram comment_icon")
        button.layer.cornerRadius = 40
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "share_icon")
        button.layer.cornerRadius = 30
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var likeCommentShareButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.layer.cornerRadius = 40
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "bookmark_icon")
        button.setImage(icon, for: .normal)
        button.layer.cornerRadius = 10
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCollectionView()
        registerCollectionCells()
    }

    func setupCollectionView() {
        addSubview(userProfileImage)
        addSubview(usernameActivityTitleStackView)
        addSubview(postSettingsButton)
        addSubview(postImageCollectionView)
        addSubview(likeCommentShareButtonStackView)
        addSubview(bookmarkButton)
        
        userProfileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userProfileImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userProfileImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        userProfileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
//
        usernameActivityTitleStackView.leftAnchor.constraint(equalTo: userProfileImage.rightAnchor, constant: 12).isActive = true
        usernameActivityTitleStackView.centerYAnchor.constraint(equalTo: userProfileImage.centerYAnchor).isActive = true
//        usernameActivityTitleStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        postSettingsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        postSettingsButton.centerYAnchor.constraint(equalTo: usernameActivityTitleStackView.centerYAnchor).isActive = true
        postSettingsButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        postSettingsButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        postImageCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        postImageCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        postImageCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        postImageCollectionView.heightAnchor.constraint(equalToConstant: imagePostCellHeight).isActive = true
        
        likeCommentShareButtonStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        likeCommentShareButtonStackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        likeCommentShareButtonStackView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        likeCommentShareButtonStackView.topAnchor.constraint(equalTo: postImageCollectionView.bottomAnchor, constant: 10).isActive = true
        
        bookmarkButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        bookmarkButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        bookmarkButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        bookmarkButton.centerYAnchor.constraint(equalTo: likeCommentShareButtonStackView.centerYAnchor).isActive = true
        
     }
    
    func registerCollectionCells() {
        postImageCollectionView.register(InstaImageCell.self, forCellWithReuseIdentifier: "InstaImageCellID")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: imagePostCellHeight)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let postCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstaImageCellID", for: indexPath) as! InstaImageCell
        return postCollectionCell
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
