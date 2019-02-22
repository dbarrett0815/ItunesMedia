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
    let mediaCellId = "mediaCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchItunesMedia()
    }
    
    private func setupView() {
        title = "Itunes Media"
        registerCells()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .black
    }
    
    private func registerCells() {
        tableView.register(ItunesMediaItemCell.self , forCellReuseIdentifier: mediaCellId)
    }
    
    private func fetchNewApps() {
        let newAppsUrl = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/10/explicit.json")!
        
        // get the data for the new apps
        URLSession.shared.dataTask(with: newAppsUrl) { (data, response, error) in
            // check if error has occured. If so show error alert
            if error != nil {
                self.showErrorAlert()
                return
            }
            
            guard let responseData = data else {return}
            do {
                let feedReponse = try JSONDecoder().decode(ItunesFeedResponse.self, from: responseData)
                
                DispatchQueue.main.async {
                    self.feeds.append(feedReponse.feed)
                    self.tableView.reloadData()
                }
                
            } catch {
                self.showErrorAlert()
                print(error)
            }
        }.resume()

    }
    
    private func fetchNewMusic() {
        let newMusicUrl = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/new-releases/all/10/explicit.json")!
        
        // get the data for the new music
        URLSession.shared.dataTask(with: newMusicUrl) { (data, response, error) in
            // check if error has occured. If so show error alert
            if error != nil {
                self.showErrorAlert()
                return
            }
            
            guard let responseData = data else {return}
            do {
                let feedReponse = try JSONDecoder().decode(ItunesFeedResponse.self, from: responseData)
                
                DispatchQueue.main.async {
                    self.feeds.append(feedReponse.feed)
                    self.tableView.reloadData()
                }
                
            } catch {
                self.showErrorAlert()
                print(error)
            }
        }.resume()
    }
    
    /// Gets new apps and new itunes music. A network call like this would typically go in its own class of other network functions
    private func fetchItunesMedia() {
        fetchNewMusic()
        fetchNewApps()
    }
    
    /// Shows an alert that an error has occured. Typically we will check what kind of error and show the correct alert.
    private func showErrorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "An unknown error has occured please try again later", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mediaCellId, for: indexPath) as! ItunesMediaItemCell
        
        let feed = feeds[indexPath.section]
        let itunesMedia = feed.media[indexPath.row]
        
        cell.media = itunesMedia
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
    }
    
}
