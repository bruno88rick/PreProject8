//
//  GridItem_LazyHGrid_LazyVGrid.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 16/02/24.
//

import SwiftUI

//SwiftUI’s List view is a great way to show scrolling rows of data, but sometimes you also want columns of data – a grid of information, that is able to adapt to show more data on larger screens

//In SwiftUI this is accomplished with two views: LazyHGrid for showing horizontal data, and LazyVGrid for showing vertical data. Just like with lazy stacks, the “lazy” part of the name is there because SwiftUI will automatically delay loading the views it contains until the moment they are needed, meaning that we can display more data without chewing through a lot of system resources

//Creating a grid is done in two steps. First, we need to define the rows or columns we want – we only define one of the two, depending on which kind of grid we want

//For example, if we have a vertically scrolling grid then we might say we want our data laid out in three columns exactly 80 points wide by adding this property to our view:

struct GridItem_LazyHGrid_LazyVGrid: View {
    
    @State private var showingAdaptativeGrid = false
    
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    var body: some View {
        NavigationStack {
            //Once you have your layout defined, you should place your grid inside a ScrollView, along with as many items as you want. Each item you create inside the grid is automatically assigned a column in the same way that rows inside a list automatically get placed inside their parent.
            
            ScrollView {
                LazyVGrid(columns: layout){
                    ForEach(0..<1001) {
                        Text("Item \($0)")
                    }
                }
            }
            .navigationTitle("Fixed Grid")
            .toolbar {
                Button("Adaptative Grid") {
                    showingAdaptativeGrid = true
                }
            }
            .sheet(isPresented: $showingAdaptativeGrid, content: {
                AdaptativeGrid()
            })
        }
    }
}

#Preview {
    GridItem_LazyHGrid_LazyVGrid()
}
