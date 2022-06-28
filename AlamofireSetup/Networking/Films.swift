//
//  Films.swift
//  AlamofireSetup
//
//  Created by Mac on 16/06/2022.
//

import Foundation

struct Films: Decodable {
  let count: Int
  let all: [Film]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
