//
//  PreviewProvider.swift
//  Threads Clone
//
//  Created by Garrett Hanberg on 9/3/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Tommy Shelby", email: "tommy@gmail.com", username: "tommy_shelby1")
    
    let thread = Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 0)
}
