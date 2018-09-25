//
//  textBoxExtention.swift
//  OCR Ex
//
//  Created by MacGoPro on 25/09/2018.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveToTop()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        movieToDown()
    }
}
