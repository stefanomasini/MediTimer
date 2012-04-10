//
//  MediViewController.m
//  Meditimerf2
//
//  Created by Stefano Masini on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MediViewController.h"

@implementation MediViewController

- (void)handleTap:(UITapGestureRecognizer*)recognizer
{
    // Do Your thing. 
//    if (recognizer.state == UIGestureRecognizerStateEnded)
//    {
//        [self startTimer];
//    }
}

- (IBAction)startTimer
{
    NSLog(@"Gotcha! %@\n", circularProgressView);
    _preparationTimeInSec = 1;
    _meditationTimeInSec = 20;
    _numUpdates = 360/0.1; // Update every third of degree
    NSTimeInterval updateInterval = _meditationTimeInSec / _numUpdates;
    startTS = [NSDate date];
    
    updateTimer = [NSTimer 
                   scheduledTimerWithTimeInterval:updateInterval
                   target:self selector:@selector(_updateCircularTimer) 
                   userInfo:nil 
                   repeats:YES];
}

- (void)_updateCircularTimer
{
    NSTimeInterval elapsed = [[NSDate date] timeIntervalSinceDate:startTS];
    double progress = elapsed / _meditationTimeInSec;
    if (elapsed < _preparationTimeInSec) {
        [circularProgressView setColourR:250 G:210 B:10];
    } else {
        [circularProgressView setColourR:80 G:180 B:20];
    }
    circularProgressView.progress = (progress<1.0 ? progress : 1.0);
    if (progress > 1) {
        [updateTimer invalidate];
    }
}

- (IBAction)rotateConfig
{
    NSLog(@"Config!\n");
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.8];
//    
//    [UIView setAnimationTransition:([viewm superview] 
//                                    ? UIViewAnimationTransitionFlipFromRight
//                                    : UIViewAnimationTransitionFlipFromLeft) forView:mainView cache:YES];
//    
//    if([configView superview]){
//        [configView removeFromSuperview];
//        [mainView addSubview:viewm];
//    } else {
//        [viewm removeFromSuperview];
//        [mainView addSubview:configView];
//    }
//    
//    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)infoButtonPressed
{
    NSLog(@"Info button pressed\n");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
