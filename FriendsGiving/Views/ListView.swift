//
//  ListView.swift
//  FriendsGiving
//
//  Created by Eric on 05/05/2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
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
    }
}
