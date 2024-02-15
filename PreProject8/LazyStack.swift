//
//  LazyVStack.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 15/02/24.
//

import SwiftUI

struct LazyStack: View {
    @Environment (\.dismiss) var dismiss
    @State private var showingHorizontally = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 10) {
                    ForEach(0..<100){
                        CustomText("Text \($0)")
                            .font(.title)
                    }
                }
            }
            .navigationTitle("Scroll With lazy")
            .toolbar {
                Button("Show Horizontally"){
                    showingHorizontally = true
                }
                Button("Dismiss") {
                    dismiss()
                }
            }
            .sheet(isPresented: $showingHorizontally){
                ScrollHorizontally()
            }
        }
    }
}

#Preview {
    LazyStack()
}
