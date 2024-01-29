import SwiftUI
import Combine

//struct FoodSearchResult: Codable {
//    let text: String
//    let parsed: [Food]
//}

struct FoodItem: Codable {
    let foodId: String
    let label: String
    // Include other properties as required
}
//
//struct Food: Codable {
//    let foodId: String
//    let label: String
//}
//
//struct foodContentView: View {
//    @State private var searchText = ""
//    @State private var foodResults: [Food] = []
//    
//    var body: some View {
//        VStack {
//            SearchBar(text: $searchText, onSearch: fetchFood)
//                .padding(.horizontal)
//            
//            List(foodResults, id: \.foodId) { food in
//                Text(food.label)
//            }
//        }
//    }
//    
//    func fetchFood() {
//        guard !searchText.isEmpty else {
//            foodResults = []
//            return
//        }
//        
//        guard let url = URL(string: "https://api.edamam.com/api/food-database/v2/parser") else {
//            return
//        }
//        
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
//        components?.queryItems = [
//            URLQueryItem(name: "q", value: searchText),
//            URLQueryItem(name: "app_id", value: "YOUR_APP_ID"), // Replace with your actual app ID
//            URLQueryItem(name: "app_key", value: "YOUR_APP_KEY") // Replace with your actual app key
//        ]
//        
//        guard let apiUrl = components?.url else {
//            return
//        }
//        
//        URLSession.shared.dataTask(with: apiUrl) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//            
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(FoodSearchResult.self, from: data) {
//                    DispatchQueue.main.async {
//                        foodResults = decodedResponse.parsed
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct letSearchBar: View {
//    @Binding var text: String
//    let onSearch: () -> Void
//    
//    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//                .foregroundColor(.teal)
//
//            TextField("Search", text: $text, onCommit: onSearch)
//                .foregroundColor(.primary)
//
//            Button(action: {
//                text = ""
//            }) {
//                Image(systemName: "xmark.circle.fill")
//                    .foregroundColor(.gray)
//            }
//            .padding(.trailing, 8)
//            .opacity(text.isEmpty ? 0 : 1)
//        }
//        .padding(8)
//        .background(Color(.secondarySystemBackground))
//        .cornerRadius(10)
//    }
//}
//
//struct foodContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        foodContentView()
//    }
//}
