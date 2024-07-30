//
//  MainTabbarController.swift
//  FavBest
//
//  Created by Deniz Otlu on 29.07.2024.
//

import Foundation
import UIKit
import SnapKit


class MainTabbarController: UITabBarController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        createTabbar()

    }
  
        
    func createTabbar() {

        let vcFirst = UINavigationController(rootViewController: HomeViewController())
        let vcSecond = UINavigationController(rootViewController: UpComingViewController())
        let vcThird = UINavigationController(rootViewController: SearchViewController())
        let vcFourt = UINavigationController(rootViewController: DownloadViewController())

        vcFirst.tabBarItem.image = UIImage(systemName: "house")
        vcSecond.tabBarItem.image = UIImage(systemName: "play.circle")
        vcThird.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vcFourt.tabBarItem.image = UIImage(systemName: "arrow.forward.circle")
        
        vcFirst.title = "Home"
        vcSecond.title = "Coming Soon"
        vcThird.title = "Search"
        vcFourt.title = "Download"
        
        tabBar.barTintColor = .systemTeal
        
        setViewControllers([vcFirst,vcSecond,vcThird,vcFourt], animated: true)


    }
    


}

