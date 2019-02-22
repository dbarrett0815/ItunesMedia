//
//  ItunesMediaItemCell.swift
//  ItunesMedia
//
//  Created by Davone Barrett on 2/22/19.
//  Copyright © 2019 Davone Barrett. All rights reserved.
//

import UIKit

class ItunesMediaItemCell: UITableViewCell {
    
    // MARK: - Variables
    var artworkImageView: UIImageView!
    var artistNameLabel: UILabel!
    var mediaNameLabel: UILabel!
    
    var media: ItunesMedia? {
        didSet {
            artistNameLabel.text = media?.artistName
            mediaNameLabel.text = media?.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell() {
        setupImageView()
        setupInfoStackView()
    }
    
    private func setupImageView() {
        artworkImageView = UIImageView()
        
        // constraints for artworkImageView
        artworkImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(artworkImageView)
        
        artworkImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        artworkImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        artworkImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        artworkImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0)
    }
    
    private func setupInfoStackView() {
        artistNameLabel = UILabel()
        mediaNameLabel = UILabel()
        
        let stackView = UIStackView(arrangedSubviews: [artistNameLabel, mediaNameLabel])
        stackView.axis = .vertical
        
        // constraints for the info stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 20).isActive = true
        
    }

}
