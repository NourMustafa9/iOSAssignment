//
//  RecipesModel.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import Foundation
struct RecipesModel: Codable {
    let count : Int?
    let from : Int?
    var hits : [Hit]?
    let more : Bool?
    let q : String?
    let to : Int?
    var links : Link?
    

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case links = "_links"
        case from = "from"
        case hits = "hits"
        case more = "more"
        case q = "q"
        case to = "to"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        links = try values.decodeIfPresent(Link.self, forKey: .links)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        from = try values.decodeIfPresent(Int.self, forKey: .from)
        hits = try values.decodeIfPresent([Hit].self, forKey: .hits)
        more = try values.decodeIfPresent(Bool.self, forKey: .more)
        q = try values.decodeIfPresent(String.self, forKey: .q)
        to = try values.decodeIfPresent(Int.self, forKey: .to)
    }

}
