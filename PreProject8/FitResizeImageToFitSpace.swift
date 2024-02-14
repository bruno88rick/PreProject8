//
//  FitResizeImageToFitSpace.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 14/02/24.
//

import SwiftUI

struct FitResizeImageToFitSpace: View {
    var body: some View {
        
        //Ways to call image on the asstes:
        /*Image("Example")*/
        VStack {
            Image(.example) // this is a better way to do, swift generates a constant do ever image on the project
                .resizable() // this resizes the image to fit the frame, but its looking squashed now, my image is not a perfect square, To solve this:
            //.scaledToFit() //modifies the frame/image to fit the image inside the container, even if that leaves some parts of the view empty
                .scaledToFill() //modifies the frame/image to fit the image inside the container, but making no empty parts, even if that means some of our image lies outside the container
                .frame(width: 300, height: 300) // apllying this modifiers dont take effect on the image, but creates a frame on it (like selected preview) - The image view's frame was set correctly, but the content of the image is still shown as its original size.
                .clipped() // its clipped the image (indeed 300x300) to fit the frame, but don't resizes it, to do that we need to use resizable before .frame()
            
            // sometimes we want images that automatically scale up to fill more of the screen in one or both dimensions. Like: "make this image fill 80% of the width if the screen: we`re saiyng, scale up the image to fit 80% of the horizontal available space of the screen. To do that, we need to use the .containerRelativeFrame modifier. Axis (eixo) -> Horizontal size -> is the size of our container, witch in this case is the full screen. And we need to return the size we want for this axis, so we're sending back 80% of the container's width."
            
            Image(.example2)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.7
                }
        }
    }
}

#Preview {
    FitResizeImageToFitSpace()
}
