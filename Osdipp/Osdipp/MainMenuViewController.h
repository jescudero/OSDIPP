//
//  MainMenuViewController.h
//  Osdipp
//
//  Created by Alan Gostanian on 25/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HierarchyViewController.h"
@interface MainMenuViewController : UITableViewController<HierarchyDelegate, UITabBarDelegate>{
    IBOutlet UIImageView* imgIcon;
    IBOutlet UILabel* lblTitle;
    
    IBOutlet UIGestureRecognizer* gesCartillaMedica;
    IBOutlet UIGestureRecognizer* gesCartillaFarmacia;
    
    IBOutlet UITabBar *tabBar;
}

@end
