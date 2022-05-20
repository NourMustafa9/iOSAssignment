//
//  Sub.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//
import Foundation

struct Sub : Codable {

	let daily : Float?
	let hasRDI : Bool?
	let label : String?
	let schemaOrgTag : String?
	let tag : String?
	let total : Float?
	let unit : String?


	enum CodingKeys: String, CodingKey {
		case daily = "daily"
		case hasRDI = "hasRDI"
		case label = "label"
		case schemaOrgTag = "schemaOrgTag"
		case tag = "tag"
		case total = "total"
		case unit = "unit"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		daily = try values.decodeIfPresent(Float.self, forKey: .daily)
		hasRDI = try values.decodeIfPresent(Bool.self, forKey: .hasRDI)
		label = try values.decodeIfPresent(String.self, forKey: .label)
		schemaOrgTag = try values.decodeIfPresent(String.self, forKey: .schemaOrgTag)
		tag = try values.decodeIfPresent(String.self, forKey: .tag)
		total = try values.decodeIfPresent(Float.self, forKey: .total)
		unit = try values.decodeIfPresent(String.self, forKey: .unit)
	}


}
