
//
// FanCapabilityLegacy.swift
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

@objcMembers public class FanCapabilityLegacy: NSObject, ArcusFanCapability, ArcusPromiseConverter {
  public var disposeBag: DisposeBag = DisposeBag()
  private static let capability: FanCapabilityLegacy  = FanCapabilityLegacy()
  
  static let FanDirectionUP: String = FanDirection.up.rawValue
  static let FanDirectionDOWN: String = FanDirection.down.rawValue
  

  
  public static func getSpeed(_ model: DeviceModel) -> NSNumber? {
    guard let speed: Int = capability.getFanSpeed(model) else {
      return nil
    }
    return NSNumber(value: speed)
  }
  
  public static func setSpeed(_ speed: Int, model: DeviceModel) {
    
    
    capability.setFanSpeed(speed, model: model)
  }
  
  public static func getMaxSpeed(_ model: DeviceModel) -> NSNumber? {
    guard let maxSpeed: Int = capability.getFanMaxSpeed(model) else {
      return nil
    }
    return NSNumber(value: maxSpeed)
  }
  
  public static func getDirection(_ model: DeviceModel) -> String? {
    return capability.getFanDirection(model)?.rawValue
  }
  
  public static func setDirection(_ direction: String, model: DeviceModel) {
    guard let direction: FanDirection = FanDirection(rawValue: direction) else { return }
    
    capability.setFanDirection(direction, model: model)
  }
  
}
