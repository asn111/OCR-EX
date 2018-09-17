//
//  ViewController.swift
//  OCR Ex
//
//  Created by MacGoPro on 13/09/2018.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    @IBOutlet weak var textViewBox: UITextView!
    @IBOutlet weak var replaceThis: UITextField!
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    
    @IBAction func textFeildEndEditing(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func snapUploadPressed(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func swapTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func shareTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    func doTheDetection(_ image: UIImage){
        
    }
    
    func moveToTop(){
        if(topMarginConstraint.constant != 0){
            return
        }
        topMarginConstraint.constant -= 135
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    func movieToDown(){
        if(topMarginConstraint.constant == 0){
            return
        }
        topMarginConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveToTop()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        movieToDown()
    }
}
