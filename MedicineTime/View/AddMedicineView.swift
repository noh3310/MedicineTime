//
//  AddMedicineView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/15.
//

import SwiftUI

enum AMPM: String {
    case AM = "AM"
    case PM = "PM"
}

struct MedicineTime {
    var hour: Int
    var minute: Int
    var ampm: AMPM
    var uuid = UUID()
    
    func time() -> String {
        return "\(hour):\(minute) \(ampm.rawValue)"
    }
}

struct AddMedicineView: View {
    
    @State var medicineTitle = ""
    @State var time: [MedicineTime] = [MedicineTime(hour: 1, minute: 20, ampm: .AM)]
    @State var count = 0
    
    func add() {
        count += 1
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    
                    HStack {
                        TextField("약 이름을 입력하세요", text: $medicineTitle)
                            .padding()
                        
                        Button {
                            // 약 검색 화면 추가
                        } label: {
                            Text("검색")
                        }
                    }
                    .padding()
                    
                    HStack {
                        Text("복용 시간")
                        Spacer()
                        Button {
                            // 배열 추가
                            time.append(MedicineTime(hour: 1, minute: count * 10, ampm: .AM))
                            add()
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.blue)
                                .font(.title)
                        }
                    }
                    .padding()
                    
                    ForEach(0..<time.count, id: \.self) { index in
                        HStack {
                            Text(time[index].time())
                            Spacer()
                            Button {
                                self.time.remove(at: index)
                            } label: {
                                Image(systemName: "minus.circle")
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                        }
                        .padding()
                    }
                }
            }
            Button {
                //
            } label: {
                Text("추가 or 수정")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(
                        Color.blue
                            .opacity(0.5)
                            .cornerRadius(10)
                    )
                    .padding()
            }
        }
        
    }
}

struct AddMedicineView_Previews: PreviewProvider {
    static var previews: some View {
        AddMedicineView()
    }
}
