//
//  iPhoneDeactivatorAppDelegate.h
//  iPhoneDeactivator
//
//  Created by Vladislav on 27.06.11.
//  Copyright 2011 Tigr@Soft. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "libluckycharms/MDListener.h"
@interface iPhoneDeactivatorAppDelegate : NSObject <NSApplicationDelegate, MDListener> {
@private
    IBOutlet NSImageView *pleaseConnect;
    IBOutlet NSTextField *TextView;
    IBOutlet NSButton *DeactivBtn;
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic) AMDeviceRef deviceRef;
- (IBAction)doIt:(id)sender;

@end
