import SwiftUI
struct secvContentView: View {
  @State private var foodFetcher: FoodFetcher?
  @State private var isLoading = false
  var body: some View {
    VStack {
      if isLoading {
        ProgressView()
      } else if let foodFetcher = foodFetcher {
        Text("Food: \(foodFetcher.text ?? "")")
        // Add more views to display the fetched data as needed
      } else {
        Text("No data available")
      }
    }
    .onAppear {
      fetchData()
    }
  }
  func fetchData() {
    isLoading = true
    guard let url = URL(string: "https://api.edamam.com/api/food-database/v2/parser?app_id=15cf76ba&app_key=1e0d08c319ea0c5cae830e16dcce126b&ingr=") else {
      print("Invalid URL")
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
    }.resume()
  }
}
struct secvContentView_Previews: PreviewProvider {
  static var previews: some View {
    secvContentView()
  }
}
