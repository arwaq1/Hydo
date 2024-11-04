//
//  Untitled 2.swift
//  Hydo
//
//  Created by Arwa Alqhtani on 25/04/1446 AH.
//

import Foundation
import SwiftUI

class WaterIntakeViewModel: ObservableObject {
    @AppStorage("waterIntake") var waterIntake: Double = 0.0
    @AppStorage("goal") var goal: Double = 2.7
    
    var imageName: String {
        switch waterIntake {
        case 0:
            return "zzz"
        case 1.0..<1.5:
            return "tortoise.fill"
        case 1.5..<2.7:
            return "hare.fill"
        case 2.7:
            return "hands.clap.fill"
        default:
            return "zzz"
        }
    }
    
    var progressColor: Color {
        return waterIntake >= goal ? .green : .bluu
    }
}
