import SwiftUI

struct ContentView: View {
    var body: some View {
//        @State var rootIsActive: Bool = false
//        @Binding var tododata: [ListItem]
            
            NavigationView {
                VStack {
                Text("Little Big Time")
                    .font(.custom("HelveticaNeue", size: 95))
                    .fontWeight(.ultraLight)
                    .padding(.top, 150.0)
                    .padding(.bottom, 350.0)
                // 레벨마다 이미지 다르게 넣기
                    // 함수
                Image("seed")
                Spacer()
                    NavigationLink(destination: CreateView()){
//                    NavigationLink(destination: CreateView(rootIsActive: $rootIsActive), isActive: $rootIsActive){
                    Text("Start")
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.light)
                        .padding(.horizontal, 60.0)
                        .padding(.vertical)
                        .background(Capsule().strokeBorder())
                        .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    .navigationBarBackButtonHidden(true)
                }
                .padding(.bottom, 150.0)
            }
            .navigationViewStyle(.stack)
            .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    // 리스트 개수가 0이면 swich문
}
