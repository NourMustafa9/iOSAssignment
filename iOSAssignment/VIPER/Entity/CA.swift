//
//  CA.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//
import Foundation

struct CA : Codable {

	let label : String?
	let quantity : Float?
	let unit : String?


	enum CodingKeys: String, CodingKey {
		case label = "label"
		case quantity = "quantity"
		case unit = "unit"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		label = try values.decodeIfPresent(String.self, forKey: .label)
		quantity = try values.decodeIfPresent(Float.self, forKey: .quantity)
		unit = try values.decodeIfPresent(String.self, forKey: .unit)
	}


}
