//
//  CreateView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/08.
//

import SwiftUI

struct CreateView: View {
    @State private var Todo: String = ""
    
    var body: some View {
                VStack {
            Text("What do you want to do?")
                .font(.custom("HelveticaNeue", size: 60))
                .fontWeight(.ultraLight)
//                .padding(.top, 20.0)
                .padding(.bottom, 150.0)
            Image("seed")
                .padding(.bottom, 100.0)
            TextField("Enter what you want to do", text: $Todo)
                    .padding()
                    .frame(minWidth:50, maxWidth: 800)
//                    .overlay( RoundedRectangle(cornerRadius: 50) .stroke(Color.blue) )
                    .background(RoundedRectangle(cornerRadius: 50).fill(Color(uiColor: .secondarySystemBackground)))
            Text("\(Todo)")
            nextBtn
                }
    }
    // 만약 todo에 값이 있다면 동작, todo를 TodoData.todo에 append
    // 값이 없다면 회색 비활성화
    var nextBtn: some View {
        NavigationLink(destination: StopwatchView()) {
            Text("Next")
                .font(.custom("HelveticaNeue", size: 30))
                .fontWeight(.light)
                .padding(.horizontal, 50.0)
                .padding(.vertical)
                .background(Capsule().strokeBorder())
                .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        .offset(x:330,y:100)
        .padding(.horizontal, 20)
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

