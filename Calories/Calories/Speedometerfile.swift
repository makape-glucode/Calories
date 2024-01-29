//import SwiftUI
//
//struct SpeedometerView: View {
//    let value: CGFloat
//    let minValue: CGFloat
//    let maxValue: CGFloat
//    let categories: [SpeedometerCategory]
//
//    private var normalizedValue: CGFloat {
//        max(min(value, maxValue), minValue)
//    }
//
//    private var angle: Angle {
//        let range = maxValue - minValue
//        let normalizedRange = normalizedValue - minValue
//        let degreesPerUnit = 180 / range
//        return Angle(degrees: Double(normalizedRange * degreesPerUnit))
//    }
//
//    private var categoryColor: Color {
//        for category in categories {
//            if normalizedValue < category.value {
//                return category.color
//            }
//        }
//        return categories.last?.color ?? .gray
//    }
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .stroke(lineWidth: 20)
//                .foregroundColor(.gray)
//
//            Circle()
//                .trim(from: 0, to: CGFloat(angle.degrees / 180))
//                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
//                .foregroundColor(categoryColor)
//                .rotationEffect(Angle(degrees: -90))
//
//            ForEach(categories) { category in
//                categoryLabel(category)
//            }
//        }
//    }
//
//    private func categoryLabel(_ category: SpeedometerCategory) -> some View {
//        let categoryAngle = (category.value - minValue) / (maxValue - minValue) * 180
//        let rotation = Angle(degrees: Double(-90 + categoryAngle))
//
//        return Text("\(Int(category.value))")
//            .font(.caption)
//            .foregroundColor(.gray)
//            .rotationEffect(rotation)
//            .offset(x: 0, y: -120)
//    }
//}
//
//struct SpeedometerCategory {
//    let value: CGFloat
//    let color: Color
//}
