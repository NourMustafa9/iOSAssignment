//
//  RecipesPresenter.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import Foundation
import UIKit


class RecipesPresenter: RecipesListViewToPresenterProtocol {
   
    
    
   
    // MARK: - Properties
     var view: RecipesListPresenterToViewProtocol?
    var interactor: RecipesListPresentorToInteractorProtocol?
    var router: RecipesListPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView(keyWord:String) {
        interactor?.fetchAllRecipes(keyWord : keyWord)
        
    }
    //open detail
    func openScreen(screenName: String, onViewController: UIViewController) {

      router?.openScreen(screenName: screenName, onViewController: onViewController)
    }
    func openUrlWebsite(url: String, onViewController: UIViewController) {
        router?.openUrlWebsite(url: url, onViewController: onViewController)
    }
    
    func openShare(reciepeName: String,url:String, onViewController: UIViewController) {
        router?.openShare(reciepeName: reciepeName, url: url, onViewController: onViewController)
    }
    func returnToMainScreen(onViewController: UIViewController) {
        router?.returnToMainScreen(onViewController: onViewController)
    }
    
    func getRecipesListCount() -> Int? {
        return interactor?.reciepes?.count
    }
    
   
    func getRecipes(index: Int) -> Hit? {
        return interactor?.reciepes?[index]
    }
}

// MARK: - RecipesListInteractorToPresenterProtocol
extension RecipesPresenter: RecipesListInteractorToPresenterProtocol {
    func RecipesFetched() {
        view?.showRecipes()
    }
    
    func RecipesFetchedFailed() {
        view?.showError(msg: "Problem Fetching News")
    }
    
}

