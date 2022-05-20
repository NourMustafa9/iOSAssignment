//
//  Ingredient.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//
import Foundation

struct Ingredient : Codable {

	let food : String?
	let foodCategory : String?
	let foodId : String?
	let image : String?
	let measure : String?
	let quantity : Float?
	let text : String?
	let weight : Float?


	enum CodingKeys: String, CodingKey {
		case food = "food"
		case foodCategory = "foodCategory"
		case foodId = "foodId"
		case image = "image"
		case measure = "measure"
		case quantity = "quantity"
		case text = "text"
		case weight = "weight"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		food = try values.decodeIfPresent(String.self, forKey: .food)
		foodCategory = try values.decodeIfPresent(String.self, forKey: .foodCategory)
		foodId = try values.decodeIfPresent(String.self, forKey: .foodId)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		measure = try values.decodeIfPresent(String.self, forKey: .measure)
		quantity = try values.decodeIfPresent(Float.self, forKey: .quantity)
		text = try values.decodeIfPresent(String.self, forKey: .text)
		weight = try values.decodeIfPresent(Float.self, forKey: .weight)
	}


}
