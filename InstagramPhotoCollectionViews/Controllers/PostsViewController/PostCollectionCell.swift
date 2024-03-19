//
//  InstagramCollectionCell.swift
//  InstagramPhotoCollectionViews
//
//  Created by Reuben Simphiwe Kuse on 2024/03/14.
//

import Foundation
import UIKit

class PostCollectionCell: UICollectionViewCell {
    
    lazy var instaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lord_KO")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
 
    func setupView() {
        addSubview(instaImageView)

        instaImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        instaImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        instaImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        instaImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
