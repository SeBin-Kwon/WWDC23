//
//  FinishView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/09.
//

import SwiftUI

struct FinishView: View {
//    @Binding var time: Int
    @EnvironmentObject var todolist: TodoList
    @Binding var rootIsActive: Bool
    @Binding var needsUpdate: Bool
//    @Binding var todolist: TodoList
//    @Binding var timelist: TimeList
    
    //    init(time: Binding<Int> = .constant(0), rootIsActive: Binding<Bool> = .constant(false)) {
    //        _time = time
    //        _rootIsActive = rootIsActive
    //    }
    
    var body: some View {
        VStack {
//            ForEach(todolist.todoItems, id: \.self) {
//                todoitem in
//                Text("\(todoitem.todo),\(todoitem.time)")
//                    .font(.custom("HelveticaNeue", size: 100))
//                    .fontWeight(.ultraLight)
//            }
            Text("Perfect!")
                .font(.custom("HelveticaNeue", size: 100))
                .fontWeight(.ultraLight)
                .onTapGesture {
                    rootIsActive = false
                    needsUpdate = true
                }
            
            switch todolist.todoItems.count {
            case 1 :
                Text("The seeds have grown!")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                    .onTapGesture {
                        rootIsActive = false
                        needsUpdate = true
                    }
            case 2:
                Text("The sprouts have grown!")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                    .onTapGesture {
                        rootIsActive = false
                        needsUpdate = true
                    }
            case 3:
                Text("The sprouts has grown!")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                    .onTapGesture {
                        rootIsActive = false
                        needsUpdate = true
                    }
            case 4:
                Text("The tree has grown!")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                    .onTapGesture {
                        rootIsActive = false
                        needsUpdate = true
                    }
            case 5:
                Text("The tree has blossomed!")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                    .onTapGesture {
                        rootIsActive = false
                        needsUpdate = true
                    }
            case 6:
                Text("The tree bore fruit!")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                    .onTapGesture {
                        rootIsActive = false
                        needsUpdate = true
                    }
            default:
                Text("You're doing great! Keep going!")
                    .font(.custom("HelveticaNeue", size: 50))
                    .fontWeight(.ultraLight)
                    .onTapGesture {
                        rootIsActive = false
                        needsUpdate = true
                    }
            }
//            if todolist.todoItems.count >= 7 {
//                Image("lv6")
//                    .resizable()
//                    .frame(maxWidth: 500)
//            }
            
            //            NavigationLink(destination: ContentView()) {
            //                Text("Finish")
            //            }.navigationBarBackButtonHidden(true)
            //        }
            
        }.navigationBarBackButtonHidden(true)
        
        //    var finishBtn: some View {
        //            NavigationLink(destination: FinishView(time: $time), isActive: $gotoFinish) {
        //                Button(action: {
        //                    gotoFinish = true
        //                    timer?.invalidate()
        //                    isRunning = false
        //                }) {
        //                    Text("Finish")
        //                        .font(.custom("HelveticaNeue", size: 26))
        //                        .fontWeight(.light)
        //                        .padding(.horizontal, 45.0)
        //                        .padding(.vertical)
        //                        .background(Capsule().strokeBorder())
        //                        .accentColor(isDoing ? .green : .gray)
        //                        .animation(.easeInOut, value: isDoing)
        //                }
        //            }
        //    }
    }
    
    //struct FinishView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        FinishView()
    //    }
    //}
}
