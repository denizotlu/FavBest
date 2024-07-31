//
//  MainHeaderView.swift
//  FavBest
//
//  Created by Deniz Otlu on 1.08.2024.
//

import Foundation
import UIKit
import SnapKit

class MainHeaderView : UIView {
 
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        createHeader()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        

    
    private func createHeader(){
        
        let image = UIImageView()
        image.image = UIImage(named: "fightClup")
        addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(screenHeight * 0.35)
        }
        
        
        
    }
    
    
    
}
