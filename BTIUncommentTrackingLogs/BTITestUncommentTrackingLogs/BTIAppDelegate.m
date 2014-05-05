//
//  BTIAppDelegate.m
//  BTITestUncommentTrackingLogs
//
//  Created by Brian Slick on 5/4/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import "BTIAppDelegate.h"

#import "BTIStringProcessor.h"

@implementation BTIAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"livetest" withExtension:@"txt"];
    
    NSString *inputString = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"\ninput:\n-----\n%@\n-----", inputString);
    
    BTIStringProcessor *processor = [[BTIStringProcessor alloc] initWithInputString:inputString];
    
    NSString *outputString = [processor outputString];
    
    NSLog(@"\nfinal output:\n-----\n%@\n-----", outputString);
}

@end
