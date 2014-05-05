//
//  BTIStringProcessor.m
//  BTIUncommentTrackingLogs
//
//  Created by Brian Slick on 5/4/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import "BTIStringProcessor.h"

// Private Constants

@interface BTIStringProcessor ()

// Private Properties
@property (nonatomic, copy) NSString *originalString;

// Private Methods

@end

@implementation BTIStringProcessor

- (instancetype)initWithInputString:(NSString *)input
{
    self = [super init];
    if (self)
    {
        [self setOriginalString:input];
    }
    return self;
}

- (NSString *)outputString
{
    NSString *inputString = [self originalString];
    
    NSArray *originalLines = [inputString componentsSeparatedByString:@"\n"];
    
    NSMutableArray *modifiedLines = [NSMutableArray array];
    
    for (NSString *line in originalLines)
    {
        if (![self isATrackingLogLine:line])
        {
            [modifiedLines addObject:line];
            
            continue;
        }
        
        [modifiedLines addObject:[self removeCommentMarksFromLine:line]];
    }
    
    NSString *outputString = [modifiedLines componentsJoinedByString:@"\n"];
    
    return outputString;
}

- (BOOL)isATrackingLogLine:(NSString *)line
{
    if ([line rangeOfString:@"BTITrackingLog"].location != NSNotFound)
    {
        return YES;
    }
    
    if ([line rangeOfString:@"NSLog"].location == NSNotFound)
    {
        return NO;
    }
    
    if ([self isAnEnteringLine:line] || [self isALeavingLine:line])
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)isAnEnteringLine:(NSString *)line
{
    if ([line rangeOfString:@">>> Entering"].location != NSNotFound)
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)isALeavingLine:(NSString *)line
{
    if ([line rangeOfString:@"<<< Leaving"].location != NSNotFound)
    {
        return YES;
    }
    
    return NO;
}

- (NSString *)removeCommentMarksFromLine:(NSString *)line
{
    NSString *uncommentedLine = [line stringByReplacingOccurrencesOfString:@"//" withString:@""];
    
    return uncommentedLine;
}

@end
