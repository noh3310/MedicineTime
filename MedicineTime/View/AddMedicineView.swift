//
//  AddMedicineView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/15.
//

import SwiftUI

struct AddMedicineView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var searchViewModel = SearchViewModel()
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(searchViewModel.selectedMedicine?.itemName ?? "약 검색해서 추가하세요")
                        
                        Spacer()
                        
                        NavigationLink {
                            SearchMedicineView(viewModel: searchViewModel)
                        } label: {
                            Text("검색")
                        }
                    }
                    .padding()
                    
                    HStack {
                        Text("복용 시간")
                        Spacer()
                        DatePicker("", selection: $searchViewModel.medicineTime)
                            .fixedSize()
                    }
                    .padding()
                }
            }
            Button {
                if let itemName = searchViewModel.selectedMedicine?.itemName {
                    homeViewModel.addDate(medicineName: itemName, date: searchViewModel.medicineTime)
                    presentation.wrappedValue.dismiss()
                } else {
                    showingAlert = true
                }
            } label: {
                Text("추가")
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
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("약을 추가해주세요"))
            }
        }
        .navigationTitle("복용시간 추가")
    }
}

//struct AddMedicineView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMedicineView()
//    }
//}
