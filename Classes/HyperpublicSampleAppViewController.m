//
//  HyperpublicSampleAppViewController.m
//  HyperpublicSampleApp
//
//  Created by Eric Tang on 9/24/11.
//  Copyright 2011 self-employed. All rights reserved.
//

#import "HyperpublicSampleAppViewController.h"
#import "ASIHTTPRequest.h"

@implementation HyperpublicSampleAppViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
@synthesize request;


- (IBAction)fetchResponse:(id)sender {
	NSString *lat = [latField text];
	NSString *lon = [lonField text];
	NSString *query = [queryField text];

	responseLabel.text = @"hello";
	
	NSString *client_id = @"Your Key";
	NSString *client_secret = @"Your Secret";
	NSString *urlString = [NSString stringWithFormat:@"https://api.hyperpublic.com/api/v1/places?lat=%@&lon=%@&q=%@&client_id=%@&client_secret=%@", lat, lon, query, client_id, client_secret];
	NSURL *url = [NSURL URLWithString:urlString];
	// Create a request
	[self setRequest:[ASIHTTPRequest requestWithURL:url]];
	
	//Customise our user agent, for no real reason
	[request addRequestHeader:@"User-Agent" value:@"ASIHTTPRequest"];
	
	//Set flag to not checkHTTPS certificate 
	[request setValidatesSecureCertificate:NO];
	
	// Start the request
	[request startSynchronous];

	NSString *response = [request responseString];
	//NSLog(@"%@", response);
	NSDictionary *jsonVal = [response JSONValue];

	if ([[jsonVal valueForKey:@"error"] isKindOfClass:[NSString class]]) {
		[responseLabel setText:@"No place found"];
	}
	else {
		[responseLabel setText:[NSString stringWithFormat:@"%d Entries found", [jsonVal count]]];
	}
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[request cancel];
	[request release];
    [super dealloc];
}

@end
