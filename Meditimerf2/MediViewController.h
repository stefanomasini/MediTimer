//
//  MediViewController.h
//  Meditimerf2
//
//  Created by Stefano Masini on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediViewController : UIViewController {
    IBOutlet UILabel *label;
    IBOutlet UIView *viewm;
    IBOutlet UIView *configView;
    IBOutlet UIView *mainView;
}

- (IBAction)foo;
- (void)printTimerValueAndScheduleNextCall;

@property int32_t timerValue;

@end
