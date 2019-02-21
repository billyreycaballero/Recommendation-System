//
//  questionsFindSchoolViewController.swift
//  Recommendation System
//
//  Created by alcoderithm on 17/2/19.
//  Copyright © 2019 alcoderithm. All rights reserved.
//

import UIKit

class questionsFindSchoolViewController: UIViewController {

    @IBOutlet weak var questionTitleSchool: UINavigationItem!
    @IBOutlet weak var questionsSchoolLabel: UILabel!
    
    @IBOutlet weak var answerChoicesButton1: UIButton!
    @IBOutlet weak var answerChoicesButton2: UIButton!
    @IBOutlet weak var answerChoicesButton3: UIButton!
    @IBOutlet weak var answerChoicesButton4: UIButton!
    
    var questionsSchool: [QuestionSchool] = [
        QuestionSchool(textSchool: "What course do you want to study?",
                answerSchool: [
                    AnswerSchool(textSchool: "Accountancy", typeSchool: .cornellUniversity),
                    AnswerSchool(textSchool: "Architecture", typeSchool: .princetonUniversity),
                    AnswerSchool(textSchool: "Business management", typeSchool: .harvardUniversity),
                    AnswerSchool(textSchool: "Engineering", typeSchool: .stanfordUniversity)
            ]),
        
        QuestionSchool(textSchool: "Which location do you prefer?",
                 answerSchool: [
                    AnswerSchool(textSchool: "Outside the city", typeSchool: .cornellUniversity),
                    AnswerSchool(textSchool: "Big city", typeSchool: .harvardUniversity),
                    AnswerSchool(textSchool: "Small city", typeSchool: .princetonUniversity),
                    AnswerSchool(textSchool: "Green city", typeSchool: .stanfordUniversity)
            ]),
        
        QuestionSchool(textSchool: "What academic facility do you often to visit?",
                 answerSchool: [
                    AnswerSchool(textSchool: "Technology hub", typeSchool: .cornellUniversity),
                    AnswerSchool(textSchool: "Library", typeSchool: .harvardUniversity),
                    AnswerSchool(textSchool: "Science lab", typeSchool: .princetonUniversity),
                    AnswerSchool(textSchool: "Computer lab", typeSchool: .stanfordUniversity)
            ]),
        
        QuestionSchool(textSchool: "What student facility do you like the most?",
                 answerSchool: [
                    AnswerSchool(textSchool: "Gymnasium", typeSchool: .cornellUniversity),
                    AnswerSchool(textSchool: "Cafeteria", typeSchool: .harvardUniversity),
                    AnswerSchool(textSchool: "Parks", typeSchool: .princetonUniversity),
                    AnswerSchool(textSchool: "Recreational Area", typeSchool: .stanfordUniversity)
            ])
    ]
    
    var shuffleQuestionsResultSchool = [QuestionSchool]()
    var shuffleAnswersResultSchool = [AnswerSchool]()
    
    var questionIndex = 0
    var chosenAnswerSchool: [AnswerSchool] = []
    var currentAnswerSchool = [AnswerSchool]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        shuffleQuestionsResultSchool = shuffleQuestionsSchool(stringArray: questionsSchool)
        shuffleAnswersResultSchool = shuffleAnswersSchool(stringArray: shuffleQuestionsResultSchool[questionIndex].answerSchool)
        
        updateUISchool()
        
    }
    
    @IBAction func pressedAnswersChoicesButton(_ sender: UIButton) {
        
        let currentAnswerSchool = shuffleAnswersResultSchool
        
        switch sender {
        case answerChoicesButton1:
            chosenAnswerSchool.append(currentAnswerSchool[0])
        case answerChoicesButton2:
            chosenAnswerSchool.append(currentAnswerSchool[1])
        case answerChoicesButton3:
            chosenAnswerSchool.append(currentAnswerSchool[2])
        case answerChoicesButton4:
            chosenAnswerSchool.append(currentAnswerSchool[3])
        default:
            break
        }
        nextQuestionSchool()
        
    }
    
    
    func updateUISchool() {
        
        shuffleAnswersResultSchool = shuffleAnswersSchool(stringArray: shuffleQuestionsResultSchool[questionIndex].answerSchool)
        
        let currentQuestionSchool = shuffleQuestionsResultSchool[questionIndex]
        let currentAnswersSchool = shuffleAnswersResultSchool
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionsSchoolLabel.text = currentQuestionSchool.textSchool
        
        updateSingleStackSchool(using: currentAnswersSchool)
        
    }
    
    func updateSingleStackSchool(using answerSchool: [AnswerSchool]) {
        answerChoicesButton1.setTitle(answerSchool[0].textSchool, for: .normal)
        answerChoicesButton2.setTitle(answerSchool[1].textSchool, for: .normal)
        answerChoicesButton3.setTitle(answerSchool[2].textSchool, for: .normal)
        answerChoicesButton4.setTitle(answerSchool[3].textSchool, for: .normal)
    }
    
    func nextQuestionSchool() {
        questionIndex += 1
        
        if questionIndex < questionsSchool.count {
            updateUISchool()
        } else {
            performSegue(withIdentifier: "recommendedSegue", sender: nil)
        }
        
    }
    
    func shuffleQuestionsSchool(stringArray:[QuestionSchool]) -> [QuestionSchool] {
        //create a copy of the input array
        var items = stringArray
        
        //our new shuffled array
        var shuffled = [QuestionSchool]();
        
        //iterate through the item array
        for _ in items.enumerated()
        {
            //choose a random number
            let rand = Int(arc4random_uniform(UInt32(items.count)))
            //using that random number, select a random item
            let randomItem = items[rand]
            //append that random item to our new shuffled array
            shuffled.append(randomItem)
            //make sure to remove that item, so we don't pick it again
            items.remove(at: rand)
        }
        return shuffled
    }
    
    func shuffleAnswersSchool(stringArray:[AnswerSchool]) -> [AnswerSchool] {
        //create a copy of the input array
        var items = stringArray
        
        //our new shuffled array
        var shuffled = [AnswerSchool]();
        
        //iterate through the item array
        for _ in items.enumerated()
        {
            //choose a random number
            let rand = Int(arc4random_uniform(UInt32(items.count)))
            //using that random number, select a random item
            let randomItem = items[rand]
            //append that random item to our new shuffled array
            shuffled.append(randomItem)
            //make sure to remove that item, so we don't pick it again
            items.remove(at: rand)
        }
        return shuffled
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recommendedSegue" {
            let recommendationSchoolViewController = segue.destination as! recommendationFindSchoolViewController
            recommendationSchoolViewController.responsesSchool = chosenAnswerSchool
        }
    }
}
