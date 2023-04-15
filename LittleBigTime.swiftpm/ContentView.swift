import SwiftUI

struct ContentView: View {
    @State var rootIsActive: Bool = false
//    @Binding var tododata: [ListItem]
    @EnvironmentObject var todolist: TodoList
//    @ObservedObject var todolist: TodoList
    @State private var needsUpdate: Bool = false
    @State private var allTime: Int = 0
    var body: some View {
        NavigationView {
            ZStack {
            // 레벨마다 이미지 다르게 넣기
            switch todolist.todoItems.count {
            case 0 :
                Image("lv0")
            case 1:
                Image("lv1")
            case 2:
                Image("lv2")
            case 3:
                Image("lv3")
            case 4:
                Image("lv4")
            case 5:
                Image("lv5")
            case 6:
                Image("lv6")
            default:
                Image("lv0")
            }
            VStack {
                Text("Little Big Time")
                    .font(.custom("HelveticaNeue", size: 95))
                    .fontWeight(.ultraLight)
                    .padding(.top, 150.0)
                    .padding(.bottom, 350.0)
                
                Text("개수: \(todolist.todoItems.count)")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                
                
                Text("총 시간: \(allTime)s")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                
                
                ForEach(todolist.todoItems, id: \.self) {
                    todoitem in
                    Text("한일: \(todoitem.todo),시간:  \(todoitem.time)")
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.ultraLight)
                }
                
                Spacer()
                NavigationLink(destination: CreateView(rootIsActive: $rootIsActive, needsUpdate: $needsUpdate), isActive: $rootIsActive) {
                    Button(action: {
                        rootIsActive = true
                    }) {
                        Text("Start")
                            .font(.custom("HelveticaNeue", size: 40))
                            .fontWeight(.light)
                            .padding(.horizontal, 60.0)
                            .padding(.vertical)
                            .background(Capsule().strokeBorder())
                            .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
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
            .padding(.bottom, 150.0)
        }
        .navigationViewStyle(.stack)
        //        .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    // 리스트 개수가 0이면 swich문
}
