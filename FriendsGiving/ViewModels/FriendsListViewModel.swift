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
    
    func saveFriend(friend: Friend) {
        if friend.id == nil {
            var newFriend = friend
            newFriend.id = UUID().uuidString
            friendsArray.append(newFriend)
        } else {
            if let index = friendsArray.firstIndex(where: { $0.id == friend.id }) {
                friendsArray[index] = friend
            }
        }
    }
    
    func deleteFriends(indexSet: IndexSet) {
        friendsArray.remove(atOffsets: indexSet)
    }
    
    func moveFriends(fromOffsets: IndexSet, toOffset: Int) {
        friendsArray.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}

