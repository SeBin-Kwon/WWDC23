//
//  StopwatchView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/08.
//

import SwiftUI

struct ColorManager {
    static let waterColor = Color("waterColor")
}

struct StopwatchView: View {
    @State private var progressTime = 0
//    @Binding var todo: String
    
//    init(todo: Binding<String> = .constant("")) {
//        _todo = todo
//    }
    
    var body: some View {
//        Text(todo)
        Path { path in
                        path.move(to: CGPoint(x: 500, y: 60))
                        path.addLine(to: CGPoint(x: 550, y: 200))
                        path.addLine(to: CGPoint(x: 300, y: 250))
                        path.addLine(to: CGPoint(x: 130, y: 150))
                        path.addLine(to: CGPoint(x: 250, y: 0))
                        path.closeSubpath()
            }
        .foregroundColor(ColorManager.waterColor)
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
