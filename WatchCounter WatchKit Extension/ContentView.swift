//
//  ContentView.swift
//  WatchCounter WatchKit Extension
//
//  Created by Kevin Escobedo on 4/9/21.
//

import SwiftUI
import Foundation

var c: Counter = Counter(count: 0, step: 1, fileName: "save.cnt", checkpoint: 5)

struct ContentView: View
{
    @State var labelText = String(c.count)
    
    var body: some View
    {
        Text(labelText)
            .padding()
            .onTapGesture
            {
                c.up()
                labelText = String(c.count)
                c.validSave()
            }
            .onLongPressGesture
            {
                if(labelText == "0")
                {
                    c.read()
                    labelText = String(c.count)
                }
                
                else
                {
                    c.setCount(newCount: 0)
                    c.validSave()
                    labelText = String(c.count)
                }
            }
            .font(.system(size: 75))
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
