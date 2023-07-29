//
//  ProfileTabsCollectionReusableView.swift
//  instagram
//
//  Created by Mansoor K on 29/07/23.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
     static let identifier = "ProfileTabsCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
