//
//  FinishView.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/09.
//

import SwiftUI

struct FinishView: View {
    @EnvironmentObject var todolist: TodoList
    @Binding var rootIsActive: Bool
    @Binding var needsUpdate: Bool
    @State var isFirst = false
    @State var isSecond = false
    @State var isCircle = false
    @State var isOpacity = true
    
    var body: some View {
        //            ForEach(todolist.todoItems, id: \.self) {
        //                todoitem in
        //                Text("\(todoitem.todo),\(todoitem.time)")
        //                    .font(.custom("HelveticaNeue", size: 100))
        //                    .fontWeight(.ultraLight)
        //            }
        ZStack {
            Circle()
                .stroke(Color.blue, lineWidth: 2)
                .frame(width: 1500, height: 1500)
                .scaleEffect(isCircle ? 1 : 0)
                .opacity(isOpacity ? 1 : 0)
                .animation(.easeInOut(duration: 1.8), value: isCircle)
                .animation(.easeInOut(duration: 1), value: isOpacity)
            
            VStack {
                Text("Perfect!")
                    .tracking(2)
                    .font(.custom("HelveticaNeue", size: 100))
                    .fontWeight(.ultraLight)
//                    .padding(.bottom, 0.5)
                    .opacity(isFirst ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1), value: isFirst)
                
                switch todolist.todoItems.count {
                case 1 :
                    Text("The seed has grown!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.thin)
                        .foregroundColor(.green)
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 2:
                    Text("The sprout has grown!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.thin)
                        .foregroundColor(.green)
//                        .onTapGesture {
//                            rootIsActive = false
//                            needsUpdate = true
//                        }
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 3:
                    Text("The sprout has grown!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.thin)
                        .foregroundColor(.green)
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 4:
                    Text("The tree has grown!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.thin)
                        .foregroundColor(.green)
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 5:
                    Text("The tree has blossomed!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.thin)
                        .foregroundColor(.green)
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                case 6:
                    Text("The tree bore fruit!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.thin)
                        .foregroundColor(.green)
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                default:
                    Text("You're doing great! Keep going!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 50))
                        .fontWeight(.thin)
                        .foregroundColor(.green)
                        .opacity(isFirst ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(1), value: isFirst)
                }
                
            }
//            .offset(y:120)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    isFirst.toggle()
                    isCircle.toggle()
                    isOpacity.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isFirst.toggle()
                    isSecond.toggle()
                }
            }
            VStack {
                switch todolist.todoItems.count {
                case 1 :
                    Text("Remember that the small moments,\nthough they may seem insignificant are precious\nbuilding blocks that shape our lives over time.")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                        .lineSpacing(6)
                        .padding(.bottom, 200)
                case 2 :
                    Text("Why don't you take a moment to think about\nwhat valuable things you can do on your own?\nAnd then put it into action! You'll see how much\nthe sprout will grow as a result.")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                        .lineSpacing(6)
                        .padding(.bottom, 200)
                case 3 :
                    Text("Doesn't time seem like a lot when we\nlook at it in seconds?\nWith all that time,\nyou can accomplish so much.")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                        .lineSpacing(6)
                        .padding(.bottom, 200)
                case 4 :
                    Text("Sometimes when you feel tired,\ntake a break and give sunlight and water\nto the tree. That time is also truly valuable.")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                        .lineSpacing(6)
                        .padding(.bottom, 200)
                case 5 :
                    Text("Just as small moments accumulate\nand grow into big trees, it's certain that\nour lives will also continue to grow and develop!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                        .lineSpacing(6)
                        .padding(.bottom, 200)
                case 6 :
                    Text("While the growth of a tree may come to an end,\nour growth never stops. Let's continue to use\nour small moments wisely to make our lives valuable!")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                        .lineSpacing(6)
                        .padding(.bottom, 200)
                default:
                    Text("Remember that the small moments,\nthough they may seem insignificant are precious\nbuilding blocks that shape our lives over time.")
                        .tracking(2)
                        .font(.custom("HelveticaNeue", size: 40))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                        .lineSpacing(6)
                        .padding(.bottom, 200)
                }
                
                Button(action: {
                    rootIsActive = false
                    needsUpdate = true
                }) {
                    Text("Back to home")
                        .tracking(1)
                        .font(.custom("HelveticaNeue", size: 28))
                        .fontWeight(.light)
                        .padding(.horizontal, 60.0)
                        .padding(.vertical)
                        .accentColor(.blue)
                        .background(Capsule().strokeBorder())
                        .opacity(isSecond ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2), value: isSecond)
                }
            }.offset(y:100)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    //struct FinishView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        FinishView()
    //    }
    //}
}
