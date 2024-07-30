//
//  SceneDelegate.swift
//  FavBest
//
//  Created by Deniz Otlu on 29.07.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let WindowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: WindowScene.coordinateSpace.bounds)
        window?.windowScene = WindowScene
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
        
        
    /*    let windows = UIWindow(windowScene: WindowScene)
        let main = MainTabbarController()
        let navigaiton = UINavigationController(rootViewController: main)
        windows.rootViewController = main
        
        self.window = windows
        
        window?.makeKeyAndVisible() */
        
        
        
    }


}

