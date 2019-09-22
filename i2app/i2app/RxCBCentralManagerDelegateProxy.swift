//
//  RxCBCentralManagerDelegateProxy.swift
//  i2app
//
//  Created by Arcus Team on 6/25/18.
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

import CoreBluetooth
import RxSwift
import RxCocoa

public class RxCBCentralManagerDelegateProxy: DelegateProxy<CBCentralManager, CBCentralManagerDelegate>, CBCentralManagerDelegate, DelegateProxyType {
  public weak fileprivate(set) var central: CBCentralManager?

  internal var stateBehaviorSubject: BehaviorSubject<CBManagerState>!

  // MARK: - Initialization

//  public required init<Proxy: DelegateProxyType>(parentObject: CBCentralManager, delegate: CBCentralManagerDelegate) {
//    self.central = parentObject //parentObject as? CBCentralManager
//    self.stateBehaviorSubject = BehaviorSubject<CBManagerState>(value: central?.state ?? .unknown)
//    super.init(parentObject: parentObject, delegateProxy: delegate)
//  }

  deinit {
    stateBehaviorSubject.onCompleted()
  }

  // MARK: - Delegate Methods

  public func centralManagerDidUpdateState(_ central: CBCentralManager) {
    self.stateBehaviorSubject?.onNext(central.state)
    self._forwardToDelegate?.centralManagerDidUpdateState(central)
  }

  // MARK: - Delegate Proxy

  public static func registerKnownImplementations() {
    // TODO: what do we do here?
  }

  public class func createProxyForObject(_ object: CBCentralManager) -> RxCBCentralManagerDelegateProxy {
//    guard let central: CBCentralManager = object as? CBCentralManager else { fatalError() }
    return object.rxDelegateProxy()
  }

  public static func setCurrentDelegate(_ delegate: CBCentralManagerDelegate?, to object: CBCentralManager) {
    object.delegate = delegate
  }

  public static func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
    guard let central: CBCentralManager = object as? CBCentralManager else { fatalError() }
    central.delegate = delegate as? CBCentralManagerDelegate
  }

  public static func currentDelegate(for object: CBCentralManager) -> CBCentralManagerDelegate? {
    return object.delegate
  }
    
  // The old way of doing things.
  public static func currentDelegateFor(for object: CBCentralManager) -> CBCentralManagerDelegate? {
    guard let central: CBCentralManager = object as? CBCentralManager else { fatalError() }
    return central.delegate
  }
}
