
//
// CarbonMonoxideCapabilityLegacy.swift
//
// Generated on 20/09/18
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

import Foundation
import PromiseKit
import RxSwift

// MARK: Legacy Support

@objcMembers public class CarbonMonoxideCapabilityLegacy: NSObject, ArcusCarbonMonoxideCapability, ArcusPromiseConverter {
  public var disposeBag: DisposeBag = DisposeBag()
  private static let capability: CarbonMonoxideCapabilityLegacy  = CarbonMonoxideCapabilityLegacy()
  
  static let CarbonMonoxideCoSAFE: String = CarbonMonoxideCo.safe.rawValue
  static let CarbonMonoxideCoDETECTED: String = CarbonMonoxideCo.detected.rawValue
  
  static let CarbonMonoxideEolOK: String = CarbonMonoxideEol.ok.rawValue
  static let CarbonMonoxideEolEOL: String = CarbonMonoxideEol.eol.rawValue
  

  
  public static func getCo(_ model: DeviceModel) -> String? {
    return capability.getCarbonMonoxideCo(model)?.rawValue
  }
  
  public static func getEol(_ model: DeviceModel) -> String? {
    return capability.getCarbonMonoxideEol(model)?.rawValue
  }
  
  public static func getCochanged(_ model: DeviceModel) -> Date? {
    guard let cochanged: Date = capability.getCarbonMonoxideCochanged(model) else {
      return nil
    }
    return cochanged
  }
  
  public static func getCoppm(_ model: DeviceModel) -> NSNumber? {
    guard let coppm: Int = capability.getCarbonMonoxideCoppm(model) else {
      return nil
    }
    return NSNumber(value: coppm)
  }
  
}
