import SwiftUI

struct PendulumAnimation: View {
    @State private var rotationAngle: Angle = .degrees(0.0)
    @State private var direction: CGFloat = 1.0
    @State private var dragOffset: CGSize = .zero
    let imageName: String
    let amplitude: CGFloat
    let animationDuration: Double

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotationEffect(rotationAngle, anchor: .bottom)
            .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true), value: rotationAngle)
            .gesture(DragGesture()
                .onChanged { value in
                    let dragAngle = Angle(radians: Double(value.translation.width) * 0.01)
                    let newRotationAngle = Angle.degrees(amplitude * Double(direction)) + dragAngle
                                        rotationAngle = clampRotationAngle(newRotationAngle)
                }
                .onEnded { value in
                    rotationAngle = .degrees(0)
                }
            )
            .onAppear {
                startPendulumAnimation()
            }
    }

    private func startPendulumAnimation() {
        withAnimation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true)) {
            rotationAngle = .degrees(amplitude * direction)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            direction *= -1
            rotationAngle = .degrees(0)
            startPendulumAnimation()
        }
    }
    
    private func clampRotationAngle(_ angle: Angle) -> Angle {
            let clampedAngle = min(max(angle.degrees, -90.0), 90.0)
            return .degrees(clampedAngle)
        }
}

struct ContentView: View {
    @State var rootIsActive: Bool = false
//    @Binding var tododata: [ListItem]
    @EnvironmentObject var todolist: TodoList
    @State private var needsUpdate: Bool = false
    @State private var allTime: Int = 0
//    @State private var isAnimated: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
            // MARK: 이미지
            switch todolist.todoItems.count {
            case 0 :
                PendulumAnimation(imageName: "lv0", amplitude: 10.0, animationDuration: 3.0)
                    .frame(width: 50)
                    .offset(x: 0, y: 90)
            case 1:
                PendulumAnimation(imageName: "lv1", amplitude: 10.0, animationDuration: 1.6)
                    .frame(width: 200)
                    .offset(x: 0, y: 80)
            case 2:
                PendulumAnimation(imageName: "lv2", amplitude: 7.0, animationDuration: 1.6)
                    .frame(width: 300)
                    .offset(x: 0, y: 10)
            case 3:
                PendulumAnimation(imageName: "lv3", amplitude: 5.0, animationDuration: 1.7)
                    .frame(width: 500)
                    .offset(x: 0, y: 70)
            case 4:
                PendulumAnimation(imageName: "lv4", amplitude: 5.0, animationDuration: 1.8)
                    .frame(width: 700)
                    .offset(x: -32, y: 60)
            case 5:
                PendulumAnimation(imageName: "lv5", amplitude: 4.0, animationDuration: 2.0)
                    .frame(width: 800)
                    .offset(x: -35, y: 60)
            case 6:
                PendulumAnimation(imageName: "lv6", amplitude: 3.0, animationDuration: 2.0)
                    .frame(width: 1000)
                    .offset(x: -30, y: 60)
            default:
                PendulumAnimation(imageName: "lv6", amplitude: 3.0, animationDuration: 2.0)
                    .frame(width: 1000)
                    .offset(x: -30, y: 60)
            }
            VStack {
                Text("Little Big Time")
                    .tracking(5)
                    .font(.custom("HelveticaNeue", size: 95))
                    .fontWeight(.ultraLight)
                    .padding(.top, 150.0)
                    .padding(.bottom, 350.0)
                
                if todolist.todoItems.count == 0 {
                    Text("Let's grow a small seed together, and who knows,\nthat small beginning might lead to bigger dreams.")
                        .tracking(2.5)
                        .font(.custom("HelveticaNeue", size: 25))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .offset(x: 0, y: 130)
                        .lineSpacing(7)
                        
                } else {
                    Text("\(allTime)s")
                        .tracking(3)
                        .font(.custom("HelveticaNeue", size: 100))
                        .fontWeight(.ultraLight)
                        .offset(x: 0, y: 200)
                }
                
//                ForEach(todolist.todoItems, id: \.self) {
//                    todoitem in
//                    Text("한일: \(todoitem.todo),시간:  \(todoitem.time)")
//                        .font(.custom("HelveticaNeue", size: 50))
//                        .fontWeight(.ultraLight)
//                }
                
                Spacer()
                NavigationLink(destination: CreateView(rootIsActive: $rootIsActive, needsUpdate: $needsUpdate), isActive: $rootIsActive) {
                    Button(action: {
                        rootIsActive = true
                    }) {
                        Text("Start")
                            .tracking(1)
                            .font(.custom("HelveticaNeue", size: 35))
                            .fontWeight(.light)
                            .padding(.horizontal, 60.0)
                            .padding(.vertical)
                            .accentColor(.blue)
                            .background(Capsule().strokeBorder())
                            
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            }
            .onChange(of: needsUpdate, perform: { _ in
                            // Perform actions when needsUpdate changes
                            // For example, you can update the view or trigger other actions
//                            print("needsUpdate changed: \(needsUpdate)")
                        })
            .onAppear {
                self.needsUpdate.toggle()
                allTime = todolist.todoItems.reduce(0) { $0 + $1.time }
                        }
            .padding(.bottom, 190.0)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .animation(.none)
    }
}
 
