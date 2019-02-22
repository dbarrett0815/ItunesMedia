//
//  ItunesMediaViewController.swift
//  ItunesMedia
//
//  Created by Davone Barrett on 2/22/19.
//  Copyright © 2019 Davone Barrett. All rights reserved.
//

import UIKit

class ItunesMediaViewController: UITableViewController {
    
    var feeds = [ItunesFeed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = "Itunes Media"
    }
}

// MARK: - UITableViewDelegate && UITableViewDataSource
extension ItunesMediaViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return feeds.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds[section].media.count
    }
    
}
