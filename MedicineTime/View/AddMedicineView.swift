//
//  AddMedicineView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/15.
//

import SwiftUI

struct AddMedicineView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(viewModel.selectedMedicine?.itemName ?? "약 검색해서 추가하세요")
                        
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
                        DatePicker("", selection: $viewModel.medicineTime)
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
