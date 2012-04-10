//
//  CircularProgressView.m
//  Based on code by soroush khodaii ( http://www.turnedondigital.com/2011/quartz-tutorial-how-to-draw-in-quartz/ )
//

#import "CircularProgressView.h"

@implementation CircularProgressView

-(CGFloat) progress {
	return _progress;
}

-(void) setProgress:(CGFloat) newProgress {
	_progress = newProgress;
	[self setNeedsDisplay];
}

-(void) setColourR:(int)r G:(int)g B:(int)b {
    _rgbaColor[0] = r/255.0;
    _rgbaColor[1] = g/255.0;
    _rgbaColor[2] = b/255.0;
    _rgbaColor[3] = 1;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    int x, y;
    if (self.bounds.size.width > self.bounds.size.height) {
        _radius = self.bounds.size.height/2;
        x = self.bounds.size.width/2 - _radius;
        y = 0;
    } else {
        _radius = self.bounds.size.width/2;
        y = self.bounds.size.height/2 - _radius;
        x = 0;
    }
    CGRect _circleRect = CGRectMake(x, y, _radius*2, _radius*2);
    
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(_circleRect), CGRectGetMidY(_circleRect));
	 
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	 
	// Draw a pie slice
    CGContextSetFillColorSpace(context, CGColorSpaceCreateDeviceRGB());
    CGContextSetFillColor(context, _rgbaColor);
    
    CGContextMoveToPoint(context, centerPoint.x, centerPoint.y);
	CGContextAddLineToPoint(context, centerPoint.x, _circleRect.origin.y);
	CGContextAddArc(context, centerPoint.x, centerPoint.y, _radius, -M_PI/2, (-M_PI/2 + _progress*2*M_PI), 0);
	CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
	 
	//restore the context and remove the clipping area.
	CGContextRestoreGState(context);
}

@end
