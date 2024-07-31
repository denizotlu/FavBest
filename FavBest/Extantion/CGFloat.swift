//
//  CGFloat.swift
//  FavBest
//
//  Created by Deniz Otlu on 31.07.2024.
//

import UIKit


extension UIViewController {
    var screenWidth : CGFloat{
        return view.frame.size.width
        
    }
    var screenHeight : CGFloat{
        return view.frame.size.height
    }
    
}

    extension UIView{
        
        var screenWidth : CGFloat{
            return UIScreen.main.bounds.width
        }
        var screenHeight : CGFloat{
            return UIScreen.main.bounds.height
        }
        
    }
