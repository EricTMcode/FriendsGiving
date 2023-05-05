//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by Eric on 05/05/2023.
//

import SwiftUI

@main
struct FriendsGivingApp: App {
    @StateObject var friendslistVM = FriendsListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(friendslistVM)
        }
    }
}
