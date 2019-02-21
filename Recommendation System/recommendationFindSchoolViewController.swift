//
//  recommendationFindSchoolViewController.swift
//  Recommendation System
//
//  Created by alcoderithm on 17/2/19.
//  Copyright © 2019 alcoderithm. All rights reserved.
//

import UIKit

class recommendationFindSchoolViewController: UIViewController {

    @IBOutlet weak var recommendSchoolLabel: UILabel!
    var responsesSchool: [AnswerSchool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        recommendationCalculationSchool()
    }
    
    func recommendationCalculationSchool() {
        var frequencyOfAnswersSchool: [SchoolType:Int] = [:]
        let responseTypesSchool = responsesSchool.map { $0.typeSchool }
        
        for responsesSchool in responseTypesSchool {
            frequencyOfAnswersSchool[responsesSchool] = (frequencyOfAnswersSchool[responsesSchool] ?? 0) + 1
        }
        
        let mostCommonAnswerSchool = frequencyOfAnswersSchool.sorted { $0.1 > $1.1 }.first!.key
        
        recommendSchoolLabel.text = mostCommonAnswerSchool.recommendationSchool
    }


}
