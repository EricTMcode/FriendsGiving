//
//  DetailView.swift
//  FriendsGiving
//
//  Created by Eric on 05/05/2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @State var friend: Friend
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name:")
            TextField("Enter a name", text: $friend.name)
            
            Text("Bringing:")
            TextField("Bringing", text: $friend.bringing)
            
            Text("Notes:")
            TextField("Enter notes", text: $friend.notes)
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .textFieldStyle(.roundedBorder)
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(friend: Friend.example)
        }
    }
}
