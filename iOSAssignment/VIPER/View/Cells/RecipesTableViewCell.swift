//
//  RecipesTableViewCell.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import UIKit
import Kingfisher
class RecipesTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var sourcesLbl: UILabel!
    
    @IBOutlet weak var healthLbl: UILabel!
    func setCell(recipe: Recipe){
        self.recipeTitle.text = recipe.label
        self.sourcesLbl.text =  recipe.source
        self.healthLbl.text =  recipe.healthLabels?.joined(separator: ", ")
        
        let url = URL(string: recipe.image ?? "")
        self.recipeImg.kf.indicatorType = .activity
        self.recipeImg.kf.setImage(with: url, placeholder:.none, options: .none, progressBlock: .none) { (result) in
            switch result {
            case .success(let value):
                print("Image: \(value.image). Got from: \(value.cacheType)")
            case .failure(_):
                print("Error: failed to load image")
                self.recipeImg.image = #imageLiteral(resourceName: "placeholderDish")
            }
        }
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
