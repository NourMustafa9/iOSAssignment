//
//  RecipesInteractor.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import Foundation
import Alamofire

class RecipesInteractor: RecipesListPresentorToInteractorProtocol {
  
    
   
    

    // MARK: - Properties
    var recipesModel: RecipesModel?
     var presenter: RecipesListInteractorToPresenterProtocol?
    var reciepes: [Hit]?
    // MARK: - Methods
    func fetchAllRecipes(keyWord: String) {
        print("keyword \(keyWord)")
        var urlStr = Constants.getAllRecipesUrl + keyWord + Constants.getAllRecipesUrl_Ids
        if keyWord != "" && keyWord == Constants.lowSugar || keyWord == Constants.keto || keyWord == Constants.vegan {
            urlStr = Constants.urlWithKeyWord + keyWord
        }else if keyWord.contains("pagination_") {
            if let index = keyWord.firstIndex(of: "_") {
                let afterEqualsTo = String(keyWord.suffix(from: index).dropFirst())
                print(afterEqualsTo)
                urlStr = afterEqualsTo
            }
            
        }
        print(urlStr,"urlStr")
        
        
        AF.request(urlStr).response { response in
            if(response.response?.statusCode == 200){
                guard let data = response.data else { return }
                do {
         
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(RecipesModel.self, from: data)
    
                    self.recipesModel = newsResponse
                   
                    guard let recipesList = newsResponse.hits else { return }
                    print(recipesList,"recipesList")
                    self.reciepes = recipesList
                    self.presenter?.RecipesFetched()
                } catch let error {
                    print(error)
                }
            }
            else {
                self.presenter?.RecipesFetchedFailed()
            }
        }
    }
}
