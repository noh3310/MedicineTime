//
//  HomeView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/15.
//
import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            List {
                MedicineInformationCell()
                MedicineInformationCell()
                MedicineInformationCell()
                MedicineInformationCell()
                MedicineInformationCell()
            }
            .listStyle(.plain)
            .navigationTitle("복약")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    AddMedicineView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct MedicineInformationCell: View {
    var body: some View {
        HStack {

            Text("약")
                .font(.title)

            Text("13:00")

            Spacer()

            Image(systemName: "x.circle")
                .font(.title)
                .foregroundColor(.red)
            Image(systemName: "checkmark.circle")
                .font(.title)
                .foregroundColor(.blue)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.gray
                .opacity(0.5)
                .cornerRadius(10)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        MedicineInformationCell()
    }
}
