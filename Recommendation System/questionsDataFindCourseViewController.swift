//
//  questionsDataFindCourseViewController.swift
//  Recommendation System
//
//  Created by alcoderithm on 17/2/19.
//  Copyright © 2019 alcoderithm. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: CoursesType
}

enum CoursesType {
    case accountancy, architecture, businessManagement, engineering
    
    var recommendation: String {
        switch self {
        case .accountancy:
            return "The recommended course for you is Accountancy"
        case .architecture:
            return "The recommended course for you is Architecture"
        case .businessManagement:
            return "The recommended course for you is Business Management"
        case .engineering:
            return "The recommended course for you is Engineering"
        }
    }
}
