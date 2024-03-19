//
//  InstagramPostViewController+CollectionView.swift
//  InstagramPhotoCollectionViews
//
//  Created by Reuben Simphiwe Kuse on 2024/03/19.
//

import Foundation
import UIKit

extension InstagramPostViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 620)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let postCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstaPostCollectionViewCellID", for: indexPath) as! InstaPostCollectionViewCell
        return postCollectionCell
    }
}
