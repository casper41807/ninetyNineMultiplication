//
//  ninetyNineViewController.swift
//  ninetyNineMultiplication
//
//  Created by 陳秉軒 on 2022/4/14.
//

import UIKit

class ninetyNineViewController: UIViewController {

    @IBOutlet weak var questionLabel1: UILabel!
    
    @IBOutlet weak var questionLabel2: UILabel!
    
    @IBOutlet var answerOutlets: [UIButton]!
    
    @IBOutlet weak var addScoreLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var questionNumLable: UILabel!
    
    var score = 0
    var rightAnswer = 0
    var index = 1
    var countArray = Array(repeating: "⚪️", count: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomQuestion()
        addScoreLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> showTotalScoreViewController? {
        let controller = showTotalScoreViewController(coder: coder)
        controller?.score = score
        return controller
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        index += 1
        if index > 10{
            //present(showTotalScoreViewController, animated: ture)
            if sender.currentTitle == "\(rightAnswer)"{
                score += 10
            }
            performSegue(withIdentifier: "showResult", sender: nil)
            index = 1
            questionNumLable.text = "⚪️⚪️⚪️⚪️⚪️⚪️⚪️⚪️⚪️⚪️"
            countArray = Array(repeating: "⚪️", count: 10)
            titleLabel.text = "第\(index)題"
            addScoreLabel.text = ""
            score = 0
        }else{
            if sender.currentTitle == "\(rightAnswer)"{
                score += 10
                addScoreLabel.text = "👍 你答對了 ＋10分"
                titleLabel.text = "第\(index)題"
                countArray[index-2] = "🟢"
            }else{
                addScoreLabel.text = "👎  你答錯了 ＋0分"
                titleLabel.text = "第\(index)題"
                countArray[index-2] = "🔴"
            }
            if questionNumLable.text != ""{
                questionNumLable.text = ""
                
                for i in 0...9{
                    questionNumLable.text?.append(countArray[i])
                }
            }
        }
        randomQuestion()
        print(score)
    }
    
    func randomQuestion(){
        let randomNum1 = Int.random(in: 2...9)
        let randomNum2 = Int.random(in: 2...9)
        questionLabel1.text = "\(randomNum1)"
        questionLabel2.text = "\(randomNum2)"
        
        var answerNum1 = Int.random(in: 4...81)
        var answerNum2 = Int.random(in: 4...81)
        //設定不會有同樣答案選項
        repeat {
            answerNum1 = Int.random(in: 4...81)
            answerNum2 = Int.random(in: 4...81)
        } while rightAnswer == answerNum1 || rightAnswer == answerNum2
        rightAnswer = randomNum1*randomNum2
       
        var answerArray = [answerNum1,answerNum2,rightAnswer]
        //陣列隨機洗牌
        answerArray.shuffle()
        print(answerArray)
        for num in 0...answerArray.count-1{
            answerOutlets[num].setTitle("\(answerArray[num])", for: .normal)
        }
    }
        //var answerArray = [Int]()
        
//         if rightAnswer == answerNum1 || rightAnswer == answerNum2{
//            repeat {
//                answerNum1 = Int.random(in: 1...81)
//                answerNum2 = Int.random(in: 1...81)
//            } while rightAnswer == answerNum1 && rightAnswer == answerNum2
//
//        }else{
            
            
        //}
        
   
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showResult"{
//
//        }
//    }

}
