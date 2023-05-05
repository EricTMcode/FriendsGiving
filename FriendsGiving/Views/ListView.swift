//
//  ListView.swift
//  FriendsGiving
//
//  Created by Eric on 05/05/2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var friendsListVM: FriendsListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(friendsListVM.friendsArray) { friend in
                    NavigationLink {
                        DetailView(friend: friend)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .font(.title2)
                            Text("Turkey")
                        }
                    }
                }
                .onDelete(perform: friendsListVM.deleteFriends)
                .onMove(perform: friendsListVM.moveFriends)
            }
            .listStyle(.plain)
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(FriendsListViewModel())
    }
}
