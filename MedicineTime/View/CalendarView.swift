//
//  HomeView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/14.
//
import SwiftUI

struct CalendarView: View {

    @State var currentDate: Date = Date()

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
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
