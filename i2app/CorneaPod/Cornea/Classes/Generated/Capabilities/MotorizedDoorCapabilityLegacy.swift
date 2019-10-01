
//
// MotorizedDoorCapabilityLegacy.swift
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

@objcMembers public class MotorizedDoorCapabilityLegacy: NSObject, ArcusMotorizedDoorCapability, ArcusPromiseConverter {
  public var disposeBag: DisposeBag = DisposeBag()
  private static let capability: MotorizedDoorCapabilityLegacy  = MotorizedDoorCapabilityLegacy()
  
  static let MotorizedDoorDoorstateCLOSED: String = MotorizedDoorDoorstate.closed.rawValue
  static let MotorizedDoorDoorstateCLOSING: String = MotorizedDoorDoorstate.closing.rawValue
  static let MotorizedDoorDoorstateOBSTRUCTION: String = MotorizedDoorDoorstate.obstruction.rawValue
  static let MotorizedDoorDoorstateOPENING: String = MotorizedDoorDoorstate.opening.rawValue
  static let MotorizedDoorDoorstateOPEN: String = MotorizedDoorDoorstate.open.rawValue
  

  
  public static func getDoorstate(_ model: DeviceModel) -> String? {
    return capability.getMotorizedDoorDoorstate(model)?.rawValue
  }
  
  public static func setDoorstate(_ doorstate: String, model: DeviceModel) {
    guard let doorstate: MotorizedDoorDoorstate = MotorizedDoorDoorstate(rawValue: doorstate) else { return }
    
    capability.setMotorizedDoorDoorstate(doorstate, model: model)
  }
  
  public static func getDoorlevel(_ model: DeviceModel) -> NSNumber? {
    guard let doorlevel: Int = capability.getMotorizedDoorDoorlevel(model) else {
      return nil
    }
    return NSNumber(value: doorlevel)
  }
  
  public static func setDoorlevel(_ doorlevel: Int, model: DeviceModel) {
    
    
    capability.setMotorizedDoorDoorlevel(doorlevel, model: model)
  }
  
  public static func getDoorstatechanged(_ model: DeviceModel) -> Date? {
    guard let doorstatechanged: Date = capability.getMotorizedDoorDoorstatechanged(model) else {
      return nil
    }
    return doorstatechanged
  }
  
}
