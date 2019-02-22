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
    var artworkImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    var artistNameLabel = UILabel()
    var mediaNameLabel =  UILabel()
    
    var media: ItunesMedia? {
        didSet {
            guard let media = media else {return}
            artistNameLabel.text = media.artistName
            mediaNameLabel.text = media.name
            
            guard let artworkUrl = URL(string: media.artworkUrl) else {return}
            getArtworkFromUrl(artworkUrl)
        }
    }
    
    private func getArtworkFromUrl(_ url: URL) {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        
        // constraints
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        artworkImageView.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: artworkImageView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: artworkImageView.centerYAnchor).isActive = true
        
        activityIndicator.startAnimating()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let responseData = data else {return}
            let image = UIImage.init(data: responseData)
            
            DispatchQueue.main.async {
                self.artworkImageView.image = image
                activityIndicator.stopAnimating()
            }
            
        }.resume()
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup
    
    private func setupCell() {
        setupImageView()
        setupInfoStackView()
        
        contentView.backgroundColor = .black
    }
    
    private func setupImageView() {
        artworkImageView.layer.cornerRadius = 15
        artworkImageView.layer.masksToBounds = true
        artworkImageView.contentMode = .scaleAspectFit
        
        // constraints for artworkImageView
        artworkImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(artworkImageView)
        
        artworkImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        artworkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        artworkImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        artworkImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        artworkImageView.heightAnchor.constraint(equalToConstant: 60).isActive =  true
    }
    
    private func setupInfoStackView() {
        artistNameLabel.textColor = .white
        artistNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        mediaNameLabel.textColor = .white
        
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(mediaNameLabel)
        
        let stackView = UIStackView(arrangedSubviews: [artistNameLabel, mediaNameLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        // constraints for the info stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 00).isActive = true
        stackView.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 20).isActive = true
        
    }

}
