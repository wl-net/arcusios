
//
// RelativeHumidityCapabilityLegacy.swift
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

@objcMembers public class RelativeHumidityCapabilityLegacy: NSObject, ArcusRelativeHumidityCapability, ArcusPromiseConverter {
  public var disposeBag: DisposeBag = DisposeBag()
  private static let capability: RelativeHumidityCapabilityLegacy  = RelativeHumidityCapabilityLegacy()
  

  
  public static func getHumidity(_ model: DeviceModel) -> NSNumber? {
    guard let humidity: Double = capability.getRelativeHumidityHumidity(model) else {
      return nil
    }
    return NSNumber(value: humidity)
  }
  
}
