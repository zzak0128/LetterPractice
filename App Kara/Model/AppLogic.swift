//
//  AppLogic.swift
//  App Kara
//
//  Created by Zachary Zak on 11/14/19.
//  Copyright © 2019 Zachary Zak. All rights reserved.
//

import UIKit
struct AppLogic {
    
    var segment = 0
    
    var labelText = ""
    var color = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    var sound = "C"
    
    let capsArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    let lcArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    let colorArray = [#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 0.368627451, green: 0.3607843137, blue: 0.9019607843, alpha: 1), #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)]
    
    let soundArray = ["C", "D", "E", "F", "G", "A", "B"]
    
    mutating func randomize() {
        
        switch segment {
        case 0:
            let randArray = Int.random(in: 0...2)
            
            switch randArray {
            case 0:
                let selectedArray = capsArray
                labelText = selectedArray.randomElement()!
            case 1:
                let selectedArray = lcArray
                labelText = selectedArray.randomElement()!
            default:
                let randNum = Int.random(in: 1...20)
                labelText = String(randNum)
                color = colorArray.randomElement()!
            }
            
        case 1:
            labelText = capsArray.randomElement()!
            color = colorArray.randomElement()!
//            sound = soundArray.randomElement()!
        case 2:
            labelText = lcArray.randomElement()!
            color = colorArray.randomElement()!
//            sound = soundArray.randomElement()!
        case 3:
            let randNum = Int.random(in: 1...20)
            labelText = String(randNum)
            color = colorArray.randomElement()!
//            sound = soundArray.randomElement()!
        default:
            labelText = "Please Try Again"
            color = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
//            sound = "C"
        }
    }
    
    mutating func setSegment(selectedSegment: Int) {
        segment = selectedSegment
    }
    
    func getLabelText() -> String {
        return labelText
    }
    func getColor() -> UIColor {
        return color
    }
    func getSound() -> String {
        let sound2 = soundArray.randomElement()!
        return sound2
    }
}
