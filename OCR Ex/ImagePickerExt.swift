//
//  ImagePickerExt.swift
//  OCR Ex
//
//  Created by MacGoPro on 25/09/2018.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation
import UIKit
import SwiftOCR

extension ViewController: UIImagePickerControllerDelegate {
    func presentImagePicker() {
        let imagePickerActionSheet = UIAlertController(title: "Upload an image", message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let camButon = UIAlertAction(title: "Take Photo", style: .default) {(alert) -> Void in
                let imagepicker = UIImagePickerController()
                imagepicker.delegate = self
                imagepicker.sourceType = .camera
                self.present(imagepicker, animated: true, completion: nil)
            }
            imagePickerActionSheet.addAction(camButon)
        }
        // 1
        let libraryButton = UIAlertAction(title: "Choose Existing",
                                          style: .default) { (alert) -> Void in
                                            let imagePicker = UIImagePickerController()
                                            imagePicker.delegate = self
                                            imagePicker.sourceType = .photoLibrary
                                            self.present(imagePicker, animated: true)
        }
        imagePickerActionSheet.addAction(libraryButton)
        // 2
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        imagePickerActionSheet.addAction(cancelButton)
        // 3
        present(imagePickerActionSheet, animated: true)
    }
    // 1
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // 2
        if let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage,
            let scaledImage = selectedPhoto.scaleImage(_maxDimension: 640) {
            // 3
            activityIndecator.startAnimating()
            // 4
            dismiss(animated: true, completion: {
                // self.doTheDetection(scaledImage)
                let swiftOCRInstance = SwiftOCR()
                
                swiftOCRInstance.recognize(scaledImage) { recognizedString in
                    print(recognizedString)
                    self.printString(recognizedString)
                }
                // self.activityIndecator.stopAnimating()
            })
        }
    }
    
}
