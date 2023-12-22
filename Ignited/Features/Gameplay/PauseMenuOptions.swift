//
//  PauseMenuOptions.swift
//  Ignited
//
//  Created by Chris Rittenhouse on 12/9/23.
//  Copyright © 2023 LitRitt. All rights reserved.
//

import SwiftUI

import Features

extension [String]: LocalizedOptionValue
{
    public var localizedDescription: Text {
        return Text("Edit")
    }
}

struct PauseMenuOptions
{
    @Option(name: "Button Order",
            description: "Change the order that buttons appear in the pause menu. Tap and hold an item to move it up or down the list.",
            detailView: { items in
        List {
            ForEach(items, id: \.self) { $item in
                Text(item)
            }
            .onMove { from, to in
                items.wrappedValue.move(fromOffsets: from, toOffset: to)
            }
        }
    })
    var buttonOrder: [String] = ["Save State", "Load State", "Restart", "Screenshot", "Status Bar", "Sustain Buttons", "Rewind", "Fast Forward", "Rotation Lock", "Palettes", "Quick Settings", "Backgroud Blur", "Cheat Codes", "Alt Skin", "Debug Mode"]
    
    @Option(name: "Restore Defaults",
            description: "Reset all options to their default values.",
            detailView: { _ in
        Button("Restore Defaults") {
            PowerUserOptions.resetFeature(.pauseMenu)
        }
        .font(.system(size: 17, weight: .bold, design: .default))
        .foregroundColor(.red)
        .displayInline()
    })
    var reset: Bool = false
}