import SwiftUI

struct NotificationPreferencesView: View {
    @State private var startHour = ""
    @State private var startAMPM = "AM"
    
    @State private var endHour = ""
    @State private var endAMPM = "AM"
    
    @State private var selectedInterval: Int = 15
    @State private var showAlert = false
    let intervals = [15, 30, 60, 90, 120, 180, 240, 300] // Available intervals in minutes
    
    var body: some View {
        NavigationView {
            VStack {
                // Title
                Text("Notification Preferences")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding(.leading, -115)
                
                // Subtitle
                VStack(alignment: .leading, spacing: 5) {
                    Text("The start and End hour")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Specify the start and end date to receive the notifications")
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Start and End Time Pickers
                VStack {
                    HStack {
                        Text("Start hour")
                        Spacer()
                        HStack {
                            TextField("3:00", text: $startHour)
                                .keyboardType(.numberPad)
                                .frame(width: 60)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Picker("", selection: $startAMPM) {
                                Text("AM").tag("AM")
                                Text("PM").tag("PM")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: 90)
                        }
                    }
                    .padding(.bottom, 15)
                    
                    HStack {
                        Text("End hour")
                        Spacer()
                        HStack {
                            TextField("3:00", text: $endHour)
                                .keyboardType(.numberPad)
                                .frame(width: 60)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Picker("", selection: $endAMPM) {
                                Text("AM").tag("AM")
                                Text("PM").tag("PM")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: 90)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 20)
                
                // Notification Interval Section
                VStack(alignment: .leading) {
                    Text("Notification interval")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    Text("How often would you like to receive notifications within the specified time interval")
                        .font(.callout)
                        .foregroundColor(.gray)
                        .padding(.bottom, 15)
                        .fixedSize(horizontal: false, vertical: true)

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 15) {
                        ForEach(intervals, id: \.self) { interval in
                            Button(action: {
                                selectedInterval = interval
                            }) {
                                Text(displayInterval(interval: interval))
                                    .frame(minWidth: 70, minHeight: 70)
                                    .background(selectedInterval == interval ? Color.bluu : Color(.systemGray6))
                                    .foregroundColor(selectedInterval == interval ? .white : .black)
                                    .cornerRadius(15)
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
                
                Spacer()
                
                NavigationLink(destination: WaterIntakeView()) {
                    Button(action: {
                        handleStartAction()
                    }) {
                        
                        
                        
                      
                        NavigationLink(destination: WaterIntakeView()) {
                            Text("Start")
                                .bold()
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.bluu)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .padding(.horizontal)
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Preferences Saved"),
                            message: Text("Your notification preferences have been updated."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            }
            .padding()
        }
    }

    // Helper function to display intervals in a user-friendly way
    private func displayInterval(interval: Int) -> String {
        if interval < 60 {
            return "\(interval)\nMins"
        } else {
            let hours = interval / 60
            return "\(hours)\nHours"
        }
    }
    
    // Action for when the Start button is pressed
    private func handleStartAction() {
        if startHour < endHour {
            showAlert = true
        } else {
            print("End time must be after start time")
        }
    }
}

struct NotificationPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreferencesView()
    }
}

