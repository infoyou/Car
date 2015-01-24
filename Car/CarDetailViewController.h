//
//  CarDetailViewController.h
//  Car
//
//  Created by Adam on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CarDetailViewController : UIViewController {
    
    IBOutlet UIView * m_carColorListView;
    IBOutlet UIView * m_carMenuListView;
    
    IBOutlet UIButton * m_bgMenuBtn;
    IBOutlet UIButton * m_bgCityBtn;
    IBOutlet UIButton * m_bgCountryBtn;
    IBOutlet UIButton * m_bgPolarRegionBtn;
    IBOutlet UIButton * m_bgBefaultBtn;
    
    IBOutlet UIButton * m_leftChangeCarImageBtn;
    IBOutlet UIButton * m_rightChangeCarImageBtn;
    IBOutlet UIButton * m_carImageBtnView;
    
    UIView * m_alertTrimView;
    UIView * m_trimImageView;
    //用来记录切换背景的菜单已经开启 yes表示已开启
    BOOL bgBool;
    //当切换背景时用来判断是否需要显示和隐藏改变颜色和查看汽车细节的菜单 yes表示一点击汽车图片
    BOOL clickCarImageBool;
    int carImgIndexInt;
    float touchPointX;
}

-(IBAction)mainMenu:(id)sender;

-(IBAction)aboutUs:(id)sender;

-(IBAction)bgMenu:(id)sender;

-(IBAction)changeBackground:(id)sender;

-(IBAction)changeCarImage:(id)sender;

-(IBAction)clickCarImage:(id)sender;

-(IBAction)openMenu:(id)sender;

-(IBAction)changeCarColor:(id)sender;

-(IBAction)carType:(id)sender;

-(IBAction)carLightspot:(id)sender;

-(IBAction)carTrim:(id)sender;

-(IBAction)carConfiguration:(id)sender;

@end
