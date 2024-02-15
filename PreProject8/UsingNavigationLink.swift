//
//  UsingNavigationLink.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 15/02/24.
//

import SwiftUI

struct UsingNavigationLink: View {
    var body: some View {
        NavigationStack {
            //One of the many things I love about SwiftUI is that we can use NavigationLink with any kind of destination view. Yes, we can design a custom view to push to, but we can also push straight to some text.
            NavigationLink("Tap me"){
                Text("Detail Text")
                    .font(.headline)
            }
                .font(.title)
            
            //If you want something other than a simple text view as your label, you can use two trailing closures with your NavigationLink. For example, we could make a label out of several text views and an image:
            
                .padding(50)
            
            NavigationLink {
                /*So, both sheet() and NavigationLink allow us to show a new view from the current one, but the way they do it is different and you should choose them carefully:
                 
                 NavigationLink is for showing details about the user’s selection, like you’re digging deeper into a topic.
                 sheet() is for showing unrelated content, such as settings or a compose window.
                 The most common place you see NavigationLink is with a list, and there SwiftUI does something quite marvelous.

                 Try modifying your code to this:*/
                
                //and we can put a Navigation link inside other navigation link:
                List(0..<100) { row in
                    NavigationLink("Detail \(row)") {
                        Text("Detail \(row)")
                    }
                }
            } label: {
                VStack{
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    UsingNavigationLink()
}
