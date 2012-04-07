//
//  ConfigViewController.h
//  Meditimerf2
//
//  Created by Stefano Masini on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DurationPickerController : NSObject <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSMutableArray *displayValues;
    NSMutableArray *logicValues;
    void (^_callback)(int someParameter);
}

@end


@interface ConfigViewController : UIViewController {
    IBOutlet UIPickerView *preparationTimePickerView;
    IBOutlet UIPickerView *meditationTimePickerView;
    
    DurationPickerController *preparationTimePickerController;
    DurationPickerController *meditationTimePickerController;
}

@end


