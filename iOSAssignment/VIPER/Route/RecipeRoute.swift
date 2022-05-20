//
//  RecipeRoute.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import Foundation
import SafariServices
import UIKit

class RecipesRouter: RecipesListPresenterToRouterProtocol{
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = RecipesSearchViewController()
        var presenter: RecipesListViewToPresenterProtocol & RecipesListInteractorToPresenterProtocol = RecipesPresenter()
        var interactor: RecipesListPresentorToInteractorProtocol = RecipesInteractor()
        let router: RecipesListPresenterToRouterProtocol = RecipesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    func openScreen(screenName: String, onViewController: UIViewController) {
        let view = RecipeDetailViewController()
        view.selectedRecipe = (onViewController as! RecipesSearchViewController).selectedRecipe
        view.presenter = (onViewController as! RecipesSearchViewController).presenter
        onViewController.present(view, animated: true, completion: nil)
    }
    func returnToMainScreen( onViewController: UIViewController){
        onViewController.dismiss(animated: true, completion: nil)
    }
    
    func openShare(reciepeName: String,url:String, onViewController: UIViewController){
        // text to share
        let text = reciepeName + "\n" + url
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = onViewController.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        onViewController.present(activityViewController, animated: true, completion: nil)
    }
    func openUrlWebsite(url: String, onViewController: UIViewController) {
        if let url = URL(string: url) {
              let config = SFSafariViewController.Configuration()
              config.entersReaderIfAvailable = true

              let vc = SFSafariViewController(url: url, configuration: config)
            onViewController.present(vc, animated: true)
          }
    }
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
