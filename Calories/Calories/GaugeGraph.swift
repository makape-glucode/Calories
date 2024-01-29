////
////  GaugeGraph.swift
////  Calories
////
////  Created by Makape Tema on 2023/06/29.
////
//
//import SwiftUI
//
//struct GaugeGraph: View {
//    @State private var weight: String = ""
//    @State private var height: String = ""
//    private var bmiValue: Double {
//        guard let weight = Double(weight), let height = Double(height), height != 0 else {
//            return 0.0
//        }
//        let heightInMeters = height / 100.0
//        return weight / (heightInMeters * heightInMeters)
//    }
//    private var bmiRange: ClosedRange<Double> {
//        return 10.0...40.0 // Customize the range based on your requirements
//    }
//    private var bmiColor: Color {
//        let bmiPercentage = (bmiValue - bmiRange.lowerBound)/ (bmiRange.upperBoun, bmiRange.lowerBound)
//        return Color(hue: 0.27 * (1.0 - bmiPercentage), saturation: 0.9, brightness: 0.9)
//    }
//    var body: some View {
//        VStack {
//            Text("BMI Calculator")
//                .font(.title)
//                .padding()
//            HStack {
//                Text("Weight (kg):")
//                TextField("Enter weight", text: $weight)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .keyboardType(.decimalPad)
//            }
//            .padding()
//            HStack {
//                Text("Height (cm):")
//                TextField("Enter height", text: $height)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .keyboardType(.decimalPad)
//            }
//            .padding()
//            ZStack {
//                Circle()
//                    .stroke(Color.gray.opacity(0.3), lineWidth: 20)
//                Arc(startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
//                    .stroke(bmiColor, lineWidth: 20)
//                    .rotationEffect(.degrees(-90))
//                VStack {
//                    Text("BMI")
//                        .font(.title)
//                        .foregroundColor(.gray)
//                    Text("\(String(format: "%.1f", bmiValue))")
//                        .font(.system(size: 50))
//                        .bold()
//                        .padding()
//                }
//            }
//            .padding()
//            Spacer()
//        }
//    }
//}
//struct Arc: InsettableShape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool
//    var insetAmount: CGFloat = 0
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
//                    radius: rect.width / 2 - insetAmount,
//                    startAngle: modifiedStart,
//                    endAngle: modifiedEnd,
//                    clockwise: !clockwise)
//        return path
//    }
//    func inset(by amount: CGFloat) -> some InsettableShape {
//        var arc = self
//        arc.insetAmount += amount
//        return arc
//    }
//}
//
//struct GaugeGraph_Previews: PreviewProvider {
//    static var previews: some View {
//        GaugeGraph()
//    }
//}
