//
//  CarAppDelegate.h
//  Car
//
//  Created by Adam on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectCarViewController;

@interface CarAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SelectCarViewController *viewController;

@end
