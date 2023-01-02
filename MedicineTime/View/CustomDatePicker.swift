//
//  CustomDatePicker.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/14.
//
import SwiftUI
import RealmSwift

struct CustomDatePicker: View {

    @Binding var currentDate: Date

    @State var currentMonth: Int = 0
    
    let days: [String] = ["일", "월", "화", "수", "목", "금", "토"]

    @ObservedResults(MedicineData.self) var medicins

    var body: some View {
        VStack(spacing: 35) {

            HStack(spacing: 20) {

                VStack(alignment: .leading, spacing: 10) {

                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)

                    Text(extraDate()[1])
                        .font(.title.bold())
                }

                Spacer()

                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }

                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
                .padding()

            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }

            //Dates
            let columns = Array(repeating: GridItem(.flexible()), count: 7)

            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color.pink)
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }

            VStack(spacing: 15) {
                Text("복용 기록")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)

                if !todayMedicineData(date: currentDate).isEmpty {
                    ForEach(todayMedicineData(date: currentDate)) { task in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(task.date, style: .time)

                            Text(task.name)
                                .font(.title2.bold())
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color.pink
                                .opacity(0.5)
                                .cornerRadius(10)
                        )
                    }
                } else {
                    Text("없음")
                }
            }
            .padding()
        }
        .onChange(of: currentMonth) { newValue in
            currentDate = getCurrnetMonth()
        }
    }

    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                
                // 선택한 날짜와 달력값이 일치한다면
                if isSameDay(date1: value.date, date2: currentDate) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)

                    Spacer()

                    Circle()
                        .fill(isInDatabase(date: value.date) ? .white : Color.pink)
                        .frame(width: 8, height: 8)
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)

                    Spacer()

                    Circle()
                        .fill(isInDatabase(date: value.date) ? .pink : .white)
                        .frame(width: 8, height: 8)
                }

            }
        }
        .padding(.vertical, 8)
        .frame(height: 60, alignment: .top)
    }
    
    func todayMedicineData(date: Date) -> [MedicineData] {
        return medicins.elements.filter { isSameDay(date1: date, date2: $0.date) }.sorted()
    }
    
    func isInDatabase(date: Date) -> Bool {
        var result = false
        medicins.elements.forEach { medicine in
            if isSameDay(date1: medicine.date, date2: date) {
                result = true
            }
        }
        return result
    }

    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current

        return calendar.isDate(date1, inSameDayAs: date2)
    }

    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"

        let date = formatter.string(from: currentDate)

        return date.components(separatedBy: " ")
    }

    func getCurrnetMonth() -> Date {
        let calendar = Calendar.current

        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }

        return currentMonth
    }

    func extractDate() -> [DateValue] {
        let calendar = Calendar.current

        let currentMonth = getCurrnetMonth()

        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)

            return DateValue(day: day, date: date)
        }

        // adding offset days to get exact week day
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())

        for _ in 0..<firstWeekDay - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }

        return days
    }
}

//struct CustomDatePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//    }
//}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current

        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!

        let range = calendar.range(of: .day, in: .month, for: startDate)!

        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
