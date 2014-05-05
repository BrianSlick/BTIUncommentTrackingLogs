//
//  BTIUncommentTrackingLogs.h
//  BTIUncommentTrackingLogs
//
//  Created by Brian Slick on 5/4/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface BTIUncommentTrackingLogs : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
