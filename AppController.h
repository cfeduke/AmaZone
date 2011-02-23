//
//  AppController.h
//  AmaZone
//
//  Created by Charles Feduke on 2/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
	IBOutlet NSProgressIndicator *progress;
	IBOutlet NSTextField *searchField;
	IBOutlet NSTableView *tableView;
}

-(IBAction)fetchBooks:(id)sender;

@end
