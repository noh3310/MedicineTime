//
//  SearchMedicineView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/15.
//

import SwiftUI

struct SearchMedicineView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            
            List {
                ForEach(viewModel.searchMedicineData, id: \.self) { data in
                    Text(data.itemName ?? "이름 없음")
                        .onTapGesture {
                            self.viewModel.selectedMedicine = data
                            presentation.wrappedValue.dismiss()
                        }
                }
            }
            .listStyle(PlainListStyle())
            .onTapGesture {
                hideKeyboard()
            }
        }
        .navigationBarTitle("검색")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchMedicineView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMedicineView()
    }
}

//화면 터치시 키보드 숨김
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
