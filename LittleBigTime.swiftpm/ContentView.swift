import SwiftUI

struct ContentView: View {
    var body: some View {
        
            
            NavigationView {
                VStack {
                Text("Little Big Time")
                    .font(.custom("HelveticaNeue", size: 95))
                    .fontWeight(.ultraLight)
                    .padding(.top, 150.0)
                    .padding(.bottom, 350.0)
                Image("seed")
                Spacer()
                NavigationLink(destination: CreateView()) {
                    Text("Start")
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.light)
                        .padding(.horizontal, 60.0)
                        .padding(.vertical)
                        .background(Capsule().strokeBorder())
                        .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding(.bottom, 150.0)
            }
            .navigationViewStyle(.stack)
            .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}
