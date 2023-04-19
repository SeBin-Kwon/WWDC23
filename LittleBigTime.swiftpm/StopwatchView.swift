//
//  StopwatchView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/08.
//

import SwiftUI

struct ColorManager {
    static let waterColor = Color("waterColor")
    static let lightColor = Color("lightColor")
}

struct StopwatchView: View {
    @State private var time = 0
    @State private var isRunning = false
    @State private var isDoing = false
    @State private var gotoFinish = false
    @State private var timer: Timer?
    //    @State private var tododata: [ListItem] = []
    //    @State private var insetAmount = 200.0
    @State private var isAnimating = false
    @State private var cnt = 0
    
    @State private var endAmount: CGFloat = 0.0
    @State private var startAmount: CGFloat = 0.0
    //    @State private var move: Timer?
    @State private var animationIsRunning: Bool = false
    @State private var animationPaused = false
    @State private var isAnimatingFirst = true
    
    @EnvironmentObject var todolist: TodoList
    //    @ObservedObject var timelist = TimeList()
    
    @Binding var todo: String
    @Binding var rootIsActive: Bool
    @Binding var needsUpdate: Bool
    
    //    init(todo: Binding<String> = .constant(""), rootIsActive: Binding<Bool> = .constant(false)) {
    //        _todo = todo
    //        _rootIsActive = rootIsActive
    //    }
    
    var body: some View {
        VStack {
            //            Text("Read a book")
            //                .font(.custom("HelveticaNeue", size: 60))
            //                .fontWeight(.ultraLight)
            //                .padding(.bottom, 100.0)
            
            //            Button("Animate") {
            //                            isAnimating.toggle()
            //                        }
            //
            //                        Rectangle()
            //                                .foregroundColor(.red)
            //                                .frame(width: 100, height: 200)
            //                                .rotationEffect(Angle(degrees: isAnimating ? 30 : 0))
            //                                .scaleEffect(x: isAnimating ? 0.5 : 1.0, y: isAnimating ? 2.0 : 1.0)
            //                                .animation(Animation.easeInOut(duration: 1.0), value: isAnimating)
            
            ZStack {
                // MARK: 햇빛, 물
                // swich문으로 lv별로 햇빛 위치 다르게??
                
                if isAnimatingFirst {
                    Path { path in
                        switch cnt {
                        case 0: path.move(to: CGPoint(x: 1100, y: -700))
                            path.addLine(to: CGPoint(x: 350, y: 580))
                        case 1: path.move(to: CGPoint(x: 1100, y: -700))
                            path.addLine(to: CGPoint(x: 350, y: 580))
                        case 2: path.move(to: CGPoint(x: 1100, y: -700))
                            path.addLine(to: CGPoint(x: 350, y: 620))
                        case 3: path.move(to: CGPoint(x: 1100, y: -700))
                            path.addLine(to: CGPoint(x: 350, y: 650))
                        case 4: path.move(to: CGPoint(x: 1100, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 800))
                        case 5: path.move(to: CGPoint(x: 1100, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 850))
                        default: path.move(to: CGPoint(x: 1100, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 910))
                        }
//                        path.move(to: CGPoint(x: 1100, y: -700))
//                        path.addLine(to: CGPoint(x: 400, y: 730))
                    }
                    .trim(from: startAmount, to: endAmount)
                    .stroke(style: StrokeStyle(lineWidth: 500))
                    .foregroundColor(ColorManager.lightColor)
                    .frame(width: 800, height: 800)
                    .onAppear {
                        if isRunning {
                            animate()
                        }
                    }
                } else {
                    Path { path in
                        switch cnt {
                        case 0: path.move(to: CGPoint(x: 400, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 580))
                        case 1: path.move(to: CGPoint(x: 400, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 600))
                        case 2: path.move(to: CGPoint(x: 400, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 630))
                        case 3: path.move(to: CGPoint(x: 400, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 640))
                        case 4: path.move(to: CGPoint(x: 400, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 810))
                        case 5: path.move(to: CGPoint(x: 400, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 840))
                        default: path.move(to: CGPoint(x: 400, y: -700))
                            path.addLine(to: CGPoint(x: 400, y: 900))
                        }
//                        path.move(to: CGPoint(x: 400, y: -700))
//                        path.addLine(to: CGPoint(x: 400, y: 780))
                    }
                    .trim(from: startAmount, to: endAmount)
                    .stroke(style: StrokeStyle(lineWidth: 300))
                    .foregroundColor(ColorManager.waterColor)
                    .frame(width: 800, height: 800, alignment: .center)
                    .onAppear {
                        if isRunning {
                            animate()
                        }
                    }
                }
                
                // MARK: 식물
                switch cnt {
                case 0 :
                    Image("lv0")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .offset(x: -10, y: 60)
                case 1:
                    Image("lv1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .offset(x: 0, y: 60)
                case 2:
                    Image("lv2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 350)
                        .offset(x: 0, y: 5)
                case 3:
                    Image("lv3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 500, height: 500)
                        .offset(x: 0, y: -60)
                case 4:
                    Image("lv4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 650, height: 650)
                        .offset(x: -15, y: 30)
                case 5:
                    Image("lv5")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 700, height: 730)
                        .offset(x: -20, y: 30)
                case 6:
                    Image("lv6")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 800, height: 800)
                        .offset(x: -20, y: 45)
                default:
                    Image("lv6")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 800, height: 800)
                        .offset(x: -20, y: 45)
                }
                //                Pentagon(insetAmount: insetAmount)
                //                    .frame(minWidth: 200, idealWidth: 450, maxWidth:600, minHeight: 200, idealHeight: 450, maxHeight: 600, alignment: .center)
                //                    .foregroundColor(ColorManager.waterColor)
                //
                
                // MARK: 할일
                Text(todo)
                    .tracking(2)
                    .font(.custom("HelveticaNeue", size: 70))
                    .fontWeight(.ultraLight)
                    .padding(.bottom, 60.0)
                    .animation(.none)
                    .offset(y: -400)
                // MARK: 시간
                Text("\(String(time))s")
                    .tracking(3)
                    .font(.custom("HelveticaNeue", size: 100))
                    .fontWeight(.ultraLight)
                    .offset(y:300)
                    .animation(.none)
                
            }
            
            // MARK: 스탑워치 버튼
            Button(action: {
                if isRunning{
                    timer?.invalidate()
                    stopAnimation()
                } else {
                    animate()
                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                        time += 1
                    })
                    if animationPaused {
                        resumeAnimation()
                    }
                }
                resumeAnimation()
                isRunning.toggle()
                isDoing = true
                //                if animationIsRunning {
                //                                // 애니메이션 중지
                //                                stopAnimation()
                //                            } else  {
                //                                // 애니메이션 시작
                //                                animate()
                //                            }
                withAnimation {
                    //                    insetAmount = Double.random(in: 200...800)
                }
            }) {
                Text(isRunning ? "Stop" : "Start")
                    .tracking(1)
                    .font(.custom("HelveticaNeue", size: 26))
                    .fontWeight(.light)
                    .padding(.horizontal, 45.0)
                    .padding(.vertical)
                    .background(Capsule().strokeBorder())
                    .accentColor(isRunning ? .red : .blue)
                    .animation(.easeInOut, value: isRunning)
            }
//                        .padding(.top)
            .animation(.none)
            
            // MARK: Finish 버튼
            finishBtn
                .padding(.top,5)
                .animation(.none)
            
        }
        .onAppear {
            cnt = todolist.todoItems.count
        }
    }
    
    // 할일 다 끝내고 Finish 했을 때의 버튼
    var finishBtn: some View {
        // FinishView로 가기
        //        NavigationLink(destination: FinishView(time: $time), isActive: $gotoFinish) {
        NavigationLink(destination: FinishView(rootIsActive: $rootIsActive, needsUpdate: $needsUpdate), isActive: $gotoFinish) {
            
            Button(action: {
                gotoFinish = true
                // 스탑워치 멈추기
                timer?.invalidate()
                isRunning = false
                // 유저의 할일과 시간 저장??
                //                todolist.append(todo)
                //                timelist.append(time)
                todolist.addItem(TodoData(todo: todo, time: time))
                //                tododata.append(ListItem(todo: todo, time: time))
            }) {
                Text("Finish")
                    .tracking(1)
                    .font(.custom("HelveticaNeue", size: 26))
                    .fontWeight(.light)
                    .foregroundColor(isDoing ? .white : .gray)
                    .padding(.horizontal, 45.0)
                    .padding(.vertical)
                    .overlay(
                        Capsule()
                            .stroke(Color.gray, lineWidth: isDoing ? 0 : 2)
                    )
//                    .background(Capsule().strokeBorder())
//                    .accentColor(isDoing ? .green : .gray)
                    .background(isDoing ? .green : .clear)
                    .cornerRadius(50)
                    .animation(.easeInOut, value: isDoing)
            }
        }.disabled(!isDoing)
    }
//    func createPath1() -> Path {
//        var path = Path()
//            path.move(to: CGPoint(x: 1100, y: -700))
//            path.addLine(to: CGPoint(x: 400, y: 730))
//            path = path.trim(from: startAmount, to: endAmount)
//            .stroke(style: StrokeStyle(lineWidth: 500))
//            .foregroundColor(ColorManager.lightColor)
//            .frame(width: 800, height: 800)
//        return path
//    }
//    func createPath2() -> Path {
//        var path = Path()
//            path.move(to: CGPoint(x: 400, y: -700))
//            path.addLine(to: CGPoint(x: 400, y: 780))
//            path = path.trim(from: startAmount, to: endAmount)
//            .stroke(style: StrokeStyle(lineWidth: 300))
//            .foregroundColor(ColorManager.waterColor)
//            .frame(width: 800, height: 800) as! Path
//        return path
//    }
    
    func animate() {
        guard !animationPaused else { return }
        
//        _ = isAnimatingFirst ? createPath1() : createPath2()
        
        withAnimation(Animation.easeInOut(duration: 2)) {
            endAmount = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(Animation.easeInOut(duration: 2)) {
                startAmount = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if !self.animationPaused {
                    isAnimatingFirst.toggle()
                    endAmount = 0
                    startAmount = 0
                    self.animate()
                }
            }
        }
    }
    
    func stopAnimation() {
        if isRunning {
            timer?.invalidate()
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                endAmount = 0
                startAmount = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                animationPaused = true
            }
        }
        
    }
    
    func resumeAnimation() {
        if animationPaused {
            animationPaused = false
            animate()
        }
    }
}


//class TodoList: ObservableObject, Identifiable {
//    @Published var todolist: [String] = []
//    var id: UUID = UUID()
//}

//class TimeList: ObservableObject, Identifiable {
//    @Published var timelist: [Int] = []
//    var id: UUID = UUID()
//}

//class ListItem: ObservableObject, Identifiable {
//    @Published var todo: String
//    @Published var time: Int
//    var id: UUID = UUID()
//
//    init(todo: String, time: Int) {
//        self.todo = todo
//        self.time = time
//    }
//}


//struct Pentagon: Shape {
//    var insetAmount: Double
//
//    func path(in rect: CGRect) -> Path {
//        //        var path = Path()
//        let width = rect.size.width
//        let height = rect.size.height
//
//        let radius = 0.5 * min(width, height) // Radius of the circumscribed circle
//        //                let apothem = 0.5 * radius * CGFloat(tan(Double.pi / 5.0)) // Apothem length
//
//        var path = Path()
//        let startPoint = CGPoint(x: rect.midX, y: rect.minY + radius) // Starting point at the top center of the rectangle
//        path.move(to: startPoint)
//
//        for index in 1...6 {
//            let angle = CGFloat(index) * 2.0 * .pi / 5.0
//            let x = startPoint.x + radius * sin(angle)
//            let y = startPoint.y + radius * cos(angle)
//            let point = CGPoint(x: x, y: y)
//            path.addLine(to: point)
//        }
//
//        path.closeSubpath()
//        return path
//    }
//}

//struct StopwatchView_Previews: PreviewProvider {
//    static var previews: some View {
//        StopwatchView()
//    }
//}
