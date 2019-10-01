
//
// TiltCapabilityLegacy.swift
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

@objcMembers public class TiltCapabilityLegacy: NSObject, ArcusTiltCapability, ArcusPromiseConverter {
  public var disposeBag: DisposeBag = DisposeBag()
  private static let capability: TiltCapabilityLegacy  = TiltCapabilityLegacy()
  
  static let TiltTiltstateFLAT: String = TiltTiltstate.flat.rawValue
  static let TiltTiltstateUPRIGHT: String = TiltTiltstate.upright.rawValue
  

  
  public static func getTiltstate(_ model: DeviceModel) -> String? {
    return capability.getTiltTiltstate(model)?.rawValue
  }
  
  public static func setTiltstate(_ tiltstate: String, model: DeviceModel) {
    guard let tiltstate: TiltTiltstate = TiltTiltstate(rawValue: tiltstate) else { return }
    
    capability.setTiltTiltstate(tiltstate, model: model)
  }
  
  public static func getTiltstatechanged(_ model: DeviceModel) -> Date? {
    guard let tiltstatechanged: Date = capability.getTiltTiltstatechanged(model) else {
      return nil
    }
    return tiltstatechanged
  }
  
}
