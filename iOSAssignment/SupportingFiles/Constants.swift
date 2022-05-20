//
//  Constants.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import Foundation

struct Constants {
    static let applicationId = "a7926b02"
    static let applicationKeys = "94473c6e5535692c33581780ea715790"
    static let getAllRecipesUrl = "https://api.edamam.com/api/recipes/v2?type=public&q="
    
    
//    all
    static let getAllRecipesUrl_Ids = "&app_id=\(applicationId)&app_key=\(applicationKeys)"  //
    
    static let urlWithKeyWord = "https://api.edamam.com/api/recipes/v2?type=public&q=all&app_id=\(applicationId)&app_key=\(applicationKeys)&health="
    
 static let lowSugar = "low-sugar"
    static let keto = "keto-Friendly"
    static let vegan = "vegan"
    static let all = "all"

    
}
