//
//  Recipe.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//
import Foundation

struct Recipe : Codable {

	let calories : Float?
	let cautions : [String]?
	let cuisineType : [String]?
	let dietLabels : [String]?
	let digest : [Digest]?
	let dishType : [String]?
	let healthLabels : [String]?
	let image : String?
	let ingredientLines : [String]?
	let ingredients : [Ingredient]?
	let label : String?
	let mealType : [String]?
	let shareAs : String?
	let source : String?
	let totalDaily : TotalDaily?
	let totalNutrients : TotalNutrient?
	let totalTime : Float?
	let totalWeight : Float?
	let uri : String?
	let url : String?
	let yield : Float?


	enum CodingKeys: String, CodingKey {
		case calories = "calories"
		case cautions = "cautions"
		case cuisineType = "cuisineType"
		case dietLabels = "dietLabels"
		case digest = "digest"
		case dishType = "dishType"
		case healthLabels = "healthLabels"
		case image = "image"
		case ingredientLines = "ingredientLines"
		case ingredients = "ingredients"
		case label = "label"
		case mealType = "mealType"
		case shareAs = "shareAs"
		case source = "source"
		case totalDaily
		case totalNutrients
		case totalTime = "totalTime"
		case totalWeight = "totalWeight"
		case uri = "uri"
		case url = "url"
		case yield = "yield"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		calories = try values.decodeIfPresent(Float.self, forKey: .calories)
		cautions = try values.decodeIfPresent([String].self, forKey: .cautions)
		cuisineType = try values.decodeIfPresent([String].self, forKey: .cuisineType)
		dietLabels = try values.decodeIfPresent([String].self, forKey: .dietLabels)
		digest = try values.decodeIfPresent([Digest].self, forKey: .digest)
		dishType = try values.decodeIfPresent([String].self, forKey: .dishType)
		healthLabels = try values.decodeIfPresent([String].self, forKey: .healthLabels)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		ingredientLines = try values.decodeIfPresent([String].self, forKey: .ingredientLines)
		ingredients = try values.decodeIfPresent([Ingredient].self, forKey: .ingredients)
		label = try values.decodeIfPresent(String.self, forKey: .label)
		mealType = try values.decodeIfPresent([String].self, forKey: .mealType)
		shareAs = try values.decodeIfPresent(String.self, forKey: .shareAs)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		totalDaily = try TotalDaily(from: decoder)
		totalNutrients = try TotalNutrient(from: decoder)
		totalTime = try values.decodeIfPresent(Float.self, forKey: .totalTime)
		totalWeight = try values.decodeIfPresent(Float.self, forKey: .totalWeight)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		yield = try values.decodeIfPresent(Float.self, forKey: .yield)
	}


}
