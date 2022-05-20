//
//  Link.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import Foundation

struct Link : Codable {

    let next : Next?
   


    enum CodingKeys: String, CodingKey {
        case next
      
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        next = try values.decodeIfPresent(Next.self, forKey: .next)
       
    }


}
