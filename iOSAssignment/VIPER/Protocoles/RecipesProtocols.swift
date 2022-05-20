//
//  RecipesProtocols.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import Foundation

import UIKit

protocol RecipesListPresenterToViewProtocol  {
    func showRecipes()
    func showError(msg : String)
}

protocol RecipesListInteractorToPresenterProtocol  {
    func RecipesFetched()
    func RecipesFetchedFailed()
}

protocol RecipesListPresentorToInteractorProtocol  {
    var presenter: RecipesListInteractorToPresenterProtocol? { get set }
    var reciepes: [Hit]? { get }
    var recipesModel: RecipesModel? { get }
    func fetchAllRecipes(keyWord: String)
}

protocol RecipesListViewToPresenterProtocol  {
    var view: RecipesListPresenterToViewProtocol? { get set }
    var interactor: RecipesListPresentorToInteractorProtocol? { get set }
    var router: RecipesListPresenterToRouterProtocol? { get set }
    
    func updateView(keyWord: String)
   
    func getRecipesListCount() -> Int?
  
    func getRecipes(index: Int) -> Hit?
    func openScreen(screenName : String, onViewController : UIViewController)
    func openUrlWebsite(url:String, onViewController: UIViewController)
    func openShare(reciepeName: String,url: String, onViewController: UIViewController)
    func returnToMainScreen(onViewController: UIViewController)
}

protocol RecipesListPresenterToRouterProtocol  {
    static func createModule() -> UIViewController
    func openScreen(screenName : String, onViewController : UIViewController)
    func openUrlWebsite(url:String, onViewController: UIViewController)
    func openShare(reciepeName: String,url: String, onViewController: UIViewController)
    func returnToMainScreen(onViewController: UIViewController)

}
