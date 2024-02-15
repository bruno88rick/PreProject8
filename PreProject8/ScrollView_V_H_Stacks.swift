//
//  ScrollView&LazyStacks.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 15/02/24.
//

import SwiftUI

struct ScrollView_V_H_Stacks: View {
    
    @State private var showingScrollWithLazy = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach (0..<100) {
                        Text("Text \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Scroll with VStack")
            .toolbar{
                Button("Show Lazy Stack") {
                    showingScrollWithLazy = true
                }
            }
        }
        .sheet(isPresented: $showingScrollWithLazy){
            //the aproach with VStack means that all the ScrollView will be generated at all when the Views launch, but we can launch that on demand using a Stack called Lazy, and can be: LazyVStack or LazyHSstack.
            LazyStack()
        }
    }
}

#Preview {
    ScrollView_V_H_Stacks()
}
