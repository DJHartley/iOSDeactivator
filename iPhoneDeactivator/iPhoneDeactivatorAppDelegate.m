//
//  iPhoneDeactivatorAppDelegate.m
//  iPhoneDeactivator
//
//  Created by Vladislav on 27.06.11.
//  Copyright 2011 Tigr@Soft. All rights reserved.
//

#import "iPhoneDeactivatorAppDelegate.h"
#include "libluckycharms/MDListener.h"
#include "libluckycharms/MDNotificationCenter.h"
@implementation iPhoneDeactivatorAppDelegate
@synthesize deviceRef;
@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    [[MDNotificationCenter sharedInstance] addListener:self];
}


- (void)normalDeviceAttached:(AMDeviceRef)device {
    [pleaseConnect setHidden:TRUE];
    [TextView setTitleWithMnemonic:@"Connected"];
    deviceRef = device;
    [DeactivBtn setEnabled:TRUE];
}
- (IBAction)doIt:(id)sender {
    AMDeviceDeactivate(deviceRef);
    [TextView setTitleWithMnemonic:@"Done. Now connect another device."];
    [DeactivBtn setEnabled:FALSE];
    [pleaseConnect setHidden:false];
}
@end
