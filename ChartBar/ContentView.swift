
import SwiftUI

struct Item: Identifiable{
    let id = UUID()
    var category: String
    var kilo: Int
    var kiloString: String {
        return "\(kilo) кг"
    }
    
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
    
    var money: Int
    var moneyString: String {
        return "\(money) ГРН"
    }
    var percent: Double
    var imageName: Image
    var imageColor: Color
    
}

struct ContentView: View {
    
    var items: [Item] = [
        Item(
            category: "Пластик",
            kilo: 6000,
            fixCountAmount: 2,
            money: 423,
            percent: 0.1,
            imageName: Image("category_plastic"),
            imageColor: .pink
        ),
        Item(
            category: "Інші відходи",
            kilo: 17,
            fixCountAmount: 9,
            money: 13835,
            percent: 0.33,
            imageName: Image("category_other"),
            imageColor: .purple
        ),
        Item(
            category: "Папір",
            kilo: 16,
            fixCountAmount: 1,
            money: 1099,
            percent: 0.27,
            imageName: Image("category_paper"),
            imageColor: .yellow
        ),
        Item(
            category: "Скло",
            kilo: 15,
            fixCountAmount: 1,
            money: 1237,
            percent: 0.3,
            imageName: Image("category_glass"),
            imageColor: .cyan
        ),
    ]
    
    let titleMain = "Звіт"
    let titleStairsMonth = "Відходи, які ви переробили за місяць"
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    let titleEarnedMoney = "Гроші, які ви заробили за місяць"
    
    var body: some View {
        VStack {
            Spacer()
            Text(titleMain)
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .textCase(.uppercase)
            Spacer()
            VStack(spacing: 0) {
                Text(titleStairsMonth)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(5)
                    .padding(.vertical)
                
                HStack(alignment: .bottom) {
                    ForEach(sortedItems()) { bar in
                        RoundedRectangle(cornerRadius: 16)
                            .fill(bar.imageColor)
                            .frame(width: 65, height: setHeight(value: bar.kilo))
                            .overlay(alignment: .top) {
                                Text("\(bar.kilo)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(5)
                                    .foregroundColor(.white)
                                    .offset (y: setOffset(value: bar.kilo) )
                            }
                    }
                }
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(sortedItems()) { item in
                        HStack(spacing: 3) {
                            Image(systemName: "rectangle.fill")
                                .renderingMode(.original)
                                .foregroundColor(item.imageColor)
                            Text("\(item.kiloString) \(item.category)")
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 5)
                    }
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                }
                .overlay {
                    HStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(width: 1)
                    }
                    .padding()
                }
            }
            .padding()
            .background(.teal.opacity(0.3))
            .cornerRadius(32)
            .padding()
            
            Spacer()
            
            Text(titleEarnedMoney.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical, 10)
            
            Spacer()
            
            ForEach(sortedItems()) { item in
                HStack {
                    item.imageName
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background {
                            Circle()
                                .fill(item.imageColor)
                        }
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text(item.category)
                            .fontWeight(.medium)
                            .textCase(.uppercase)
                        Text(item.fixCountString)
                            .foregroundColor(Color(uiColor: .lightGray))
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(item.moneyString)
                            .fontWeight(.medium)
                        Text(item.percent, format: .percent)
                            .foregroundColor(Color(uiColor: .lightGray))
                    }
                    .font(.footnote)
                }
                .padding(.horizontal, 30)
            }
            Spacer()
        }
    }
    
    private func setHeight(value: Int) -> CGFloat {
        if let maxValue = items.max(by: { $0.kilo < $1.kilo }) {
            let rezult = (value * 100) / maxValue.kilo
            return CGFloat(rezult)
        }
        return CGFloat(0)
    }
    
    private func sortedItems() -> [Item] {
        let sortedArray = items.sorted(by: { $0.money > $1.money })
        return sortedArray
    }
    
    private func setOffset(value: Int) -> CGFloat {
        if setHeight(value: value) < 30 { return -30 } else { return 0 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
