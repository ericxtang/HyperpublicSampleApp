//
//  HyperpublicSampleAppViewController.h
//  HyperpublicSampleApp
//
//  Created by Eric Tang on 9/24/11.
//  Copyright 2011 self-employed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface HyperpublicSampleAppViewController : UIViewController {
	ASIHTTPRequest *request;

	IBOutlet UITextField *queryField;
	IBOutlet UITextField *latField;
	IBOutlet UITextField *lonField;
	IBOutlet UILabel *responseLabel;

	UITextView *responseField;
}

- (IBAction)fetchResponse:(id)sender;

@property (retain, nonatomic) ASIHTTPRequest *request;

@end

