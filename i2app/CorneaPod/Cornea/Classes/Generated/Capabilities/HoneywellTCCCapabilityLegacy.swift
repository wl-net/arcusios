
//
// HoneywellTCCCapabilityLegacy.swift
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

@objcMembers public class HoneywellTCCCapabilityLegacy: NSObject, ArcusHoneywellTCCCapability, ArcusPromiseConverter {
  public var disposeBag: DisposeBag = DisposeBag()
  private static let capability: HoneywellTCCCapabilityLegacy  = HoneywellTCCCapabilityLegacy()
  
  static let HoneywellTCCAuthorizationStateAUTHORIZED: String = HoneywellTCCAuthorizationState.authorized.rawValue
  static let HoneywellTCCAuthorizationStateDEAUTHORIZED: String = HoneywellTCCAuthorizationState.deauthorized.rawValue
  

  
  public static func getRequiresLogin(_ model: DeviceModel) -> NSNumber? {
    guard let requiresLogin: Bool = capability.getHoneywellTCCRequiresLogin(model) else {
      return nil
    }
    return NSNumber(value: requiresLogin)
  }
  
  public static func getAuthorizationState(_ model: DeviceModel) -> String? {
    return capability.getHoneywellTCCAuthorizationState(model)?.rawValue
  }
  
}
