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
    @State private var time = 0
    @State private var isRunning = false
    @State private var isDoing = false
    @State private var gotoFinish = false
    @State private var timer: Timer?
//    @AppStorage("todo") private var todoData: TodoData()
    @State private var tododata: [ListItem] = []
    
    @Binding var todo: String
    @Binding var rootIsActive: Bool
    
    init(todo: Binding<String> = .constant(""), rootIsActive: Binding<Bool> = .constant(false)) {
        _todo = todo
        _rootIsActive = rootIsActive
    }
    
    var body: some View {
        VStack {
            Text(todo)
                .font(.custom("HelveticaNeue", size: 60))
                .fontWeight(.ultraLight)
                .padding(.bottom, 200.0)
            //            Text("Read a book")
            //                .font(.custom("HelveticaNeue", size: 60))
            //                .fontWeight(.ultraLight)
            //                .padding(.bottom, 200.0)
            
            ZStack {
                //                Path { path in
                //                                path.move(to: CGPoint(x: 500, y: 60))
                //                                path.addLine(to: CGPoint(x: 550, y: 200))
                //                                path.addLine(to: CGPoint(x: 300, y: 250))
                //                                path.addLine(to: CGPoint(x: 130, y: 150))
                //                                path.addLine(to: CGPoint(x: 250, y: 0))
                //                                path.closeSubpath()
                //                    }
                //                .foregroundColor(ColorManager.waterColor)
                //                .offset(x:160, y:210)
                
                // MARK: 시간
                Text("\(String(time))s")
                    .font(.custom("HelveticaNeue", size: 100))
                    .fontWeight(.ultraLight)
                //                    .offset(y:-150)
                //                .padding(.vertical, 150.0)
            }
            
            // MARK: 스탑워치 버튼
            Button(action: {
                if isRunning{
                    timer?.invalidate()
                } else {
                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                        time += 1
                    })
                }
                isRunning.toggle()
                isDoing = true
            }) {
                Text(isRunning ? "Stop" : "Start")
                    .font(.custom("HelveticaNeue", size: 26))
                    .fontWeight(.light)
                    .padding(.horizontal, 45.0)
                    .padding(.vertical)
                    .background(Capsule().strokeBorder())
                    .accentColor(isRunning ? .red : .blue)
                    .animation(.easeInOut, value: isRunning)
            }
            .padding(.top, 200)
            
            // MARK: Finish 버튼
            finishBtn
            
        }
    }

    // 할일 다 끝내고 Finish 했을 때의 버튼
    var finishBtn: some View {
        // FinishView로 가기
        NavigationLink(destination: FinishView(time: $time, rootIsActive: $rootIsActive), isActive: $gotoFinish) {
            
            Button(action: {
                gotoFinish = true
                // 스탑워치 멈추기
                timer?.invalidate()
                isRunning = false
                // 유저의 할일과 시간 저장??
                tododata.append(ListItem(todo: todo, time: time))
            }) {
                Text("Finish")
                    .font(.custom("HelveticaNeue", size: 26))
                    .fontWeight(.light)
                    .padding(.horizontal, 45.0)
                    .padding(.vertical)
                    .background(Capsule().strokeBorder())
                    .accentColor(isDoing ? .green : .gray)
                    .animation(.easeInOut, value: isDoing)
            }
        }
    }
    
//    func saveData(todo: String, time: Int) {
//        TodoData.todo.append(todo)
//        TodoData.time.append(time)
//    }
    
    // finish하면 시간이 멈추고 그 시간이 저장되어야함.
//    var finishBtn: some View {
//        NavigationLink(destination: FinishView()) {
//            Text("Finish")
//                .font(.custom("HelveticaNeue", size: 26))
//                .fontWeight(.light)
//                .padding(.horizontal, 45.0)
//                .padding(.vertical)
//                .background(Capsule().strokeBorder())
//                .accentColor(isDoing ? .green : .gray)
//                .animation(.easeInOut, value: isDoing)
//        }.navigationBarBackButtonHidden(true)
//        .padding(.vertical, 20)
//        // 값이 없다면 비활성화
//        .disabled(!isDoing)
//    }
}

class ListItem: ObservableObject, Identifiable {
    @Published var todo: String
    @Published var time: Int
    var id: UUID = UUID()
    
    init(todo: String, time: Int) {
        self.todo = todo
        self.time = time
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
