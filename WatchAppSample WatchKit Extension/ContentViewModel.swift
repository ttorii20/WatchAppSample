//
//  ContentViewModel.swift
//  WatchAppSample WatchKit Extension
//
//  Created by T T on 2019/11/11.
//  Copyright © 2019 tt. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ContentViewModel: ObservableObject {
    
    @Published var count: Int = 0
    @Published var result: String = "default"
    @Published var list: [SampleModel] = []
    @Published var isLoading: Bool = false
    
    let disposeBag = DisposeBag()
    
    var repo = SampleRepository()
    
    init() {
        setBind()
    }
    
    func setBind() {
    }
    
    func inc(){
        repo.addNews(sample: SampleModel(title: Date().description))
    }
    
    func getNews() {
        
        self.isLoading = true
        
        repo.getNews().bind { (rate) in
            self.result = rate
            self.isLoading = false
        }.disposed(by: disposeBag)
        
//        self.list = SampleRepository.getNews()
    }
}
