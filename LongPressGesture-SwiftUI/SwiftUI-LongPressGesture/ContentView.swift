//
//  ContentView.swift
//  SwiftUI-LongPressGesture
//
//  Created by Jared Thomas on 5/21/20.
//  Copyright © 2020 Jared Thomas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scaleFactor: CGFloat = 1
    // @GestureState property wrapper returns a completed animation to it's inital state
    @GestureState private var longPressed = false
    
    var body: some View {
        VStack {
            Image("Profile")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 300)
                // scaleEffect that will resize to 1.2 and return to 1
                .scaleEffect(longPressed ? 1.2 : 1)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 20)
                // LongPressGesture with a minDuration of 1 second that updates to longPressed default state of 1
                .gesture(LongPressGesture(minimumDuration: 1).updating($longPressed, body: { (value, state, transaction) in
                    // resets to init value
                    state = value
                }))
                .animation(.spring())
            Text("Press + Hold me for a LongPress Gesture").fontWeight(.bold).shadow(radius: 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
