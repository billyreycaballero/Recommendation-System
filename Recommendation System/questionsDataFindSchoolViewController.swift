//
//  questionsDataFindSchoolViewController.swift
//  Recommendation System
//
//  Created by alcoderithm on 17/2/19.
//  Copyright © 2019 alcoderithm. All rights reserved.
//

import Foundation

struct QuestionSchool {
    var textSchool: String
    var answerSchool: [AnswerSchool]
}

struct AnswerSchool {
    var textSchool: String
    var typeSchool: SchoolType
}

enum SchoolType {
    case cornellUniversity, harvardUniversity, princetonUniversity, stanfordUniversity
    
    var recommendationSchool: String {
        switch self {
        case .cornellUniversity:
            return "The recommended school for you is Cornell University"
        case .harvardUniversity:
            return "The recommended school for you is Harvard University"
        case .princetonUniversity:
            return "The recommended school for you is Princeton University"
        case .stanfordUniversity:
            return "The recommended school for you is Stanford University"
        }
    }
}
