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

//--------------------------------
// Connection events
//--------------------------------

- (void)normalDeviceAttached:(AMDeviceRef)device { //Device attached
    [pleaseConnect setHidden:TRUE]; //Hide the picture
    [TextView setTitleWithMnemonic:@"Connected"]; //Set status text
    deviceRef = device; //Save device reference
    [DeactivBtn setEnabled:TRUE]; //Enable button
}

- (void)normalDeviceDetached:(AMDeviceRef)device { //Device detached
    [self devDisconnected];
}

- (void)normalDeviceConnectionError { //error
    [TextView setTitleWithMnemonic:@"Connection error. Waiting for new connection..."]; //status text
    deviceRef = nil; //clear device reference, just in case
    [DeactivBtn setEnabled:false]; //disable button
    [pleaseConnect setHidden:false]; //show image
}

- (void)restoreDeviceAttached:(AMRestoreModeDeviceRef)device { //Restore device attached
    [pleaseConnect setHidden:false]; //Show the picture
    [TextView setTitleWithMnemonic:@"Restore mode device connected. But we need a normal device!"]; //Set status text
    deviceRef = nil; //Clear device reference
    [DeactivBtn setEnabled:FALSE]; //Disable button
}

- (void)restoreDeviceDetached:(AMRestoreModeDeviceRef)device { //Restore device detached
    [self devDisconnected];
}

- (void)recoveryDeviceAttached:(AMRecoveryModeDeviceRef)device { //Recovery device attached
    [pleaseConnect setHidden:false]; //Show the picture
    [TextView setTitleWithMnemonic:@"Recovery mode device connected. But we need a normal device!"]; //Set status text
    deviceRef = nil; //Clear device reference
    [DeactivBtn setEnabled:FALSE]; //Disable button
}

- (void)recoveryDeviceDetached:(AMRecoveryModeDeviceRef)device {
    [self devDisconnected];
}

- (void)dfuDeviceAttached:(AMDFUModeDeviceRef)device {
    [pleaseConnect setHidden:false]; //Show the picture
    [TextView setTitleWithMnemonic:@"DFU mode device connected. But we need a normal device!"]; //Set status text
    deviceRef = nil; //Clear device reference
    [DeactivBtn setEnabled:FALSE]; //Disable button
}

- (void)dfuDeviceDetached:(AMDFUModeDeviceRef)device {
    [self devDisconnected];
}
//-------------------------------
// Program stuff
//-------------------------------


- (IBAction)doIt:(id)sender {
    AMDeviceDeactivate(deviceRef); //Deactivate device
    [TextView setTitleWithMnemonic:@"Done."];
}

-(void)devDisconnected {
    [pleaseConnect setHidden:false]; //Show the picture
    [TextView setTitleWithMnemonic:@"Waiting for connection..."]; //Set status text
    deviceRef = nil; //Clear device reference
    [DeactivBtn setEnabled:FALSE]; //Disable button
}
@end
