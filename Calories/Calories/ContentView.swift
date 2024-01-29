import SwiftUI
//

struct ContentView: View {
  @State private var searchText = ""
  @State private var foodFetcher: FoodFetcher?
  @State private var isLoading = false
  @State private var selectedFood: Food?
  @State private var isShowingFoodDetails = false
  var body: some View {
      NavigationView {
        VStack {
          SearchBarView(text: $searchText, onSearch: getParsedFood)
          if isLoading {
            ProgressView()
          } else if let foodFetcher = foodFetcher {
            if let hints = foodFetcher.hints {
              if hints.isEmpty {
                Text("No results found")
              } else {
                List(hints, id: \.food?.foodID) { hint in
                  VStack(alignment: .leading) {
                    if let food = hint.food {
                      NavigationLink(destination: FoodDetailsView(food: food)) {
                        HStack {
                          AsyncImage(url: URL(string: food.image ?? "")) { image in
                            image
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 40, height: 40)
                          } placeholder: {
                            Image(systemName: "photo")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 40, height: 40)
                              .foregroundColor(.gray)
                          }
                          Text(food.label ?? "")
                            .font(.headline)
                        }
                      }
                    }
                    if let measures = hint.measures {
                      ForEach(measures, id: \.uri) { measure in
                        Text(measure.label ?? "")
                          .foregroundColor(.secondary)
                      }
                    }
                  }
                }
              }
            } else {
              Text("No data available")
            }
          }
        }
        .navigationBarTitle("Food Search")
      }
    }
  func getParsedFood() {
    isLoading = true
    let searchString = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !searchString.isEmpty else {
      isLoading = false
      return
    }
    let appID = "15cf76ba" // Replace with your actual application ID
    let appKey = "1e0d08c319ea0c5cae830e16dcce126b" // Replace with your actual application key
    let encodedSearchString = searchString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    let urlString = "https://api.edamam.com/api/food-database/v2/parser?app_id=\(appID)&app_key=\(appKey)&ingr=\(encodedSearchString)"
    guard let url = URL(string: urlString) else {
      print("Invalid URL")
      isLoading = false
      return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
      defer {
        isLoading = false
      }
      if let error = error {
        print("Error: \(error.localizedDescription)")
        return
      }
      if let data = data {
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let result = try decoder.decode(FoodFetcher.self, from: data)
          DispatchQueue.main.async {
            foodFetcher = result
          }
        } catch {
          print("Error decoding JSON: \(error.localizedDescription)")
        }
      }
    }
    .resume()
  }
}
struct SearchFoodsView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}
struct SearchBarView: View {
  @Binding var text: String
  var onSearch: () -> Void
  var body: some View {
    HStack {
      TextField("Search", text: $text)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal)
      Button(action: onSearch) {
        Image(systemName: "magnifyingglass")
      }
      .padding(.trailing)
    }
    .padding(.top)
  }
}








//struct ContentView: View {
//    @State private var searchText = ""
//    @State private var foodFetcher: FoodFetcher?
//
//    private let baseURL = "https://api.edamam.com/api/food-database/v2/parser"
//    private let appID = "15cf76ba"
//    private let appKey = "1e0d08c319ea0c5cae830e16dcce126b"
//
//    var body: some View {
//        VStack {
//            TextField("Search for food", text: $searchText, onCommit: searchFood)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            if let food = foodFetcher?.hints?.first?.food {
//                VStack {
//                    Text(food.label ?? "No food found")
//                        .font(.title)
//                        .padding()
//
//                    Text("Calories: \(food.nutrients?.enercKcal ?? 0)")
//                        .padding()
//
//                    if let servingSizes = food.servingSizes {
//                        Text("Serving Sizes:")
//                            .font(.headline)
//                            .padding()
//
//                        ForEach(servingSizes, id: \.label) { servingSize in
//                            Text("\(servingSize.label?.rawValue ?? ""): \(servingSize.quantity ?? 0) \(servingSize.uri ?? "")")
//                        }
//                        .padding(.bottom)
//                    }
//                }
//            }
//
//            Spacer()
//        }
//    }
//
//    private func searchFood() {
//        guard !searchText.isEmpty, let url = URL(string: "\(baseURL)?app_id=\(appID)&app_key=\(appKey)&ingr=\(searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else { return }
//
//            do {
//                let foodFetcher = try JSONDecoder().decode(FoodFetcher.self, from: data)
//                DispatchQueue.main.async {
//                    self.foodFetcher = foodFetcher
//                }
//            } catch {
//                print("Error decoding foodFetcher: \(error)")
//            }
//        }.resume()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
