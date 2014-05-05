//
//  BTITestUncommentTrackingLogsTests.m
//  BTITestUncommentTrackingLogsTests
//
//  Created by Brian Slick on 5/4/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BTIStringProcessor.h"

@interface BTITestUncommentTrackingLogsTests : XCTestCase

@end

@implementation BTITestUncommentTrackingLogsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Test 1

- (void)testThatBTITrackingLogsAreUncommented
{
    NSURL *inputURL = [[NSBundle mainBundle] URLForResource:@"test1input-uncommentBTIlog" withExtension:@"txt"];
    NSURL *outputURL = [[NSBundle mainBundle] URLForResource:@"test1output" withExtension:@"txt"];
    
    NSString *inputString = [[NSString alloc] initWithContentsOfURL:inputURL encoding:NSUTF8StringEncoding error:nil];
    NSString *outputStringReference = [[NSString alloc] initWithContentsOfURL:outputURL encoding:NSUTF8StringEncoding error:nil];
    
    BTIStringProcessor *processor = [[BTIStringProcessor alloc] initWithInputString:inputString];
    NSString *outputString = [processor outputString];
    
    XCTAssertEqualObjects(outputString, outputStringReference, @"Tracking logs should have been uncommented");
}



@end
