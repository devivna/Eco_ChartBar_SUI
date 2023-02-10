//
//  BarChart.swift
//  ChartBar
//
//  Created by Students on 07.02.2023.
//

import SwiftUI
import Charts

struct Bar2: Identifiable{
    let id = UUID()
    var category: String
    var value: Int
    var valueRect: CGFloat {
        return CGFloat(value) * 10
    }
    var valueWeight: String {
        return "\(value) кг"
    }
    var color: Color
}

struct BarChart: View {
    
    var bars: [Bar2] = [
        Bar2(category: "Інші відходи",
             value: 17,
        color: .purple
       ),
        Bar2(category: "Скло",
             value: 15,
        color: .cyan
       ),
        Bar2(category: "Папір",
             value: 16,
        color: .yellow
       ),
        Bar2(category: "Пластик",
             value: 20,
        color: .pink
       )
    ]
    
    var body: some View {
        Chart {
            ForEach(bars) { bar in
                BarMark(x: .value("Label", bar.category),
                        y: .value("Label", bar.value))
            }
        }
        .frame(height: 200)
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
