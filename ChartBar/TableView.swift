////
////  TableView.swift
////  ChartBar
////
////  Created by Students on 08.02.2023.
////
//
//import SwiftUI
//
//struct TableView: View {
//    
//    var bars: [Item] = [
//        Item(category: "Інші відходи",
//            kilo: 17,
//            color: .purple
//           ),
//        Item(category: "Скло",
//            kilo: 15,
//            color: .cyan
//           ),
//        Item(category: "Папір",
//            kilo: 16,
//            color: .yellow
//           ),
//        Item(category: "Пластик",
//            kilo: 20,
//            color: .pink
//           )
//    ]
//    
//    let columns: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    
//    var body: some View {
//        LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
//            ForEach(bars) { bar in
//                HStack() {
//                    Image(systemName: "rectangle.fill")
//                        .renderingMode(.original)
//                        .foregroundColor(bar.color)
//                    Text("\(bar.valueWeight) \(bar.category)")
//                        .font(.caption)
//                }
//            }
//        }
//        .padding(.horizontal)
//        .background {
//            RoundedRectangle(cornerRadius: 10)
//                .fill(.green.opacity(0.1))
//        }
//    }
//}
//
//struct TableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TableView()
//    }
//}
