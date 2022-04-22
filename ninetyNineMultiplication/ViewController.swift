//
//  ViewController.swift
//  ninetyNineMultiplication
//
//  Created by 陳秉軒 on 2022/4/13.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBOutlet weak var showLabel: UILabel!
    
    @IBOutlet weak var SegmentedOutlet: UISegmentedControl!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var ninetyNineButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    
    @IBAction func sliderButton(_ sender: UISlider) {
        if SegmentedOutlet.selectedSegmentIndex == 0{
            sliderOutlet.minimumValue = 1
            sliderOutlet.maximumValue = 15
            
            rightTriangle()
        }else if SegmentedOutlet.selectedSegmentIndex == 1{
            sliderOutlet.minimumValue = 1
            sliderOutlet.maximumValue = 15
            square()
        }else if SegmentedOutlet.selectedSegmentIndex == 2{
            sliderOutlet.minimumValue = 1
            sliderOutlet.maximumValue = 15
            pyramind()
        }else if SegmentedOutlet.selectedSegmentIndex == 3{
            sliderOutlet.minimumValue = 1
            sliderOutlet.maximumValue = 15
            diamond()
            
        }else{
            sliderOutlet.minimumValue = 0
            sliderOutlet.maximumValue = 9
            ninetyNine()
        }
        
        
    }
    @IBAction func segmentedButton(_ sender: UISegmentedControl) {
        clearAll()
        if sender.selectedSegmentIndex == 4{
            ninetyNineButton.isHidden = false
        }else{
            ninetyNineButton.isHidden = true
        }
    }
    
    
    func rightTriangle(){
        showLabel.textAlignment = .natural
        var text = ""
        let num = Int(sliderOutlet.value)
        for i in 1...num{
            for _ in 1...i{
                text += "🐽"
            }
            text += "\n"
        }
        showLabel.text = text
        numberLabel.text = "\(num)"
    }
    
    func square(){
        var text = ""
        let num = Int(sliderOutlet.value)
        for _ in 1...num{
            for _ in 1...num{
                text += "🐽"
            }
            text += "\n"
        }
        showLabel.text = text
        numberLabel.text = "\(num)"
    }
    
    func pyramind(){
        showLabel.textAlignment = .center
        var text = ""
        let num = Int(sliderOutlet.value)
        for i in 1...num{
            for _ in 1...i{
                text += "🐽"
            }
            text += "\n"
        }
        showLabel.text = text
        numberLabel.text = "\(num)"
    }

    func diamond(){
        showLabel.textAlignment = .center
        var text = ""
        let num = Int(sliderOutlet.value)
        var pigCount = 1
        for i in 1...(num*2-1){
            for _ in 1...pigCount{
                text += "🐽"
            }
            if i < num {
                pigCount += 2
            }else{
                pigCount -= 2
            }
            text += "\n"
        }
        showLabel.text = text
        numberLabel.text = "\(num)"
    }
    
    func ninetyNine(){
        var text = ""
        let num = Int(sliderOutlet.value)
        for i in 0...9{
            for x in 0...num{
                if i == 0 {
                    text += "\(x)\t"
                }else if x == 0{
                    text += "\(i)\t"
                }else{
                    text += "\(x*i)\t"
                }
            }
            text += "\n"
        }
        showLabel.text = text
        numberLabel.text = "\(num)"
    }
    func clearAll(){
        showLabel.text = ""
        numberLabel.text = ""
        sliderOutlet.value = 0
    }
}

