//
//  ContentView.swift
//  vidu2
//
//  Created by phong on 03/08/2022.
//

import SwiftUI

//struct Student: Identifiable {
 //   var id = UUID()
 //   var name: String
//}

//struct studentRow: View {
  //  var student: Student
  //  var body: some View {
   //     Text(student.name)
  //  }
//}

struct ContentView: View {
   // let longPressGesture: LongPressGesture = {
    //    var longPress = LongPressGesture()
    //    longPress.minimumDuration = 2
    //    return longPress
   // }()
   var arrayField1 = ["agri","apps","3d","ioT"]
    //@State var birthday = Date()
   // @State var selectedIndex = 0
    @State var favorite_items = 0
    @State var currentPosition: CGSize = .zero
    @State var endPosition: CGSize = .zero
    @State private var name = "Dung"
    @State var bat_tat = false
    @State var number1 = 5.0
    
    //var list_student = [
     //   Student(name: "A"),
      //  Student(name: "B"),
     //   Student(name: "C"),
   // ]
    //var dateFormatter: DateFormatter {
       // let formatter = DateFormatter()
       // formatter.dateStyle = .medium
       // return formatter
   // }
    
    var body: some View {
        
        VStack() {
        Toggle(isOn: $bat_tat) {
                Text("On / Off")
            }
            
            if bat_tat {
        Text(name).font(.title).fontWeight(.heavy).foregroundColor(Color.blue)
        Button(action: {
                if (self.name == "Hoang") {
                    self.name = "Dung"
                } else {
                    self.name = "Hoang"
                }
                
            }, label: {
                Text("Button")
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            })
       // Divider()
        Slider(value: $number1 , in: 1...10)
        Text("value: \(number1)")
        TextField("input", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
                Image("myimage").resizable().frame(width: 125, height: 175)
                //.onTapGesture(count: 1) {
                  // print("OK")
               // }
                    //.onLongPressGesture(minimumDuration: 2, pressing: {(isPress) in print("is Press \(isPress)") } )
                //{ print("OK") }
                    //.gesture(longPressGesture.onChanged({
                      //  (isChange) in print("\(isChange)")
                    //}).onEnded({
                   //    (isEnd) in
                   //     print("\(isEnd)")
                   // })
                  //  )
                //.gesture(TapGesture(count: 2).onEnded({() in print("OK") }))
                    .offset(x: currentPosition.width, y:currentPosition.height)
                    .gesture(DragGesture()
                        .onChanged({ (value) in
                            self.currentPosition = CGSize(width: self.endPosition.width + value.translation.width, height: self.endPosition.height + value.translation.height)})
                        .onEnded({ (value) in
                            self.currentPosition = CGSize(width: self.endPosition.width + value.translation.width, height: self.endPosition.height + value.translation.height)
                            self.endPosition = self.currentPosition
                        
                    })
                    
                    )
            }
          //  List(list_student) { istudent in
          //      studentRow(student: istudent)
         //   }
         //   Picker(selection: $selectedIndex, label: Text("Please select:"))
           //{
             //   ForEach(0 ..< 4) {
               //     Text(self.arrayField1[$0])
               //}
            //}
            //Text("You select: \(arrayField1[selectedIndex])")
            //DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date)
            //{
            //    Text("Please select birthday: ")
            //}
           // Text("Your birthday is: \(birthday, formatter: dateFormatter)")
        Picker(selection: $favorite_items, label:
        Text ("My favorite items:"))
               {
                   ForEach(0..<4) { index in
                       Text(arrayField1[index]).tag(index)
                   }
                   //Text("3d").tag(0)
                  // Text("agri").tag(1)
                   //Text("apps").tag(2)
               }.pickerStyle(SegmentedPickerStyle())
            Text("\(arrayField1[favorite_items])")
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}
