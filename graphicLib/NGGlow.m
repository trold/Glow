//
//  NGGlow.m
//  radialGradientSpot
//
//  Created by Klaus Pedersen on 20/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NGGlow.h"

@implementation NGGlow

@synthesize innerColor;
@synthesize outterColor;
@synthesize alphaGlow;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //radial gradient centre point.
    CGPoint startCenter, endCenter;
    startCenter = endCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    //radial gradient radius;
    CGFloat startRadius = 0.0;
    CGFloat endRadius = CGRectGetMidX(rect) > CGRectGetMidY(rect) ? CGRectGetMidX(rect): CGRectGetMidY(rect);
    
    NSLog(@"startcenter. X:%f Y:%f startRadius:%f endRadius:%f", startCenter.x, startCenter.y, startRadius, endRadius );
    
    
    //gradient locations.
    CGFloat locations[2] = {0.0, 1.0};
    //gradient color components.
    //black color
    
    CGFloat components[8] = {innerColor, innerColor, innerColor, alphaGlow,
        outterColor, outterColor, outterColor, alphaGlow};
    
    //Drawing code.
    CGContextRef context = UIGraphicsGetCurrentContext();
    //Get RGB color space
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    //create gradient.
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, locations, 2);
    CGColorSpaceRelease(space);
    //draw gradient.
    CGContextDrawRadialGradient(context, gradient, startCenter, startRadius,endCenter,endRadius, kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);
    
    UIGraphicsEndImageContext();

}


@end
