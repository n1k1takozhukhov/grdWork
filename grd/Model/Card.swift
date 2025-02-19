import SwiftUI

struct Card: Identifiable {
    var id: UUID = UUID()
    var bcColor: Color
    var balance: String
}


var cards: [Card] = [
    Card(bcColor: .red, balance: "$125,000"),
    Card(bcColor: .blue, balance: "$125,000"),
    Card(bcColor: .secondary, balance: "$125,000"),
    Card(bcColor: .orange, balance: "$125,000")
]
