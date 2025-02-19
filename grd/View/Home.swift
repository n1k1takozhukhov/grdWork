import SwiftUI

struct Home: View {
    ///View Properties
    @State private var allExpenses: [Expense] = []
    ///Environment Values
    @Environment(\.colorScheme) private var scheme
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 15, content: {
                    Text("Hello iJustine")
                        .font(.largeTitle.bold())
                        .padding(.horizontal, 15)
                    
                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)
                        
                        ///Card View
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(cards) { card in
                                    CardView(card)
                                        .containerRelativeFrame(.horizontal)
                                }
                            }
                        }
                    }
                    .frame(height: 125)
                })
                
                LazyVStack(spacing: 15) {
                    Menu {
                        
                    } label: {
                        HStack(spacing: 4) {
                            Text("Filter By")
                            Image(systemName: "chevron.down")
                        }
                        .font(.caption)
                        .foregroundStyle(.gray)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    ForEach(allExpenses) { expense in
                        ExpenseCardView(expense)
                    }
                }
                .padding(15)
            }
            .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
        .onAppear {
            allExpenses = expenses.shuffled()
        }
    }
    
    ///Card View
    @ViewBuilder
    func CardView(_ card: Card) -> some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            
            ZStack {
                Rectangle()
                    .fill(card.bcColor)
                    .overlay(alignment: .leading) {
                        Circle()
                            .fill(card.bcColor)
                            .overlay {
                                Circle()
                                    .fill(.white.opacity(0.2))
                            }
                            .scaleEffect(2, anchor: .topLeading)
                            .offset(x: -50, y: -40)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: . continuous))
                
                VStack(alignment: .leading, spacing: 4, content: {
                    Spacer(minLength: 0)
                    
                    Text("Current Balance")
                    
                    Text(card.balance)
                        .font(.title.bold())
                })
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
            }
        }
        .padding(.horizontal, 15)
    }
    
    
    ///Expense Cart View
    @ViewBuilder
    func ExpenseCardView(_ expense: Expense) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 4, content: {
                Text(expense.product)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Text(expense.spendType)
                    .font(.caption)
                    .foregroundStyle(.gray)
            })
            
            Spacer(minLength: 0)
            
            Text(expense.amountSpent)
                .fontWeight(.bold)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 6)
    }
}

#Preview {
    Home()
}
