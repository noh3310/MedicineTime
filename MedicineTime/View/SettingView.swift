//
//  SettingView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/20.
//

import SwiftUI

struct SettingView: View {
    
    @State var setList = ["프로필", "설정"]
    
    var body: some View {
        NavigationView {
            List(setList, id: \.self) { title in
                Text("\(title)")
            }
            .listStyle(.plain)
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
