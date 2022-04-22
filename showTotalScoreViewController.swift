//
//  showTotalScoreViewController.swift
//  ninetyNineMultiplication
//
//  Created by 陳秉軒 on 2022/4/15.
//

import UIKit

class showTotalScoreViewController: UIViewController {
    
    @IBOutlet weak var resultLable: UILabel!
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var epilogueLabel: UILabel!
    
    var score:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLable.text = "\(score ?? 0)"
        if let score = score{
            if score < 60 {
                resultImage.image = UIImage(named: "456")
                epilogueLabel.textColor = .red
                epilogueLabel.text = "不吉格"
            }else if score < 90 {
                resultImage.image = UIImage(named: "901")
                epilogueLabel.textColor = .orange
                epilogueLabel.text = "吉佳"
            }else{
                resultImage.image = UIImage(named: "123")
                epilogueLabel.textColor = .green
                epilogueLabel.text = "超吉棒"
            }
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func playAgain(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
