import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var onSearch: () -> Void

    class Coordinator: NSObject, UISearchBarDelegate {
        let searchBar: SearchBar

        init(_ searchBar: SearchBar) {
            self.searchBar = searchBar
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBar.searchTextField.backgroundColor = .white
            searchBar.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.searchTextField.resignFirstResponder()
            searchBar.searchTextField.backgroundColor = .clear
//            searchBar.onSearch()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search food"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
