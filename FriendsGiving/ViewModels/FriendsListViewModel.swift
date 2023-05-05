//
//  FriendsListViewModel.swift
//  FriendsGiving
//
//  Created by Eric on 05/05/2023.
//

import Foundation

class FriendsListViewModel: ObservableObject {
    @Published var friendsArray: [Friend] = []
    
    init() {
        let friends = ["Eric", "Steeve", "Malcolm"]
        
        for friend in friends {
            friendsArray.append(Friend(id: UUID().uuidString, name: friend))
        }
    }
    
    func deleteFriends(indexSet: IndexSet) {
        friendsArray.remove(atOffsets: indexSet)
    }
    
    func moveFriends(fromOffsets: IndexSet, toOffset: Int) {
        friendsArray.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}

