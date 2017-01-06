//
//  AlertManager.h
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertManager : NSObject

+ (void)presentLostConnectionAlertToViewContorller:(UIViewController *)vc;
+ (void)presentAlertError:(NSError *)error viewController:(UIViewController *)vc;

@end
