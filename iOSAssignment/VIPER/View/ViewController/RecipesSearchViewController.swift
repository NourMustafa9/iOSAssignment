//
//  RecipesSearchViewController.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import UIKit

class RecipesSearchViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var recipeTableView: UITableView!
    @IBOutlet weak var dataPicker: UIPickerView!
    @IBOutlet weak var searchTextFeild: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - Properties
    var presenter: RecipesListViewToPresenterProtocol?
    var allRecipes : RecipesModel?
    var recipesToView : RecipesModel?
    var scrollActivate = false
    var caseToShow = 1
    var selectedRecipe : Hit?
    var suggestionKeyWords = [String]()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        presenter?.updateView(keyWord: "all")
        setUpTableView()
        searchTextFeild.delegate = self
  
    }
    
    private func setUpTableView() {
        self.dataPicker.isHidden = true
        self.dataPicker.backgroundColor = .white
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        //recipeTableView.tableFooterView = UIView()
        recipeTableView.estimatedRowHeight = 200
        recipeTableView.rowHeight = UITableView.automaticDimension
        
        recipeTableView.register(UINib(nibName: "RecipesTableViewCell", bundle: .main), forCellReuseIdentifier: "RecipesTableViewCell")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func showActivityIndicator(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    @IBAction func lowSugarFilter(_ sender: Any) {
        scrollActivate = false
        presenter?.updateView(keyWord: "low-sugar")
        self.showActivityIndicator()
    }
    
    @IBAction func ketoFilter(_ sender: Any) {
        scrollActivate = false
        presenter?.updateView(keyWord: "keto-friendly")
        self.showActivityIndicator()
    }
    
    
    @IBAction func veganFilter(_ sender: Any) {
        scrollActivate = false
        presenter?.updateView(keyWord: "vegan")
        self.showActivityIndicator()
    }
    
    @IBAction func getAllRecipes(_ sender: UIButton) {
        scrollActivate = false
        presenter?.updateView(keyWord: "all")
        self.showActivityIndicator()
    }
    @IBAction func clearAll(_ sender: UIButton) {
        self.searchTextFeild.text = ""
        self.dataPicker.isHidden = true
        self.view.endEditing(true)
        presenter?.updateView(keyWord: "all")
    }
}
// MARK: -  UITableViewDelegate,UITableViewDataSource
extension RecipesSearchViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return recipesToView?.hits?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = self.recipeTableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as? RecipesTableViewCell
            let row = indexPath.row
        
        if let rec = self.recipesToView?.hits?[row]{
            if let rec_ = rec.recipe{
                cell?.setCell(recipe : rec_)
            }
          
            }
            return cell ?? UITableViewCell()
       
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.recipeTableView{
            let row = indexPath.row
            if let selected = self.recipesToView?.hits?[row]{
                self.selectedRecipe = selected
            }
            presenter?.openScreen(screenName: "RecipeDetailViewController", onViewController: self)
        }
       
    }
    
    
}
// MARK: Pagination
extension RecipesSearchViewController: UIScrollViewDelegate{

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height {
            if !scrollActivate {
                if self.recipesToView?.links?.next?.href != ""{
                    scrollActivate = true
                    presenter?.updateView(keyWord: "pagination_\(self.recipesToView?.links?.next?.href ?? "")")
                }
            }
        }
    }
   
}


extension RecipesSearchViewController : UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  self.suggestionKeyWords.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return suggestionKeyWords[row]
       }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.showActivityIndicator()
        self.presenter?.updateView(keyWord: suggestionKeyWords[row])
        self.dataPicker.isHidden = true
        searchTextFeild.resignFirstResponder()
    }
 
       
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !validateField(enteredString: textField.text ?? "")   ||  textField.text.isNullOrWhitespace{
            self.showError(msg: "Please enter valid recipe")
            self.searchTextFeild.text  = ""
            return false
        }else{
            self.showActivityIndicator()
            scrollActivate = false
            if suggestionKeyWords.count < 10{
                suggestionKeyWords.append(self.searchTextFeild.text ?? "")
            }
            
            self.presenter?.updateView(keyWord: self.searchTextFeild.text ?? "")
            self.dataPicker.isHidden = true
            searchTextFeild.resignFirstResponder()
            return true
        }
       
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.searchTextFeild  && suggestionKeyWords.count > 0{
            self.dataPicker.isHidden = false
            self.dataPicker.reloadAllComponents()
            }
        }
    //MARK:- ScrollView Delegate

    func validateField(enteredString:String) -> Bool {
        
        let validationFormat = "[a-zA-Z\\s]+"
        let fieldPredicate = NSPredicate(format:"SELF MATCHES %@", validationFormat)
        return fieldPredicate.evaluate(with: enteredString)
    }
}

// MARK: - RecipesListPresenterToViewProtocol
extension RecipesSearchViewController: RecipesListPresenterToViewProtocol {
    func showRecipes() {
        if scrollActivate {
            recipesToView = presenter?.interactor?.recipesModel
            if let a = presenter?.interactor?.recipesModel?.hits {
                for i in a {
                    recipesToView?.hits?.append(i)
                }
            }
        }else{
            recipesToView = presenter?.interactor?.recipesModel
        }
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
      
        self.recipeTableView.reloadData()
    }
    

    func showError(msg : String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
