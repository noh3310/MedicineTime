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
        List(setList, id: \.self) { title in
            Text("\(title)")
        }
        .listStyle(.plain)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
