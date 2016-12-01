//
//  ViewController.swift
//  TweetFactory
//
//  Created by Axel Le Bot on 01/12/2016.
//  Copyright © 2016 Axel Le Bot. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    var actions : [String] = ["fait des gauffre", "pars en Chine", "suis en cours", "galère", "cours", "me raccorche à la vie"]
    var feels : [String] = ["😉", "🙂", "😞", "😮", "😀", "😂", "😆"]
    
    @IBOutlet weak var customTweetInput: UITextField!
    @IBOutlet weak var prefabTweetPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - Picker View Delegate
    
    
    
    
    
    @IBAction func hideKeyboard(_ sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func sendTweet(_ sender: AnyObject) {
        
        var toSend : String = ""
        
        if(customTweetInput.hasText){
            toSend = customTweetInput.text!
        }else{
            toSend = "Je \(actions[prefabTweetPicker.selectedRow(inComponent: 0)]) \(feels[prefabTweetPicker.selectedRow(inComponent: 1)])"
        }
        
        print(toSend)
        
        let composer = TWTRComposer()
        composer.setText(toSend)
        composer.show(from: self, completion: { result in
            if(result == TWTRComposerResult.cancelled){
                print("Tweet composition cancelled")
            }else{
                print("Tweet sent")
            }
        })
        
        
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (component == 0 ? actions : feels)[row]
    }
}

extension ViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component == 0 ? actions : feels).count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
}
