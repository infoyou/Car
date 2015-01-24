//
//  SelectCarViewController.m
//  Car
//
//  Created by Adam on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SelectCarViewController.h"
#import "CarDetailViewController.h"
#import "TKCoverflowCoverView.h"


@implementation SelectCarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [m_coverflowView release];
    m_coverflowView = nil;
    [m_carImageMuArray release];
    m_carImageMuArray = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    m_carImageMuArray = [[NSMutableArray alloc] initWithCapacity:20];
    for (int i = 0; i < 10; i++)
	{
		NSString * imageNameStr = [NSString stringWithFormat:@"ipd_car0%d.png",i%3+1];
		UIImage *image = [UIImage imageNamed:imageNameStr];
		[m_carImageMuArray addObject:image];
	}
   
    m_coverflowView = [[TKCoverflowView alloc] initWithFrame:CGRectMake(0, 298, 1024, 273)];
    m_coverflowView.backgroundColor = [UIColor clearColor];
    m_coverflowView.contentSize = CGSizeMake(473, 273);
    m_coverflowView.coverSpacing = 493.0f;
    m_coverflowView.coverAngle = 0.0f;
    m_coverflowView.coverflowDelegate = self;
	m_coverflowView.dataSource = self;
    
    
    [m_coverflowView setNumberOfCovers:10];
        
    [self.view addSubview:m_coverflowView];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIDeviceOrientationLandscapeRight || interfaceOrientation == UIDeviceOrientationLandscapeLeft);
}

- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasBroughtToFront:(int)index{
    //Current_Page=index;
}
- (TKCoverflowCoverView*) coverflowView:(TKCoverflowView*)coverflowView coverAtIndex:(int)index{
	
	TKCoverflowCoverView *cover = [coverflowView dequeueReusableCoverView];
	
	if(cover == nil){
		cover = [[[TKCoverflowCoverView alloc] initWithFrame:CGRectMake(0, 0, 473, 273)] autorelease]; 
		cover.baseline = 0;
		
	}
    cover.image = [m_carImageMuArray objectAtIndex:index];
    
	return cover;
	
}
- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasDoubleTapped:(int)index{
	
	TKCoverflowCoverView *cover = [coverflowView coverAtIndex:index];
	if(cover == nil) return;
	CarDetailViewController * carDetailViewController = [[CarDetailViewController alloc] initWithNibName:@"CarDetailViewController" bundle:nil];
    [self presentModalViewController:carDetailViewController animated:YES];
    [carDetailViewController release];
	
}


@end
