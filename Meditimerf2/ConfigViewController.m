//
//  ConfigViewController.m
//  Meditimerf2
//
//  Created by Stefano Masini on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfigViewController.h"



@implementation DurationPickerController


- (id) initForMinutes:(NSInteger)numMinutes withCallback:(void(^)(NSInteger))callback
{
    _callback = [callback copy];
    displayValues = [[NSMutableArray alloc] init];
    logicValues = [[NSMutableArray alloc] init];
    
    for (NSInteger m=1; m<=numMinutes; ++m) {
        [displayValues addObject:[NSString stringWithFormat:@"%d min", m]];
        [logicValues addObject:[NSNumber numberWithInteger:(m*60)]];
    }
    return self;
}

- (id) initForShortTimeWithCallback:(void(^)(NSInteger))callback
{
    _callback = [callback copy];
    displayValues = [[NSMutableArray alloc] init];
    logicValues = [[NSMutableArray alloc] init];
    
    [displayValues addObject:@"15 sec"];
    [logicValues addObject:[NSNumber numberWithInteger:15]];
    [displayValues addObject:@"30 sec"];
    [logicValues addObject:[NSNumber numberWithInteger:30]];
    [displayValues addObject:@"45 sec"];
    [logicValues addObject:[NSNumber numberWithInteger:45]];
    [displayValues addObject:@"1 min"];
    [logicValues addObject:[NSNumber numberWithInteger:60]];
    [displayValues addObject:@"2 min"];
    [logicValues addObject:[NSNumber numberWithInteger:120]];
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _callback([[logicValues objectAtIndex:row] integerValue]);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [displayValues count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [displayValues objectAtIndex:row];
}



@end






@implementation ConfigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    preparationTimePickerController = [[DurationPickerController alloc] initForShortTimeWithCallback:^(NSInteger result){
        // Prints 10
        NSLog(@"Prep time: you selected %d sec \n", result);
    }];
    preparationTimePickerView.dataSource = preparationTimePickerController;
    preparationTimePickerView.delegate = preparationTimePickerController;
    [preparationTimePickerView selectRow:1 inComponent:0 animated:NO];
    
    meditationTimePickerController = [[DurationPickerController alloc] initForMinutes:90 withCallback:^(NSInteger result){
        // Prints 10
        NSLog(@"Med time: you selected %d sec \n", result);
    }];
    meditationTimePickerView.dataSource = meditationTimePickerController;
    meditationTimePickerView.delegate = meditationTimePickerController;
    [meditationTimePickerView selectRow:1 inComponent:0 animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
