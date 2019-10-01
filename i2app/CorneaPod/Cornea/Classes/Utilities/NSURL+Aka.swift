//
//  NSURL+Aka.swift
//  i2app
//
//  Arcus Team on 8/10/17.
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

fileprivate struct Redirect {
  static var baseURL: String {
    if let redirectURL = RxCornea.shared.session?.sessionInfo?.redirectBaseUrl {
      return redirectURL
    }
    return ""
  }
}

extension NSURL {

  @objc public static let Support = buildUrl(.support)
  @objc public static let SupportHubAlreadyPaired = buildUrl(.s_hub_already_paired)
  @objc public static let SupportV3HubBLENeedHelp = buildUrl(.s_v3_hub_ble_need_help)
  
  @objc public static let SupportHubPurpleRing = buildUrl(.s_hub_purple_ring)
  @objc public static let SupportHubKittingHelp = buildUrl(.s_hub_kitting_help)
  @objc public static let SupportHubFactoryReset = buildUrl(.s_hub_factory_reset)
  @objc public static let SupportV3HubWifiNeedHelp = buildUrl(.s_v3_hub_wifi_need_help)
  @objc public static let SupportGsIndoorWifiNeedHelp = buildUrl(.s_gs_indoor_wifi_need_help)
  @objc public static let SupportGsIndoorBleNeedHelp = buildUrl(.s_gs_indoor_ble_need_help)
  @objc public static let SupportGsIndoorFactoryReset = buildUrl(.s_gs_indoor_factory_reset)
  @objc public static let SupportGsOutdoorWifiNeedHelp = buildUrl(.s_gs_outdoor_wifi_need_help)
  @objc public static let SupportGsOutdoorBleNeedHelp = buildUrl(.s_gs_outdoor_ble_need_help)
  @objc public static let SupportGsOutdoorFactoryReset = buildUrl(.s_gs_outdoor_factory_reset)
  @objc public static let SupportSwannBleNeedHelp = buildUrl(.s_swann_ble_need_help)
  @objc public static let SupportSwannWifiNeedHelp = buildUrl(.s_swann_wifi_need_help)
  @objc public static let SupportSwannFactoryReset = buildUrl(.s_swann_factory_reset)
  @objc public static let SupportContactSensorTest = buildUrl(.s_contact_sensor_test)
  
  @objc public static let SupportHub = buildUrl(.s_hub)
  @objc public static let SupportAlexa = buildUrl(.s_alexa)
  @objc public static let SupportGoogleAsst = buildUrl(.s_googleassistant)
  @objc public static let SupportDeviceTroubleshooting = buildUrl(.s_devicetroubleshooting)
  @objc public static let SupportWifiSmartSwitch = buildUrl(.s_wifismartswitch)
  @objc public static let SupportProMonitoring = buildUrl(.s_promonitoring)
  @objc public static let SupportNest = buildUrl(.s_nest)
  @objc public static let SupportLeakSmart = buildUrl(.s_leaksmartshutoffvalve)
  @objc public static let SupportImproperlyPairedHue = buildUrl(.s_improperlypairedhue)
  @objc public static let SupportKitSetupHelp = buildUrl(.s_hub_kitting_help)
  @objc public static let SupportSwannCameraNeedHelp = buildUrl(.s_swann_ble_need_help)
  @objc public static let SupportSwannCameraChangeWifi = buildUrl(.s_swann_change_wifi)
  @objc public static let SupportSwannCameraWifiNeedHelp = buildUrl(.s_swann_wifi_need_help)
  @objc public static let SupportSwannCameraFactoryReset = buildUrl(.s_swann_factory_reset)

  @objc public static let NoaaMaps = buildUrl(.noaa_maps)
  @objc public static let VideoHubPairing = buildUrl(.y_hubpairing)
  @objc public static let VideoKitSetup = buildUrl(.y_kit_tutorial)

  @objc public static let ProductsSecurity = buildUrl(.p_security)
  @objc public static let ProductsSmoke = buildUrl(.p_smoke)
  @objc public static let ProductsWater = buildUrl(.p_water)
  @objc public static let ProductsCameras = buildUrl(.p_cameras)
  @objc public static let ProductsCare = buildUrl(.p_care)
  @objc public static let ProductsClimate = buildUrl(.p_climate)
  @objc public static let ProductsDoors = buildUrl(.p_doors)
  @objc public static let ProductsHome = buildUrl(.p_home)
  @objc public static let ProductsLawn = buildUrl(.p_lawn)
  @objc public static let ProductsLights = buildUrl(.p_lights)
  @objc public static let ProductsHub = buildUrl(.p_hub)

  @objc public static func productSupportUrl(deviceType: String, productId: String, devadvErr: String) -> URL {
    let type = deviceType.lowercased().components(separatedBy: .whitespaces).joined()
    let err = devadvErr.lowercased().components(separatedBy: .whitespaces).joined()
    // swiftlint:disable:next line_length
    return URL(string: "\(Redirect.baseURL)/support/devices/\(type)/\(productId)/\(err)")!
  }

  public static func buildUrl (_ key: ArcusUrlKeys) -> URL {
    return URL(string: "\(Redirect.baseURL)/\(key)")!
  }

}

public enum ArcusUrlKeys {
  case support
  case s_hub_already_paired
  case s_v3_hub_ble_need_help
  case s_hub_purple_ring
  case s_hub_kitting_help
  case s_hub_factory_reset
  case s_v3_hub_wifi_need_help
  case s_gs_indoor_wifi_need_help
  case s_gs_indoor_ble_need_help
  case s_gs_indoor_factory_reset
  case s_gs_outdoor_wifi_need_help
  case s_gs_outdoor_ble_need_help
  case s_gs_outdoor_factory_reset
  case s_swann_ble_need_help
  case s_swann_wifi_need_help
  case s_swann_factory_reset
  case s_contact_sensor_test
  case s_hub
  case s_alexa
  case s_googleassistant
  case s_devicetroubleshooting
  case s_wifismartswitch
  case s_promonitoring
  case s_nest
  case s_leaksmartshutoffvalve
  case s_improperlypairedhue
  case s_swann_change_wifi
  case noaa_maps
  case y_hubpairing
  case y_kit_tutorial
  case p_security
  case p_smoke
  case p_water
  case p_cameras
  case p_care
  case p_climate
  case p_doors
  case p_home
  case p_lawn
  case p_lights
  case p_hub
  
  //TODO: In Swift 4.2 use added support for all cases
  public static let allKeys: [ArcusUrlKeys] = [
  .support,
  .s_hub_already_paired,
  .s_v3_hub_ble_need_help,
  .s_hub_purple_ring,
  .s_hub_kitting_help,
  .s_hub_factory_reset,
  .s_v3_hub_wifi_need_help,
  .s_v3_hub_ble_need_help,
  .s_gs_indoor_wifi_need_help,
  .s_gs_indoor_ble_need_help,
  .s_gs_indoor_factory_reset,
  .s_gs_outdoor_wifi_need_help,
  .s_gs_outdoor_ble_need_help,
  .s_gs_outdoor_factory_reset,
  .s_swann_ble_need_help,
  .s_swann_wifi_need_help,
  .s_swann_factory_reset,
  .s_contact_sensor_test,
  .s_hub,
  .s_alexa,
  .s_googleassistant,
  .s_devicetroubleshooting,
  .s_wifismartswitch,
  .s_promonitoring,
  .s_nest,
  .s_leaksmartshutoffvalve,
  .s_improperlypairedhue,
  .s_swann_change_wifi,
  .noaa_maps,
  .y_hubpairing,
  .y_kit_tutorial,
  .p_security,
  .p_smoke,
  .p_water,
  .p_cameras,
  .p_care,
  .p_climate,
  .p_doors,
  .p_home,
  .p_lawn,
  .p_lights,
  .p_hub
  ]
}
