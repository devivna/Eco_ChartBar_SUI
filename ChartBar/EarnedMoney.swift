//
//  EarnedMoney.swift
//  ChartBar
//
//  Created by Students on 07.02.2023.
//

import SwiftUI

struct EarnMoneyModel: Identifiable {
    var id = UUID()
    var category: String
    var fixCountAmount: Int
    var fixCountString: String {
        
        var newAmount = fixCountAmount
        
        if newAmount > 20 {
            while newAmount >= 10 {
                newAmount = Int(newAmount % 10)
            }
        }
        
        switch newAmount {
        case 1:
            return "\(fixCountAmount) Фіксація"
        case 2, 3, 4:
            return "\(fixCountAmount) Фіксації"
        default:
            return "\(fixCountAmount) Фіксацій"
        }
    }
    
    var amount: Int
    var amountMoney: String {
        return "\(amount) ГРН"
    }
    var percent: Double
    var imageName: Image
    var imageColor: Color
}


struct EarnedMoney: View {
    
    @State private var maxValue = 0
    
    var items: [EarnMoneyModel] = [
        EarnMoneyModel(
            category: "Пластик",
            fixCountAmount: 2,
            amount: 423,
            percent: 0.1,
            imageName: Image("category_plastic"),
            imageColor: .pink
        ),
        EarnMoneyModel(
            category: "Інше",
            fixCountAmount: 9,
            amount: 13835,
            percent: 0.33,
            imageName: Image("category_other"),
            imageColor: .purple
        ),
        EarnMoneyModel(
            category: "Папір",
            fixCountAmount: 1,
            amount: 1099,
            percent: 0.27,
            imageName: Image("category_paper"),
            imageColor: .yellow
        ),
        EarnMoneyModel(
            category: "Скло",
            fixCountAmount: 1,
            amount: 1237,
            percent: 0.3,
            imageName: Image("category_glass"),
            imageColor: .cyan
        ),
    ]
    
    let title = "Гроші, які ви заробили за місяць"
    
    var body: some View {
        VStack {
            
            Text(title.uppercased())
                .font(.callout)
                .fontWeight(.medium)
                .padding(.vertical, 10)
            
            ForEach(sortedItems()) { item in
                HStack {
                    item.imageName
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background {
                            Circle()
                                .fill(item.imageColor)
                        }
                        .padding(.trailing, 10)
                    
                    
                    VStack(alignment: .leading) {
                        Text(item.category.uppercased())
                            .font(.callout)
                            .fontWeight(.medium)
                        Text(item.fixCountString)
                            .foregroundColor(Color(uiColor: .lightGray))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(item.amountMoney)
                            .font(.callout)
                            .fontWeight(.medium)
                        Text(item.percent, format: .percent)
                            .foregroundColor(Color(uiColor: .lightGray))
                    }
                }
                .padding(.horizontal, 20)                
            }
        }
    }
    
    private func sortedItems() -> [EarnMoneyModel] {
        let sortedArray = items.sorted(by: { $0.percent > $1.percent })
        return sortedArray
    }
}

struct EarnedMoney_Previews: PreviewProvider {
    static var previews: some View {
        EarnedMoney()
    }
}
