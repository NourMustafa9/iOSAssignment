//
//  Next.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import Foundation


struct Next : Codable {

    let href : String?
    let title : String?


    enum CodingKeys: String, CodingKey {
        case href = "href"
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        href = try values.decodeIfPresent(String.self, forKey: .href)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }


}
