//
//  RecipeDetailViewController.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 20/05/2022.
//

import UIKit
import Kingfisher

class RecipeDetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var imageRec: UIImageView!
    @IBOutlet weak var detailsTableView: UITableView!
    
    // MARK: - Properties
    var presenter: RecipesListViewToPresenterProtocol?
    var selectedRecipe : Hit?
    var ingredientsArr = [String]()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    func setUpViews(){
        self.setUpTableView()
        self.ingredientsArr = self.selectedRecipe?.recipe?.ingredientLines ?? [""]
        let url = URL(string: selectedRecipe?.recipe?.image ?? "")
        self.imageRec.kf.indicatorType = .activity
        self.imageRec.kf.setImage(with: url, placeholder:.none, options: .none, progressBlock: .none) { (result) in
            switch result {
            case .success(let value):
                print("Image: \(value.image). Got from: \(value.cacheType)")
            case .failure(_):
                print("Error: failed to load image")
                self.imageRec.image = #imageLiteral(resourceName: "placeholderDish")
            }
        }    }

    private func setUpTableView() {
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        //recipeTableView.tableFooterView = UIView()
        detailsTableView.estimatedRowHeight = 200
        detailsTableView.rowHeight = UITableView.automaticDimension

        detailsTableView.register(UINib(nibName: "RecipeDetailsTableViewCell", bundle: .main), forCellReuseIdentifier: "RecipeDetailsTableViewCell")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goToRecWebsite(_ sender: UIButton) {
        print( self.selectedRecipe?.recipe?.url ?? "","urllllll")
        self.presenter?.openUrlWebsite(url: self.selectedRecipe?.recipe?.url ?? "", onViewController: self)
    }
    @IBAction func shareRecipe(_ sender: UIButton) {
        self.presenter?.openShare(reciepeName: self.selectedRecipe?.recipe?.label ?? "",url:  self.selectedRecipe?.recipe?.url ?? "", onViewController: self)
    }
    @IBAction func backBtn(_ sender: UIButton) {
        self.presenter?.returnToMainScreen(onViewController: self)
    }
}
// MARK: -  UITableViewDelegate,UITableViewDataSource
extension RecipeDetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return ingredientsArr.count
        }else{
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.detailsTableView.dequeueReusableCell(withIdentifier: "RecipeDetailsTableViewCell", for: indexPath) as? RecipeDetailsTableViewCell else { return UITableViewCell() }
        if indexPath.section == 0 {
            cell.setUpTitle(name: self.selectedRecipe?.recipe?.label ?? "")
        }else{
            cell.setUpIngredient(name: self.ingredientsArr[indexPath.row], index: indexPath.row)
        }
        return cell
    }
}

