import SwiftUI

struct WaterIntakeView: View {
    @AppStorage("waterIntake") private var waterIntake: Double = 0.0
    @AppStorage("goal") private var goal: Double = 2.7
    
    // اختيار الصور بناءً على كمية الماء
    private var imageName: String {
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
    
    // اختيار اللون بناءً على كمية الماء
    private var progressColor: Color {
        if waterIntake >= goal {
            return .green
        } else {
            return .bluu
        }
    }
    
    var body: some View {
        VStack {
            Text("Today's Water Intake")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.leading, -140)
                .padding(.top, -149)
               
                
            
            Text("\(String(format: "%.1f", waterIntake)) liter / \(goal, specifier: "%.1f") liter")
                .font(.title)
                .bold()
                .padding(.leading, -150)
                .padding(.top, -135)
            // دائرة تقدم
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 200)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(waterIntake / goal, 1.0)))
                    .stroke(progressColor, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 200, height: 200)
                    .animation(.linear, value: waterIntake)
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.yellow)
            }
            .padding()
            
            // Stepper لتغيير قيمة الماء
            VStack{
                Text("\(String(format: "%.1f", waterIntake)) L")

                Stepper("",value: $waterIntake, in: 0...goal, step: 0.675) .labelsHidden()
                    .padding()
            }
        }
        .padding([.top, .leading], 19.839)
    }
//struct WaterIntakeView: View {
//        var body: some View {
//            Text("Hello, Water Intake View!")
//        }
//    }
//
//        .navigationBarBackButtonHidden(true)
}
#Preview {
    WaterIntakeView()
}

