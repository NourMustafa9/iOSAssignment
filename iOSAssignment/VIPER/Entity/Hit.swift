//
//  Hit.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//
import Foundation

struct Hit : Codable {

	let recipe : Recipe?


	enum CodingKeys: String, CodingKey {
		case recipe
	}
	init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recipe = try values.decodeIfPresent(Recipe.self, forKey: CodingKeys.recipe)
	}


}
