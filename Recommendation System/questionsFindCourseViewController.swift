//
//  questionsFindCourseViewController.swift
//  Recommendation System
//
//  Created by alcoderithm on 17/2/19.
//  Copyright © 2019 alcoderithm. All rights reserved.
//

import UIKit

class questionsFindCourseViewController: UIViewController {
    
    @IBOutlet weak var questionsTitle: UINavigationItem!
    
    @IBOutlet weak var questionsLabel: UILabel!
    
    @IBOutlet weak var answerOptionButton1: UIButton!
    @IBOutlet weak var answerOptionButton2: UIButton!
    @IBOutlet weak var answerOptionButton3: UIButton!
    @IBOutlet weak var answerOptionButton4: UIButton!
    
    
    var questions: [Question] = [
        Question(text: "What is your skill?",
                 answers: [
                    Answer(text: "Analytical", type: .accountancy),
                    Answer(text: "Creative", type: .architecture),
                    Answer(text: "Leadership", type: .businessManagement),
                    Answer(text: "Problem Solving", type: .engineering)
            ]),
        
        Question(text: "What is your interest?",
                 answers: [
                    Answer(text: "Infrastructure", type: .architecture),
                    Answer(text: "Economy", type: .businessManagement),
                    Answer(text: "Technology", type: .engineering),
                    Answer(text: "Finance", type: .accountancy)
            ]),
        
        Question(text: "What is your favorite subject in school?",
                 answers: [
                    Answer(text: "Entrepreneurship", type: .businessManagement),
                    Answer(text: "Science", type: .engineering),
                    Answer(text: "Mathematics", type: .accountancy),
                    Answer(text: "Arts", type: .architecture)
            ]),
        
        Question(text: "What is your hobby?",
                 answers: [
                    Answer(text: "Video games", type: .engineering),
                    Answer(text: "Solving Puzzle", type: .accountancy),
                    Answer(text: "Drawing", type: .architecture),
                    Answer(text: "Reading Books", type: .businessManagement)
            ])
    ]
    
    var shuffleQuestionsResult = [Question]()
    var shuffleAnswersResult = [Answer]()
    
    var questionNumber = 0
    var chosenAnswer: [Answer] = []
    var currentAnswers = [Answer]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        shuffleQuestionsResult = shuffleQuestions(stringArray: questions)
        shuffleAnswersResult = shuffleAnswers(stringArray: shuffleQuestionsResult[questionNumber].answers)
        
        updateUI()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func pressedAnswersOptionButton(_ sender: UIButton) {
        
        let currentAnswers = shuffleAnswersResult
        
        switch sender {
        case answerOptionButton1:
            chosenAnswer.append(currentAnswers[0])
        case answerOptionButton2:
            chosenAnswer.append(currentAnswers[1])
        case answerOptionButton3:
            chosenAnswer.append(currentAnswers[2])
        case answerOptionButton4:
            chosenAnswer.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
  
    }

    
    func updateUI() {
        
        shuffleAnswersResult = shuffleAnswers(stringArray: shuffleQuestionsResult[questionNumber].answers)
        
        let currentQuestion = shuffleQuestionsResult[questionNumber]
        let currentAnswers = shuffleAnswersResult
        
        navigationItem.title = "Question #\(questionNumber+1)"
        questionsLabel.text = currentQuestion.text
        
        updateSingleStack(using: currentAnswers)
        
    }
    
    func updateSingleStack(using answers: [Answer]) {
        answerOptionButton1.setTitle(answers[0].text, for: .normal)
        answerOptionButton2.setTitle(answers[1].text, for: .normal)
        answerOptionButton3.setTitle(answers[2].text, for: .normal)
        answerOptionButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func nextQuestion() {
        questionNumber += 1
        
        if questionNumber < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "recommendationSegue", sender: nil)
        }
        
    }
    
    func shuffleQuestions(stringArray:[Question]) -> [Question] {
        //create a copy of the input array
        var items = stringArray
        
        //our new shuffled array
        var shuffled = [Question]();
        
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
    
    func shuffleAnswers(stringArray:[Answer]) -> [Answer] {
    //create a copy of the input array
        var items = stringArray
    
        //our new shuffled array
        var shuffled = [Answer]();
    
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
        if segue.identifier == "recommendationSegue" {
            let recommendationViewController = segue.destination as! recommendationFindCourseViewController
            recommendationViewController.responses = chosenAnswer
        }
    }

}
