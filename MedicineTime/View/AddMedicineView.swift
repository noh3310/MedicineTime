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
    @State var date = Date()
    
    @ObservedObject var viewModel = SearchViewModel()
    
    func add() {
        count += 1
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(viewModel.selectedMedicine?.itemName ?? "약 추가하세요")
//                        TextField("약 이름을 입력하세요", text: $viewModel.searchText)
                        
                        Spacer()
                        
                        NavigationLink {
                            SearchMedicineView(viewModel: viewModel)
                        } label: {
                            Text("검색")
                        }
                    }
                    .padding()
                    
                    HStack {
                        Text("복용 시간")
                        Spacer()
                        DatePicker("", selection: $date)
                            .fixedSize()
                    }
                    .padding()
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
        .navigationTitle("약 추가 or 수정")
    }
}

struct AddMedicineView_Previews: PreviewProvider {
    static var previews: some View {
        AddMedicineView()
    }
}
