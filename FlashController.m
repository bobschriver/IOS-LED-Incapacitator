//
//  FlashController.m
//  iStrobe
//
//  Created by Nicholas Vellios on 7/25/10.
//  Copyright 2010 Nick Vellios. All rights reserved.
//
//	http://www.Vellios.com
//	nick@vellios.com
//
//	This code is released under the "Take a kid fishing or hunting license"
//	In order to use any code in your project you must take a kid fishing or
//	hunting and give some sort of credit to the author of the code either
//	on your product's website, about box, or legal agreement.
//  For more information visit http://www.Vellios.com/license/
//

#import "FlashController.h"

@interface FlashController ()
- (void)setupStrobe;
@end

@implementation FlashController

@synthesize captureSession;

- (id)init {
    // Assign self to value returned by super's designated initializer
    // Designated initializer for NSObject is init
	
    if (self = [super init]) {
		[self setupStrobe];
    }
	
    return self;
}

- (void)setupStrobe {
	captureSession = [[AVCaptureSession alloc] init];
	
	[captureSession beginConfiguration];
	
	captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	
	if ([captureDevice hasTorch] && [captureDevice hasFlash]) {
		AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:nil];
		
		if (deviceInput) {
			[captureSession addInput:deviceInput];
		}
		
		AVCaptureVideoDataOutput *dataOut = [[AVCaptureVideoDataOutput alloc] init];
		
		[captureSession addOutput:dataOut];
		[dataOut release];

		[captureSession commitConfiguration];
		[captureSession startRunning];
	}
}

- (void)toggleStrobe:(BOOL)strobeOn {
	[captureDevice lockForConfiguration:nil];
	
	[captureDevice setTorchMode:strobeOn];
	[captureDevice setFlashMode:strobeOn];	

	[captureDevice unlockForConfiguration];
}

- (void)dealloc {
	[captureSession release];
	
    [super dealloc];
}

@end
