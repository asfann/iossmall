//
//  ContentView.swift
//  H4XOR News
//
//  Created by Mac on 19/05/2022.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var networkmaanager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkmaanager.posts) {
                post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
        .navigationBarTitle("H4XOR News")
        }.navigationViewStyle(StackNavigationViewStyle())
        .onAppear{
            self.networkmaanager.fetchData()
        }
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



