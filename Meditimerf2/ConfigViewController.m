//
//  ConfigViewController.m
//  Meditimerf2
//
//  Created by Stefano Masini on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfigViewController.h"



@implementation MinutesPickerController


- (id) initWithCallback:(void(^)(NSInteger))callback
{
    _callback = [callback copy];
    arrayNo = [[NSMutableArray alloc] init];
    [arrayNo addObject:@" 100 "];
    [arrayNo addObject:@" 200 "];
    [arrayNo addObject:@" 400 "];
    [arrayNo addObject:@" 600 "];
    [arrayNo addObject:@" 1000 "];
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _callback(row);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [arrayNo count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [arrayNo objectAtIndex:row];
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
    preparationTimePickerController = [[MinutesPickerController alloc] initWithCallback:^(NSInteger result){
        // Prints 10
        NSLog(@"Prep time: you selected idx %d \n", result);
    }];
    preparationTimePickerView.dataSource = preparationTimePickerController;
    preparationTimePickerView.delegate = preparationTimePickerController;
    [preparationTimePickerView selectRow:1 inComponent:0 animated:NO];
    
    meditationTimePickerController = [[MinutesPickerController alloc] initWithCallback:^(NSInteger result){
        // Prints 10
        NSLog(@"Med time: you selected idx %d \n", result);
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
