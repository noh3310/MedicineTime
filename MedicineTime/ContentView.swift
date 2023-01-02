//
//  ContentView.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/12.
//

import SwiftUI

struct ContentView: View {
    
    enum Tab: String {
        case calendarView = "복용 내역"
        case setting = "설정"
    }
        
    @State private var selection: Tab = .calendarView
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                CalendarView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text(Tab.calendarView.rawValue)
                    }
                    .tag(Tab.calendarView)
                
                SettingView()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text(Tab.setting.rawValue)
                    }
                    .tag(Tab.setting)
            }
            .navigationTitle(selection.rawValue)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
