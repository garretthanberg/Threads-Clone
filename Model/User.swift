//
//  User.swift
//  Threads Clone
//
//  Created by Garrett Hanberg on 9/3/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
