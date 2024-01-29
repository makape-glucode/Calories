
// ApiCallView
//
// Created by Thabiso Gaereetse on 2023/07/05.
//
import SwiftUI
struct FoodDetailsView: View {
 let food: Food
 var body: some View {
   ScrollView(.vertical, showsIndicators: false){
     VStack(alignment: .leading) {
       Image(food.image ?? "")
       if let imageUrl = food.image, let url = URL(string: imageUrl), let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
         Image(uiImage: image)
           .resizable()
           .aspectRatio(contentMode: .fit)
           .padding()
       }
       Text("Details:")
         .font(.headline)
       Text("Label: \(food.label ?? "")")
       Text("Known As: \(food.knownAs ?? "")")
       Text("Category: \(food.category?.rawValue ?? "")")
       VStack {
         Text(food.label ?? "")
           .font(.headline)
           .padding()
         if let nutrients = food.nutrients {
           HStack {
             Text("Fats: \(nutrients.fat ?? 0)g")
             Spacer()
             Text("Proteins: \(nutrients.procnt ?? 0)g")
             Spacer()
             Text("Carbs: \(nutrients.chocdf ?? 0)g")
             Spacer()
             Text("Fibre: \(nutrients.fibtg ?? 0)g")
             Spacer()
             Text("Calories: \(nutrients.enercKcal ?? 0)g")
               Spacer()
//               Text("Serving: \(serving. ?? 0)g")
           }
           .padding()
         }
       }
     }.background(Color(.cyan))
     .padding(.horizontal)
     .padding(.top, 10)
   }
 }
}
struct FoodDetailsView_Previews: PreviewProvider {
 static var previews: some View {
   ContentView()
 }
}






