//
//  ImageExt.swift
//  OCR Ex
//
//  Created by MacGoPro on 25/09/2018.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func scaleImage(_maxDimension: CGFloat) -> UIImage? {
        var scaledSize = CGSize(width: _maxDimension, height: _maxDimension)
        
        if size.width > size.height {
            let scaleFactor = size.height / size.width
            scaledSize.height = scaledSize.width * scaleFactor
        }
        else {
            let scaleFactor = size.width / size.height
            scaledSize.width = scaledSize.height * scaleFactor
        }
        
        UIGraphicsBeginImageContext(scaledSize)
        draw(in: CGRect(origin: .zero, size: scaledSize))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        return scaledImage
    }
}
