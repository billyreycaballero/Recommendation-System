//
//  recommendationViewController.swift
//  Recommendation System
//
//  Created by alcoderithm on 17/2/19.
//  Copyright © 2019 alcoderithm. All rights reserved.
//

import UIKit

class recommendationFindCourseViewController: UIViewController {

    @IBOutlet weak var recommendationLabel: UILabel!
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        recommendationCalculation()
    }
    
    func recommendationCalculation() {
        var frequencyOfAnswers: [CoursesType:Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        recommendationLabel.text = mostCommonAnswer.recommendation
    }

}
