//
//  FirstViewController.m
//  customPageCurl
//
//  Created by Ajeet Sharma on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "nextPageController.h"
#import <QuartzCore/QuartzCore.h>

@implementation FirstViewController
@synthesize nav;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(goToNextPage) userInfo:nibNameOrNil repeats:NO];
    }
    return self;
}
-(void)goToNextPage
{
    nextPageController *np=[[nextPageController alloc] init];
    [self.view addSubview:np.view];
    [np release];
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:0.35];
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = @"pageCurl";
    
    animation.subtype = kCATransitionFromRight;
//    
    animation.fillMode = kCAFillModeForwards;
    [animation setFillMode:@"extended"];
    
    [animation setRemovedOnCompletion:NO];
    [self.view.layer addAnimation:animation forKey:@"pageCurlAnimation"];
    
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
