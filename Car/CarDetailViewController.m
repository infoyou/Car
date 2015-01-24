//
//  CarDetailViewController.m
//  Car
//
//  Created by Adam on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CarDetailViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation CarDetailViewController

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
    [m_carColorListView release];
    m_carColorListView = nil;
    [m_carMenuListView release];
    m_carMenuListView = nil;
    
    [m_bgMenuBtn release];
    m_bgMenuBtn = nil;
    [m_bgCityBtn release];
    m_bgCityBtn = nil;
    [m_bgCountryBtn release];
    m_bgCountryBtn = nil;
    [m_bgPolarRegionBtn release];
    m_bgPolarRegionBtn = nil;
    [m_bgBefaultBtn release];
    m_bgBefaultBtn = nil;
    
    [m_leftChangeCarImageBtn release];
    m_leftChangeCarImageBtn = nil;
    [m_rightChangeCarImageBtn release];
    m_rightChangeCarImageBtn = nil;
    [m_carImageBtnView release];
    m_carImageBtnView = nil;
    
    [m_alertTrimView release];
    m_alertTrimView = nil;
    [m_trimImageView release];
    m_trimImageView = nil;
    
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
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipd_BJ0.png"]];
    m_bgCityBtn.frame = CGRectMake(1024, 64, 164, 41);
    m_bgCountryBtn.frame = CGRectMake(1024, 107, 164, 41);
    m_bgPolarRegionBtn.frame = CGRectMake(1024, 151, 164, 41);
    m_bgBefaultBtn.frame = CGRectMake(1024, 194, 164, 41);
    
    m_carColorListView.frame = CGRectMake(270, -31, 488, 31);
    m_carMenuListView.frame = CGRectMake(0, 768, 1024, 82);
    
    m_bgCityBtn.titleLabel.text = @"3";
    m_bgCountryBtn.titleLabel.text = @"2";
    m_bgPolarRegionBtn.titleLabel.text = @"1";
    m_bgBefaultBtn.titleLabel.text = @"0";
    
    m_leftChangeCarImageBtn.titleLabel.text = @"left";
    m_rightChangeCarImageBtn.titleLabel.text = @"right";
    
    [m_carImageBtnView setBackgroundImage:[UIImage imageNamed:@"ipd_B1car.png"] forState:UIControlStateNormal];
    
    bgBool = NO;
    clickCarImageBool = NO;
    carImgIndexInt = 1;
    
    
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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:m_carImageBtnView];
    touchPointX = currentPosition.x;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:m_carImageBtnView];
    NSLog(@"currentPosition.x-->%f",currentPosition.x);
    float touchMovePointX = currentPosition.x - touchPointX;
    if (touchMovePointX > 0) {
        
        carImgIndexInt ++;
    }else if (touchMovePointX < 0) {
        carImgIndexInt --;
    }
    if (touchMovePointX != 0 ) {
        if (carImgIndexInt > 7) {
            carImgIndexInt = 1;
        }else if (carImgIndexInt < 1) {
            carImgIndexInt = 7;
        }
        NSString *carImageNameStr = [NSString stringWithFormat:@"ipd_B%dcar.png",carImgIndexInt];
        [m_carImageBtnView setBackgroundImage:[UIImage imageNamed:carImageNameStr] forState:UIControlStateNormal];
    }
}

-(void)openBackgroundMenu{
    [UIView beginAnimations:@"View Flip" context:nil];
    //    [UIView setAnimationCurve:UIViewAnimationTransitionCurlUp];
    
    //    [UIView setAnimationDuration:0.1f];
    m_bgCityBtn.frame = CGRectMake(851, 64, 164, 41);
    
    
    //    [UIView setAnimationDuration:0.2f];
    m_bgCountryBtn.frame = CGRectMake(830, 107, 164, 41);
    
    
    //    [UIView setAnimationDuration:0.3f];
    m_bgPolarRegionBtn.frame = CGRectMake(807, 151, 164, 41);
    
    //    [UIView setAnimationDuration:0.4f];
    m_bgBefaultBtn.frame = CGRectMake(786, 194, 164, 41);
    
    [UIView commitAnimations];
}

-(void)closeBackgroundMenu{
    [UIView beginAnimations:@"View Flip" context:nil];
    
    [UIView setAnimationDuration:0.4f];
    m_bgCityBtn.frame = CGRectMake(1024, 64, 164, 41);
    
    [UIView setAnimationDuration:0.3f];
    m_bgCountryBtn.frame = CGRectMake(1024, 107, 164, 41);
    
    
    [UIView setAnimationDuration:0.2f];
    m_bgPolarRegionBtn.frame = CGRectMake(1024, 151, 164, 41);
    
    [UIView setAnimationDuration:0.1f];
    m_bgBefaultBtn.frame = CGRectMake(1024, 194, 164, 41);
    
    [UIView commitAnimations];
}

-(void)openCarColorMenu{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.4f];
    m_carColorListView.frame = CGRectMake(270, 70, 488, 31);
    [UIView commitAnimations];
}

-(void)closeCarColorMenu{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.4f];
    m_carColorListView.frame = CGRectMake(270, -31, 488, 31);
    [UIView commitAnimations];
}


-(void)openBottomMenu{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.4f];
    m_carMenuListView.frame = CGRectMake(0, 659, 1024, 82);
    [UIView commitAnimations];
}

-(void)closeBottomMenu{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.4f];
    m_carMenuListView.frame = CGRectMake(0, 768, 1024, 82);
    [UIView commitAnimations];
}

-(IBAction)mainMenu:(id)sender{
    
}

-(IBAction)aboutUs:(id)sender{
    
}

-(IBAction)bgMenu:(id)sender{
    
    if (!bgBool)
    {
        [m_bgMenuBtn setBackgroundImage:[UIImage imageNamed:@"ipd_bt_wancheng.png"] forState:UIControlStateNormal];
        [self openBackgroundMenu];
        //        //当用户已经点击过汽车图片的时时调用
        //        if (clickCarImageBool) {
        //            [self closeCarColorMenu];
        //            [self closeBottomMenu];
        //        }
        
        
    }else{
        [m_bgMenuBtn setBackgroundImage:[UIImage imageNamed:@"ipd_bt_qiehuan.png"] forState:UIControlStateNormal];
        [self closeBackgroundMenu];
        //当用户已经点击过汽车图片的时时调用
        //        if (clickCarImageBool) {
        //            [self openCarColorMenu];
        //            [self openBottomMenu];
        //        }
        
    }
    
    bgBool = !bgBool;
    
}

-(IBAction)changeBackground:(id)sender{
    UIButton *bgBtn = (UIButton *)sender;
    NSString *bgBtnText =  bgBtn.titleLabel.text;
    NSString *bgStr = [NSString stringWithFormat:@"ipd_BJ%@.png",bgBtnText];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:bgStr]];
}

-(IBAction)changeCarImage:(id)sender{
    UIButton *changeCarImageBtn = (UIButton *)sender;
    
    
    NSString *clickBtnTextStr = changeCarImageBtn.titleLabel.text;
    if ([@"left" isEqualToString:clickBtnTextStr]) {
        carImgIndexInt --;
    }else if([@"right" isEqualToString:clickBtnTextStr]) {
        carImgIndexInt ++;
        
    }
    if (carImgIndexInt > 7) {
        carImgIndexInt = 1;
    }else if (carImgIndexInt < 1) {
        carImgIndexInt = 7;
    }
    NSString *carImageNameStr = [NSString stringWithFormat:@"ipd_B%dcar.png",carImgIndexInt];
    [m_carImageBtnView setBackgroundImage:[UIImage imageNamed:carImageNameStr] forState:UIControlStateNormal];
}

-(IBAction)clickCarImage:(id)sender{
    
    [m_bgMenuBtn setBackgroundImage:[UIImage imageNamed:@"ipd_bt_qiehuan.png"] forState:UIControlStateNormal];
    [self closeBackgroundMenu];
    bgBool = NO;
    
    [self openCarColorMenu];
    [self openBottomMenu];
    clickCarImageBool = YES;
}

-(IBAction)openMenu:(id)sender{
    
}

-(IBAction)changeCarColor:(id)sender{
    
}

-(IBAction)carLightspot:(id)sender{
    [self closeCarColorMenu];
}
//返回车型选择菜单
-(IBAction)carType:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)carTrim:(id)sender{
    
    m_alertTrimView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    m_alertTrimView.backgroundColor = [UIColor blackColor];
    m_alertTrimView.alpha = 0.3;
    [self.view addSubview:m_alertTrimView];
    
    m_trimImageView = [[UIView alloc] initWithFrame:CGRectMake(184, 120, 654, 537)];
    m_trimImageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:m_trimImageView];
    
    // NOTE
    // UIPopoverController *popController = [[UIPopoverController alloc] ];
    UIButton * v_closeTrimVie = [[UIButton alloc] initWithFrame:CGRectMake(32, 487, 54, 50)];
    [v_closeTrimVie setBackgroundImage:[UIImage imageNamed:@"ipd_bt_guanbi.png"] forState:UIControlStateNormal];
    [v_closeTrimVie addTarget:self action:@selector(closeTrimView:) forControlEvents:UIControlEventTouchUpInside];
    [m_trimImageView addSubview:v_closeTrimVie];
    [v_closeTrimVie release];
    v_closeTrimVie = nil;
    
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = [UIColor whiteColor].CGColor;
    sublayer.frame = CGRectMake(0, 0, 654, 487);
    sublayer.borderColor = [UIColor whiteColor].CGColor;
    sublayer.borderWidth = 4.0;
    sublayer.cornerRadius = 5.0;
    [m_trimImageView.layer addSublayer:sublayer];
    
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(4, 4, 646, 479);
    //imageLayer.cornerRadius = 5.0;
    imageLayer.contents = (id)[UIImage imageNamed:@"ipd_neishi01.png"].CGImage;
    imageLayer.masksToBounds = YES;
    [sublayer addSublayer:imageLayer];
    
    [m_bgMenuBtn setBackgroundImage:[UIImage imageNamed:@"ipd_bt_qiehuan.png"] forState:UIControlStateNormal];
    [self closeBackgroundMenu];
    [self closeCarColorMenu];
    bgBool = NO;
}

-(IBAction)carConfiguration:(id)sender{
    [self closeCarColorMenu];
}


-(void)closeTrimView:(id)sender{
    [self openCarColorMenu];
    [m_alertTrimView removeFromSuperview];
    [m_trimImageView removeFromSuperview];
}


@end
