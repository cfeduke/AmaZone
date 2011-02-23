//
//  AppController.h
//  AmaZone
//
//  Created by Charles Feduke on 2/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// AWS_ID.h is a header file that contains only:
// #define AWS_ID = "a AWS ID here"
#import "AWS_ID.h"

@interface AppController : NSObject {
	IBOutlet NSProgressIndicator *progress;
	IBOutlet NSTextField *searchField;
	IBOutlet NSTableView *tableView;
	
	NSXMLDocument *doc;
	NSArray *itemNodes;
}

-(IBAction)fetchBooks:(id)sender;

@end
