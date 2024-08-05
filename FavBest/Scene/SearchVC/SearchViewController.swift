//
//  SearchViewController.swift
//  FavBest
//
//  Created by Deniz Otlu on 30.07.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBar = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        configureSearhBar()

    }
    
    
    private func configureSearhBar() {
        navigationItem.searchController = searchBar
        
    }
    
    
    
    
}
