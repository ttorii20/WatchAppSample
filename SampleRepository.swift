//
//  SampleRepository.swift
//  WatchAppSample WatchKit Extension
//
//  Created by T T on 2019/11/11.
//  Copyright © 2019 tt. All rights reserved.
//

import Foundation

class SampleRepository {
    static func getNews() -> [SampleModel] {
        // APIもしくは DBから取得
        return db
    }
    
    static func addNews( sample: SampleModel ){
        db.append(sample)
    }
}

var db: [SampleModel] = []
