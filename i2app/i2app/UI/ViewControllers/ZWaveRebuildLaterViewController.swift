//
//  RebuildLaterViewController.swift
//  i2app
//
//  Arcus Team on 9/21/16.
/*
 * Copyright 2019 Arcus Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
//

import Foundation
import Cornea

open class ZWaveRebuildLaterViewController: UIViewController {

  @IBOutlet weak var continueToDashboard: UIButton!
  @IBOutlet weak var rebuildLaterLabel: UILabel!

  override open func viewDidLoad() {
    configureButtons()
    configureLabels()
    configureNavBar()
  }

  @IBAction func onContinueToDashboard(_ sender: AnyObject) {
    self.dismiss(animated: true, completion: nil)
  }

  fileprivate func configureButtons() {
    continueToDashboard.styleSet("CONTINUE TO DASHBOARD",
                                 andButtonType: FontDataTypeButtonDark,
                                 upperCase: true)
  }

  fileprivate func configureLabels() {
    let rebuildLater = "Rebuild your Z-Wave Network by tapping \n Devices and then Z-Wave Tools in "
      + "\n the left hand navigation."

    rebuildLaterLabel
      .attributedText = NSAttributedString(string:  rebuildLater,
                                           attributes:convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont(name: "AvenirNext-Medium",
                                                                                   size: 14.0)!,
                                                       convertFromNSAttributedStringKey(NSAttributedString.Key.kern): 0.0]))
  }

  fileprivate func configureNavBar() {
    self.navBar(withTitle: "REBUILD LATER")
  }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
