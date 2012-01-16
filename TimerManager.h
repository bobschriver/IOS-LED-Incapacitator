//
//  TimerManager.h
//  LED Incapacitator
//
//  Created by Robert Schriver on 1/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashController.h"


@interface TimerManager : NSObject {
	double duration;
	
	int frequencyMinimum;
	int frequencyMaximum;
	
	FlashController *flashController;
}

@property (nonatomic) double duration;

@property (nonatomic) int frequencyMinimum;
@property (nonatomic) int frequencyMaximum;

@property (nonatomic, retain) FlashController * flashController;

-(id)init;
-(void)startTimer;

@end
