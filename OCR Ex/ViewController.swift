//
//  ViewController.swift
//  OCR Ex
//
//  Created by MacGoPro on 13/09/2018.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit
import TesseractOCR  

class ViewController: UIViewController {

    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    @IBOutlet weak var textViewBox: UITextView!
    @IBOutlet weak var replaceThis: UITextField!
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    
    var detectedString: String!
    
    @IBAction func textFeildEndEditing(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func snapUploadPressed(_ sender: Any) {
        view.endEditing(true)
        presentImagePicker()
    }
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func swapTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func shareTapped(_ sender: Any) {
    }
    
    func printString(_ string: String){

        DispatchQueue.main.async(execute: {
            self.textViewBox.text = string
            self.activityIndecator.stopAnimating()
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    func doTheDetection(_ image: UIImage){
        // 1
        if let tesseract = G8Tesseract(language: "eng") {
            // 2
            tesseract.engineMode = .tesseractCubeCombined
            // 3
            tesseract.pageSegmentationMode = .auto
            // 4
            tesseract.image = image.g8_blackAndWhite()
            // 5
            tesseract.recognize()
            // 6
            textViewBox.text = tesseract.recognizedText
        }
        // 7
       

        
        activityIndecator.stopAnimating()

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
//
//// MARK: - UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
    
}

