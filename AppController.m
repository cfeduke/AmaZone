//
//  AppController.m
//  AmaZone
//
//  Created by Charles Feduke on 2/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@interface AppController()
-(void)showErrorAlert:(NSError *)error;
@end

@implementation AppController

-(IBAction)fetchBooks:(id)sender {
	[progress startAnimation:nil];
	
	NSString *input = [searchField stringValue];
	NSString *searchString = [input stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	NSLog(@"searchString = %@", searchString);
	
	NSString *urlString = [NSString stringWithFormat:@"http://ecs.amazonaws.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyID=%@&Operation=ItemSearch&SearchIndex=Books&Keywords=%@&Version=2007-07-16", AWS_ID, searchString];
	
	NSURL *url = [NSURL URLWithString:urlString];
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataDontLoad timeoutInterval:30];
	
	NSData *urlData;
	NSURLResponse *response;
	NSError *error;
	
	urlData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
	
	if (!urlData) {
		[self showErrorAlert:error];
		return;
	}
	
	[doc release];
	doc = [[NSXMLDocument alloc] initWithData:urlData options:0 error:&error];
	
	NSLog(@"doc = %@", doc);
	
	if (!doc) {
		[self showErrorAlert:error];
		return;
	}
	
	[itemNodes release];
	itemNodes = [[doc nodesForXPath:@"ItemSearchResponse/Items/Item" error:&error] retain];
	
	if (!itemNodes) {
		[self showErrorAlert:error];
		return;
	}
	
	[tableView reloadData];
	[progress stopAnimation:nil];
	
}

-(int)numberOfRowsInTableView:(NSTableView *)tv {
	return 0;
}

-(void)showErrorAlert:(NSError *)error {
	NSAlert *alert = [NSAlert alertWithError:error];
	[progress stopAnimation:nil];
	[alert runModal];
}
@end
