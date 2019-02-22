//
//  Extentions.swift
//  ItunesMedia
//
//  Created by Davone Barrett on 2/22/19.
//  Copyright © 2019 Davone Barrett. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {    
    func showCenterText(_ centerText: String) {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.textAlignment = .center
        textLabel.center = self.center
        textLabel.text = centerText
        backgroundView = textLabel
        separatorStyle = .none
    }
    
    func showCenterTextWithLoadingIndicator(_ text: String) {
        
        separatorStyle = .none
        
        let loadingLabel = UILabel()
        loadingLabel.text = text
        loadingLabel.textColor = .white
        addSubview(loadingLabel)
        
        let activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)
        
        let stackView = UIStackView(arrangedSubviews: [loadingLabel, activityIndicator])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.center = center
        
        backgroundView = UIView(frame: frame)
        backgroundView?.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: backgroundView!.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: backgroundView!.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    func hideCenterText() {
        backgroundView = nil
        separatorStyle = .singleLine
    }
}
