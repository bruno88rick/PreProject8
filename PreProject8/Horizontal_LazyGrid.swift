//
//  Horizontal_LazyGrid.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 16/02/24.
//

import SwiftUI

struct Horizontal_LazyGrid: View {
    
    @Environment (\.dismiss) var dismiss
    
    let layout = [
        GridItem(.adaptive(minimum: 30, maximum: 100)),
        GridItem(.adaptive(minimum: 30, maximum: 100)),
        GridItem(.adaptive(minimum: 30, maximum: 100))
    ]
    
    var body: some View {
        NavigationStack(){
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout) {
                    ForEach(0..<1001) {
                        Text("Item \($0)")
                    }
                }
            }
            .navigationTitle("Horizontal Stack")
            .toolbar {
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    Horizontal_LazyGrid()
}
