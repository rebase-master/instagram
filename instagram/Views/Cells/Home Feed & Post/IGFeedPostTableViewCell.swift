//
//  IGFeedPostTableViewCell.swift
//  instagram
//
//  Created by Mansoor K on 28/07/23.
//

import SDWebImage
import AVFoundation
import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostTableViewCell"
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = nil
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var player: AVPlayer?
    private var playerLayer = AVPlayerLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.addSublayer(playerLayer)
        contentView.addSubview(postImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with post: UserPost) {
        //configure the cell
        postImageView.image = UIImage(named: "test")
        return
        
        switch post.postType {
        case .photo:
            //show image
            postImageView.sd_setImage(with: post.postURL, completed: nil)
        case .video:
            //load and play video
            player = AVPlayer(url: post.postURL)
            playerLayer.player = player
            playerLayer.player?.volume = 0
            playerLayer.player?.play()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = contentView.bounds
        postImageView.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }
}
