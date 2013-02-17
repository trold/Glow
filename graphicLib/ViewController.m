//
//  ViewController.m
//  graphicLib
//
//  Created by Klaus Pedersen on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "NGGlow.h"

@interface ViewController ()

@property (strong, nonatomic) UISlider *sizeSlider;
@property (strong, nonatomic) UILabel *sizeSliderLable;
@property (strong, nonatomic) UISlider *innerColorSlider;
@property (strong, nonatomic) UILabel *innerColorSliderLable;
@property (strong, nonatomic) UISlider *outterColorSlider;
@property (strong, nonatomic) UILabel *outterColorSliderLable;
@property (strong, nonatomic) UISlider *alphaSlider;
@property (strong, nonatomic) UILabel *alphaSliderLable;

@property (strong, nonatomic) NGGlow *glow;

@end

@implementation ViewController

@synthesize sizeSlider;
@synthesize sizeSliderLable;
@synthesize innerColorSlider;
@synthesize innerColorSliderLable;
@synthesize outterColorSlider;
@synthesize outterColorSliderLable;
@synthesize alphaSlider;
@synthesize alphaSliderLable;

@synthesize glow;

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    sizeSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, self.view.bounds.size.height - 80, 700, 40)];
    sizeSlider.minimumValue = 0;
    sizeSlider.maximumValue = 700;
    sizeSlider.value = 150;
    [sizeSlider addTarget:self action:@selector(sizeSliderValueChangedAction:) forControlEvents:UIControlEventValueChanged];
    
    sizeSliderLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 80, 50, 40)];
    sizeSliderLable.textColor = [UIColor whiteColor];
    sizeSliderLable.backgroundColor = [UIColor blackColor];
    sizeSliderLable.textAlignment = UITextAlignmentCenter;
    sizeSliderLable.text = [[NSNumber numberWithFloat:self.sizeSlider.value] stringValue];
    
    
    innerColorSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, self.view.bounds.size.height - 40, 150, 40)];
    innerColorSlider.minimumValue = 0;
    innerColorSlider.maximumValue = 100;
    innerColorSlider.value = 90;
    [innerColorSlider addTarget:self action:@selector(innerColorSliderValueChangedAction:) forControlEvents:UIControlEventValueChanged];
    
    innerColorSliderLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 40, 50, 40)];
    innerColorSliderLable.textColor = [UIColor whiteColor];
    innerColorSliderLable.backgroundColor = [UIColor blackColor];
    innerColorSliderLable.textAlignment = UITextAlignmentCenter;
    innerColorSliderLable.text = [[NSNumber numberWithFloat:self.innerColorSlider.value] stringValue];
    
    
    outterColorSlider = [[UISlider alloc] initWithFrame:CGRectMake(300, self.view.bounds.size.height - 40, 150, 40)];
    outterColorSlider.minimumValue = 0;
    outterColorSlider.maximumValue = 100;
    outterColorSlider.value = 0;
    [outterColorSlider addTarget:self action:@selector(outterColorSliderValueChangedAction:) forControlEvents:UIControlEventValueChanged];
    
    outterColorSliderLable = [[UILabel alloc] initWithFrame:CGRectMake(250, self.view.bounds.size.height - 40, 50, 40)];
    outterColorSliderLable.textColor = [UIColor whiteColor];
    outterColorSliderLable.backgroundColor = [UIColor blackColor];
    outterColorSliderLable.textAlignment = UITextAlignmentCenter;
    outterColorSliderLable.text = [[NSNumber numberWithFloat:self.outterColorSlider.value] stringValue];
    
    
    alphaSlider = [[UISlider alloc] initWithFrame:CGRectMake(550, self.view.bounds.size.height - 40, 150, 40)];
    alphaSlider.minimumValue = 0;
    alphaSlider.maximumValue = 100;
    alphaSlider.value = 85;
    [alphaSlider addTarget:self action:@selector(alphaSliderValueChangedAction:) forControlEvents:UIControlEventValueChanged];
    
    alphaSliderLable = [[UILabel alloc] initWithFrame:CGRectMake(500, self.view.bounds.size.height - 40, 50, 40)];
    alphaSliderLable.textColor = [UIColor whiteColor];
    alphaSliderLable.backgroundColor = [UIColor blackColor];
    alphaSliderLable.textAlignment = UITextAlignmentCenter;
    alphaSliderLable.text = [[NSNumber numberWithFloat:self.alphaSlider.value] stringValue];
    
    glow = [[NGGlow alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    glow.innerColor = self.innerColorSlider.value / 100;
    glow.outterColor = self.outterColorSlider.value / 100;
    glow.alphaGlow = self.outterColorSlider.value / 100;
    glow.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.width/2);
    
    [self.view addSubview:sizeSlider];
    [self.view addSubview:sizeSliderLable];
    [self.view addSubview:innerColorSlider];
    [self.view addSubview:innerColorSliderLable];
    [self.view addSubview:outterColorSlider];
    [self.view addSubview:outterColorSliderLable];
    [self.view addSubview:alphaSliderLable];
    [self.view addSubview:alphaSlider];
    [self.view addSubview:glow];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


- (IBAction)sizeSliderValueChangedAction:(id)sender 
{    
    sizeSliderLable.text = [[NSNumber numberWithFloat:roundf(self.sizeSlider.value)] stringValue];
    
    [glow setFrame:CGRectMake(200, 200, roundf(self.sizeSlider.value), roundf(self.sizeSlider.value))];
    glow.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.width/2);
    [glow setNeedsDisplay];
}

- (IBAction)innerColorSliderValueChangedAction:(id)sender 
{    
    innerColorSliderLable.text = [[NSNumber numberWithFloat:roundf(self.innerColorSlider.value)] stringValue];
    
    glow.innerColor = roundf(self.innerColorSlider.value) / 100;
    [glow setNeedsDisplay];
}

- (IBAction)outterColorSliderValueChangedAction:(id)sender 
{    
    outterColorSliderLable.text = [[NSNumber numberWithFloat:roundf(self.outterColorSlider.value)] stringValue];
    
    glow.outterColor = roundf(self.outterColorSlider.value) / 100;
    [glow setNeedsDisplay];
}

- (IBAction)alphaSliderValueChangedAction:(id)sender
{
//    NSLog(@"alpha %f", self.alphaSlider.value);
    
    alphaSliderLable.text = [[NSNumber numberWithFloat:roundf(self.alphaSlider.value)] stringValue];
    
    glow.alphaGlow = roundf(self.alphaSlider.value) / 100;
    [glow setNeedsDisplay];

}


@end
