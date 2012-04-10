//
//  MediViewController.h
//  Meditimerf2
//
//  Created by Stefano Masini on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularProgressView.h"

@interface MediViewController : UIViewController {
    IBOutlet CircularProgressView* circularProgressView;
    
@private
    NSInteger _numUpdates;
    NSTimeInterval _preparationTimeInSec;
    NSTimeInterval _meditationTimeInSec;
    NSTimer *updateTimer;
    NSDate *startTS;
}

- (void)handleTap:(UITapGestureRecognizer*)recognizer;

@end
