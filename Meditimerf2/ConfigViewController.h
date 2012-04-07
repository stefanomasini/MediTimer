//
//  ConfigViewController.h
//  Meditimerf2
//
//  Created by Stefano Masini on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MinutesPickerController : NSObject <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSMutableArray *arrayNo;
    void (^_callback)(int someParameter);
}

@end


@interface ConfigViewController : UIViewController {
    IBOutlet UIPickerView *preparationTimePickerView;
    IBOutlet UIPickerView *meditationTimePickerView;
    
    MinutesPickerController *preparationTimePickerController;
    MinutesPickerController *meditationTimePickerController;
}

@end


