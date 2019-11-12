//
//  ContentView.swift
//  WatchAppSample WatchKit Extension
//
//  Created by T T on 2019/11/11.
//  Copyright © 2019 tt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = ContentViewModel()
    var body: some View {
        ZStack {
            
            if vm.isLoading {
                Text("Loading.....")
            }
            VStack {
                
                Button(action: {
                    
                    self.vm.inc()
                }) {
                    Text("add")
                }
                
                Button(action: {
                    self.vm.getNews()
                }) {
                    Text("get")
                }
                
                Text(vm.result)
                
                List ( vm.list ){ item in
                    Text(item.title)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
