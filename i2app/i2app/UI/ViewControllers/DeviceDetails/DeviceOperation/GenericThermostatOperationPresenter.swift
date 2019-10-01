//
//  GenericThermostatOperationPresenter.swift
//  i2app
//
//  Created by Arcus Team on 6/25/17.
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

protocol GenericThermostatOperationPresenterProtocol: CommonThermostatOperationPresenterProtocol {
  
  // MARK: Extended
  
  /**
   Text containing the information of the next scheduled event.
   
   @return Text with event data. Nil if no event is scheduled
   */
  func nextEventText() -> NSAttributedString?
}

class GenericThermostatOperationPresenter: NSObject, GenericThermostatOperationPresenterProtocol,
  NestThermostatOperationController {

  weak private(set) var delegate: CommonThermostatOperationPresenterDelegate!
  var thermostatViewModel = ThermostatControlViewModel()
  var modesAvailable: [ThermostatMode] = [.heat, .cool, .auto, .off]

  required init(delegate: CommonThermostatOperationPresenterDelegate) {
    self.delegate = delegate
  }
  
  func nextEventText() -> NSAttributedString? {
    var date: NSDate? = nil
    var eventValue: NSString? = nil
    
    let hasEvent = ClimateScheduleController.nextEvent(for: delegate.deviceModel,
                                                       eventTime: &date,
                                                       eventValue: &eventValue)
    
    if hasEvent,
      let eventValue = eventValue,
      let date = date,
      let formattedDate =  date.formatDateTimeStamp() {

      let attributes: [String: AnyObject] = [
        convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor(red: 255, green: 255, blue: 255, alpha: 0.7),
        convertFromNSAttributedStringKey(NSAttributedString.Key.kern): 2 as AnyObject
      ]
      let solid: [String: AnyObject] = [
        convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor(red: 255, green: 255, blue: 255, alpha: 1.0),
        convertFromNSAttributedStringKey(NSAttributedString.Key.kern): 2 as AnyObject
      ]
      let eventText = NSMutableAttributedString(string: "NEXT EVENT", attributes: convertToOptionalNSAttributedStringKeyDictionary(attributes))
      let eventInfo = NSAttributedString(string: " \(eventValue) AT \(formattedDate)", attributes: convertToOptionalNSAttributedStringKeyDictionary(solid))
      eventText.append(eventInfo)

      return eventText
    } else {
      return nil
    }
  }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
