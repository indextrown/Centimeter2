//
//  ContentView.swift
//  Centimeter
//
//  Created by 김동현 on 9/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var showingWritePage = false
    
    var body: some View {
        NavigationStack {
            VStack {
                CMSearchView(searchText: $searchText)
                
                Spacer()
                
                NavigationLink(destination: CMWritePage()) {
                    Text("글 작성")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            //.navigationBarTitle("메모", displayMode: .inline)
        }
    }
}

#Preview {
    ContentView()
}

// MARK: - 검색창
struct CMSearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        Text("")
            .searchable(text: $searchText, prompt: "검색")
            .padding()
            .navigationTitle("메모")
    }
}
