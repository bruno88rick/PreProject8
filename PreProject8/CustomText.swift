//
//  CustomText.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 15/02/24.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String){
        print("Creating a new CustomText with Lazy Stack")
        self.text = text
    }
}

#Preview {
    CustomText("text")
}
