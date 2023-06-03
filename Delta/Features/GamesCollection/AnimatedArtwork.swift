//
//  AnimatedArtwork.swift
//  Delta
//
//  Created by Chris Rittenhouse on 6/3/23.
//  Copyright © 2023 Lit Development. All rights reserved.
//

import UIKit
import SwiftUI

import Features

struct AnimatedArtworkOptions
{
    @Option(name: "Animation Speed", description: "Adjust the animation speed of animated artwork.", detailView: { value in
        VStack {
            HStack {
                Text("Animation Speed: \(value.wrappedValue * 100, specifier: "%.f")%")
                Spacer()
            }
            HStack {
                Text("25%")
                Slider(value: value, in: 0.25...4.0, step: 0.05)
                Text("400%")
            }
        }.displayInline()
    })
    var animationSpeed: Double = 1.0
    
    @Option(name: "Animation Pause", description: "Adjust the pause between animations for animated artwork. Increasing the number of frames can cause lag and increased memory usage when scrolling through the pages of your collection.", detailView: { value in
        VStack {
            HStack {
                Text("Animation Pause: \(value.wrappedValue, specifier: "%.f") Frames")
                Spacer()
            }
            HStack {
                Text("0")
                Slider(value: value, in: 0...50, step: 1)
                Text("50")
            }
        }.displayInline()
    })
    var animationPause: Double = 0
    
    @Option(name: "Maximum Length", description: "Adjust the maximum length of animations. Smaller values will cut animations short, but reduce lag and memory usage. Larger values will allow longer animations to play fully, but may cause more lag and memory usage.", detailView: { value in
        VStack {
            HStack {
                Text("Maximum Length: \(value.wrappedValue, specifier: "%.f") Frames")
                Spacer()
            }
            HStack {
                Text("10")
                Slider(value: value, in: 10...100, step: 1)
                Text("100")
            }
        }.displayInline()
    })
    var animationMaxLength: Double = 30
}
