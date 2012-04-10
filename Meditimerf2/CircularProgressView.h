//
//  CircularProgressView.h
//  Based on code by soroush khodaii ( http://www.turnedondigital.com/2011/quartz-tutorial-how-to-draw-in-quartz/ )
//  
//

#import <UIKit/UIKit.h>


@interface CircularProgressView : UIView {
@private
	CGFloat _rgbaColor[4];
	CGFloat _progress;
    CGFloat _radius;
}

@property CGFloat progress;
-(void) setColourR:(int)r G:(int)g B:(int)b;

@end
