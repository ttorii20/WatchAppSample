//
//  ContentViewModel.swift
//  WatchAppSample WatchKit Extension
//
//  Created by T T on 2019/11/11.
//  Copyright © 2019 tt. All rights reserved.
//

import Foundation

class ContentViewModel: ObservableObject {
    
     @Published var count: Int = 0
     @Published var list: [SampleModel] = []
     
     func inc(){
    
         SampleRepository.addNews(sample: SampleModel(title: Date().description))
     }
     
     func getNews(){
         self.list = SampleRepository.getNews()
     }
    
    
}
