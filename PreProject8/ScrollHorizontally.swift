//
//  ScrollHorizontally.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 15/02/24.
//

import SwiftUI

struct ScrollHorizontally: View {
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ScrollView (.horizontal){
                LazyHStack(spacing: 10) {
                    ForEach(0..<100){
                        CustomText("Text \($0)")
                            .font(.title)
                    }
                }
            }
            .toolbar{
                Button("Dismiss"){
                    dismiss()
                }
            }
            .navigationTitle("Scroll Horizontally")
        }
    }
}

#Preview {
    ScrollHorizontally()
}
