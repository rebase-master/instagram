//
//  IGFeedPostInteractionTableViewCell.swift
//  instagram
//
//  Created by Mansoor K on 28/07/23.
//

import UIKit

class IGFeedPostInteractionTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostInteractionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        //configure the cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
