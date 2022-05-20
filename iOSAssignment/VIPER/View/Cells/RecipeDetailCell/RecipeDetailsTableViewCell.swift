//
//  RecipeDetailsTableViewCell.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 20/05/2022.
//

import UIKit

class RecipeDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpTitle(name : String){
        self.labelText.text = "Recipe Name " + "\n" +  "\n" +  name
    }
    
    func setUpIngredient(name : String , index : Int){
        if index == 0 {
            self.labelText.text = "Ingredients " + "\n" +  "\n" + name
        }else{
            self.labelText.text = name
        }
        
      
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
