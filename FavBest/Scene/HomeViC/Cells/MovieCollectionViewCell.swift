//
//  MovieCollectionViewCell.swift
//  FavBest
//
//  Created by Deniz Otlu on 31.07.2024.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    

    
    static let identifer = "MovieCollectionViewCell"
    
    let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        posterImageView.frame = contentView.bounds
    }
    
    public func configuree(model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else{return}
            DispatchQueue.main.async {
                self.posterImageView.image = UIImage(data: data)
            }
        }
        .resume()
        
    }

    

}

