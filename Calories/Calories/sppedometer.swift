import SwiftUI

struct sContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    
    @State private var bmi: Double = 0.0
    
    private func calculateBMI() {
        if let weight = Double(weight), let height = Double(height) {
            let heightInMeters = height / 100
            let bmiValue = weight / (heightInMeters * heightInMeters)
            bmi = bmiValue
        }
    }
    
    private func getBMICategory() -> String {
        switch bmi {
        case ..<18.5:
            return "Underweight"
        case 18.5..<24.9:
            return "Normal"
        case 24.9..<29.9:
            return "Overweight"
        default:
            return "Obese"
        }
    }
    
    var body: some View {
        VStack {
            TextField("Enter Weight (kg)", text: $weight)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            TextField("Enter Height (cm)", text: $height)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            Button("Calculate BMI") {
                calculateBMI()
            }
            
            Text("Your BMI: \(String(format: "%.2f", bmi))")
                .padding()
            
            ProgressBar(value: bmi, color: .blue)
                .frame(height: 20)
                .padding()
            
            Text("Category: \(getBMICategory())")
                .padding()
        }
        .padding()
    }
}

struct ProgressBar: View {
    var value: Double
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundColor(Color.secondary)
                    .frame(height: geometry.size.height)
                
                Capsule()
                    .foregroundColor(color)
                    .frame(width: min(CGFloat(value) / 40 * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .rotationEffect(.degrees(180))
            }
            .cornerRadius(geometry.size.height / 2)
        }
    }
}



struct sContentView_Previews: PreviewProvider {
    static var previews: some View {
        sContentView()
    }
}
