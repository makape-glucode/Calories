////
////  SearchFoods.swift
////  Calories
////
////  Created by Makape Tema on 2023/06/28.
////
//
//import SwiftUI
//
//struct SearchFoods: View {
//    @State private var searchText = ""
//    
//    var body: some View {
//        SearchFood(text: $searchText)
//            .padding(.horizontal)
//        
//        SCardView()
//            .padding()
//            .background(Color.teal)
//            .cornerRadius(10)
//            .padding()
//    }
//}
//
//struct SearchFood: View {
//    @Binding var text: String
//
//    var body: some View {
//        Text("API Searching...")
//        VStack {
//            HStack {
//                Image(systemName: "magnifyingglass")
//                    .foregroundColor(.teal)
//                
//                TextField("Search", text: $text)
//                    .foregroundColor(.primary)
//                
//                Button(action: {
//                    text = ""
//                }) {
//                    Image(systemName: "xmark.circle.fill")
//                        .foregroundColor(.gray)
//                }
//                .padding(.trailing, 8)
//                .opacity(text.isEmpty ? 0 : 1)
//            }
//            .padding(8)
//            .background(Color(.secondarySystemBackground))
//            .cornerRadius(10)
//        }
//    }
//}
//
//struct SCardView: View {
//    
//    @State private var isShowingBoitumeloView = false
//    var body: some View {
//        VStack(alignment: .trailing) {
//            Button(action: {
//                              isShowingBoitumeloView = true
//                
//                            }) {
//                              Label(
//                                title: { Text("") },
//                                icon: { Image(systemName: "plus.app.fill")
//                                    .resizable()
//                                    .frame(width: 30, height: 30)
//                                    .foregroundColor(Color(.white))
//                                }
//                              )
//                            }
//                            .sheet(isPresented: $isShowingBoitumeloView) {
//                                              SearchFoods()
//                                            }.padding(.leading, -50)
//            Text("Card Title")
//                .font(.title)
//                .foregroundColor(.white)
//                .frame(width: 340, height: 300, alignment: .center)
//            Text("Card Description")
//                .foregroundColor(.white)
//           
//                
//                
//                
//        }
//        Image(systemName: "plus.app.fill")
//    }
//}
//
//struct SearchFoods_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchFoods()
//    }
//}
