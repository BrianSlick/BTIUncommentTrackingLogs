//
//  BTIStringProcessor.h
//  BTIUncommentTrackingLogs
//
//  Created by Brian Slick on 5/4/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

// Libraries
#import <Foundation/Foundation.h>

// Classes and Forward Declarations

// Public Constants

// Protocols

@interface BTIStringProcessor : NSObject

// Public Properties

// Public Methods
- (instancetype)initWithInputString:(NSString *)input;
- (NSString *)outputString;

@end
