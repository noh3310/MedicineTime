//
//  HomeView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/14.
//
import SwiftUI

struct CalendarView: View {
    
    @State var currentDate: Date = Date()
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                // custom Date Picker
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
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

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
