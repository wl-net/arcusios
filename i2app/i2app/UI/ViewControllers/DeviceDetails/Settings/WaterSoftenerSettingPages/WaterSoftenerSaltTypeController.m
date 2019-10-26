//
//  WaterSoftenerSaltTypeController.m
//  i2app
//
//  Created by Arcus Team on 10/12/15.
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

#import <i2app-Swift.h>
#import "WaterSoftenerSaltTypeController.h"

@interface WaterSoftenerSaltTypeController ()

@end

@implementation WaterSoftenerSaltTypeController {
    __weak IBOutlet UIButton    *theBottomButton;
}

+ (WaterSoftenerSaltTypeController *)create {
    return [[UIStoryboard storyboardWithName:@"DeviceDetailSetting" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navBarWithBackButtonAndTitle:[NSLocalizedString(@"Buy", nil) uppercaseString]];
    [self setBackgroundColorToLastNavigateColor];
    [self addDarkOverlay:BackgroupOverlayLightLevel];
    
    [theBottomButton styleSet:NSLocalizedString(@"Buy", nil) andButtonType:FontDataTypeButtonLight];
}

- (IBAction)onClickBuyButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @""] options:@{} completionHandler:nil];
}

@end
