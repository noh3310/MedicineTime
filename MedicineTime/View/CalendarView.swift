//
//  HomeView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/14.
//
import SwiftUI
import RealmSwift
import Combine

struct CalendarView: View {

//    @ObservedResults(MedicineData.self) var medicines
    @State var currentDate: Date = Date()
    @ObservedObject var viewModel = HomeViewModel()
    
//    @ObservedRealmObject var dog: MedicineData
    @ObservedResults(MedicineData.self) var dogs

    var body: some View {

        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // custom Date Picker
                    CustomDatePicker(currentDate: $currentDate)
                }
                .padding(.vertical)
            }
            .navigationTitle("복용 내역")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    AddMedicineView(homeViewModel: viewModel)
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
