//
//  BTIUncommentTrackingLogs.m
//  BTIUncommentTrackingLogs
//
//  Created by Brian Slick on 5/4/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import "BTIUncommentTrackingLogs.h"

#import "BTIStringProcessor.h"

@implementation BTIUncommentTrackingLogs

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{
	NSString *inputString = (NSString *)[input objectAtIndex:0];
	
	if (![inputString isKindOfClass:[NSString class]])
	{
		return input;
	}
	
	BTIStringProcessor *processor = [[BTIStringProcessor alloc] initWithInputString:inputString];
	
	return [processor outputString];
}

@end
