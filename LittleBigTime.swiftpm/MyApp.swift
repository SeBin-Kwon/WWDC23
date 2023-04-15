import SwiftUI

@main
struct MyApp: App {
    init() {
            Font.registerFonts()
            print("실행")
//            var todolist = TodoList()
            //실제 폰트 이름 확인
            //폰트 파일명과 실제 이름이 다를 수 있음
//            for family in UIFont.familyNames{
//                print(family)
//
//                for names in UIFont.fontNames(forFamilyName: family){
//                    print("== \(names)")
//                }
//            }
        }
    
    var body: some Scene {
        let todolist = TodoList()
        WindowGroup {
            ContentView()
                .environmentObject(todolist)
        }
    }
}
