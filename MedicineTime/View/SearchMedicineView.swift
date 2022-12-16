//
//  SearchMedicineView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/15.
//

import SwiftUI

struct SearchMedicineView: View {
    let array = [
        "김서근", "포뇨", "하울", "소피아", "캐시퍼", "소스케",
        "치히로", "하쿠", "가오나시", "제니바", "카브", "마르클",
        "토토로", "사츠키", "지브리", "스튜디오", "캐릭터", "Kim"
    ]
    
    @State private var searchText = ""
//    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                List {
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
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
