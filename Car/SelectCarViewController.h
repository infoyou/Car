//
//  SelectCarViewController.h
//  Car
//
//  Created by Adam on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKCoverflowView.h"


@interface SelectCarViewController : UIViewController <TKCoverflowViewDataSource , TKCoverflowViewDelegate>{
    
    TKCoverflowView *m_coverflowView;
    
    NSMutableArray * m_carImageMuArray;
    
}


@end
