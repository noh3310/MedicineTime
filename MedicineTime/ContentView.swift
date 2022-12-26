//
//  ContentView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }


            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("복용 내역")
                }


            SettingView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("설정")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
