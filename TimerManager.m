//
//  TimerManager.m
//  LED Incapacitator
//
//  Created by Robert Schriver on 1/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TimerManager.h"

@interface TimerManager ()
- (void)stopLED;
@end

@implementation TimerManager

@synthesize flashController;

@synthesize frequencyMinimum;
@synthesize frequencyMaximum;

@synthesize duration;

-(id) init
{
	
	if (self = [super init])
	{
		flashController = [FlashController init];
	
		frequencyMinimum = 1;
		frequencyMaximum = 10;
	
		duration = .5;
	}
	
	return self;
}

-(void) startTimer
{
	uint random = arc4random();
	
	int frequency = (random % (frequencyMaximum - frequencyMinimum)) + frequencyMinimum;
	
	printf("Random %u Frequency %d\n" , random , frequency);
	
	double frequencyInMilliseconds = 1.0 / frequency;
	
	double durationInMilliseconds = frequencyInMilliseconds * duration;
	
	printf("In Timer %f\n", frequencyInMilliseconds);
	
	[self performSelector:@selector(startTimer) withObject:nil afterDelay:frequencyInMilliseconds];
	
	printf("Starting LED\n");
	[flashController toggleStrobe:TRUE];
	
	[self performSelector:@selector(stopLED) withObject:nil afterDelay:durationInMilliseconds];
}

-(void) stopLED
{
	printf("Stopping LED\n");
	
	[flashController toggleStrobe:FALSE];
}

@end
