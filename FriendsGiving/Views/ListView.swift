//
//  ListView.swift
//  FriendsGiving
//
//  Created by Eric on 05/05/2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var friendsListVM: FriendsListViewModel
    @State private var sheetIsPresented = false
    
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
                            Text(friend.bringing)
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
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(friend: Friend())
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
