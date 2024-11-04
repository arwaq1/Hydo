import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                Image(systemName: "drop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 75)
                    .foregroundColor(Color.bluu)
                    .font(.system(size: 40))
                    .padding(.top)
                    .padding(10)

                Text("Hydrate")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(-20)
                    .padding(30)
                    .padding(10)

                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding()

                HStack {
                    Spacer()
                    TextField(" Body weight Value", text: $viewModel.bodyWeight)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.trailing)
                }
                .padding(.all, 15.0)

                Spacer()

                NavigationLink(destination: NotificationPreferencesView()) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.bluu)
                        .cornerRadius(8)
                }
                .padding()
            }
            .padding(15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

