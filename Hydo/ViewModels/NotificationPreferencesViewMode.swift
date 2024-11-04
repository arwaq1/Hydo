//
//  Untitled.swift
//  Hydo
//
//  Created by Arwa Alqhtani on 25/04/1446 AH.
//
import Foundation

class NotificationPreferencesViewModel: ObservableObject {
    @Published var startHour: String = ""
    @Published var startAMPM: String = "AM"
    
    @Published var endHour: String = ""
    @Published var endAMPM: String = "AM"
    
    @Published var selectedInterval: Int = 15
    @Published var showAlert = false
    let intervals = [15, 30, 60, 90, 120, 180, 240, 300] // Available intervals in minutes
    
    func handleStartAction() {
        if startHour < endHour {
            showAlert = true
        } else {
            print("End time must be after start time")
        }
    }
    
    func displayInterval(interval: Int) -> String {
        if interval < 60 {
            return "\(interval)\nMins"
        } else {
            let hours = interval / 60
            return "\(hours)\nHours"
        }
    }
}

