//
//  AdaptativeGrid.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 16/02/24.
//

import SwiftUI

struct AdaptativeGrid: View {
    @Environment (\.dismiss) var dismiss
    
    @State private var showingHGrid = false
    
    //but the best part of grids is their ability to work across a variety of screen sizes. This can be done with a different column layout using adaptive sizes, like this.
    
    //That tells SwiftUI we’re happy to fit in as many columns as possible, as long as they are at least 80 points in width. You can also specify a maximum range for even more control. I tend to rely on these adaptive layouts the most, because they allow grids that make maximum use of available screen space:
    
    let layout = [GridItem(.adaptive(minimum: 80, maximum: 120))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach (0..<1001) {
                        Text("Item \($0)")
                    }
                }
            }
            .navigationTitle("Adaptative Grid")
            .toolbar {
                
                Button("Lazy HGrid - Horizontal"){
                    showingHGrid = true
                }
                .padding()
                
                Button("Dismiss") {
                    dismiss()
                }
            }
            .sheet(isPresented: $showingHGrid) {
                Horizontal_LazyGrid()
            }
        }
    }
}

#Preview {
    AdaptativeGrid()
}
