//
//  HyperpublicSampleAppAppDelegate.h
//  HyperpublicSampleApp
//
//  Created by Eric Tang on 9/24/11.
//  Copyright 2011 self-employed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@class HyperpublicSampleAppViewController;

@interface HyperpublicSampleAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HyperpublicSampleAppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HyperpublicSampleAppViewController *viewController;

@end

