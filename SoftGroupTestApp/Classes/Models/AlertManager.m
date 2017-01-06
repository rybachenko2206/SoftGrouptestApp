//
//  AlertManager.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import "AlertManager.h"

@implementation AlertManager

#pragma mark - Static methods

+ (void)presentLostConnectionAlertToViewContorller:(UIViewController *)vc {
    [AlertManager showAlertViewWithTitle:@"Connection failed"
                                 message:@"Please make sure you have a working Internet connection and try again"
                       cancelButtonTitle:@"OK"
                          viewController:vc];
}

+ (void)presentAlertError:(NSError *)error viewController:(UIViewController *)vc {
    [AlertManager showAlertViewWithTitle:@"Error"
                                 message:error.localizedDescription
                       cancelButtonTitle:@"OK"
                          viewController:vc];
}


#pragma mark - Private Static methods

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
                viewController:(UIViewController *)viewController {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {}];
    
    [alertController addAction:cancelAction];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
