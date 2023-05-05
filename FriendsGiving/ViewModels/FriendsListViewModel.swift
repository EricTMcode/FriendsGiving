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
        loadData()
        //        let friends = ["Eric", "Steeve", "Malcolm"]
        //
        //        for friend in friends {
        //            friendsArray.append(Friend(id: UUID().uuidString, name: friend))
        //        }
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
        saveData()
    }
    
    func deleteFriends(indexSet: IndexSet) {
        friendsArray.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveFriends(fromOffsets: IndexSet, toOffset: Int) {
        friendsArray.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    //MARK: - DOCUMENT DIRECTORY
    
    let path = URL.documentsDirectory.appending(component: "friendsArray")
    
    func saveData() {
        let data = try? JSONEncoder().encode(friendsArray)
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            friendsArray = try JSONDecoder().decode([Friend].self, from: data)
        } catch {
            print("😡 ERROR: Could not load data \(error.localizedDescription)")
        }
    }
}

