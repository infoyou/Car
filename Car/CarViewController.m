//
//  CarViewController.m
//  Car
//
//  Created by Adam on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CarViewController.h"
#import "SelectCarViewController.h"

@implementation CarViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipd_BJ0.png"]];
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
    return (interfaceOrientation == UIDeviceOrientationLandscapeRight || interfaceOrientation == UIDeviceOrientationLandscapeLeft);
}

-(IBAction)selectCar:(id)sender{
    SelectCarViewController * selectCarViewController = [[SelectCarViewController alloc] initWithNibName:@"SelectCarViewController" bundle:nil];
    [self presentModalViewController:selectCarViewController animated:YES];
    [selectCarViewController release];
}

@end
