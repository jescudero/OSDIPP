//
//  PharmacyViewController.h
//  Osdipp
//
//  Created by Alan Oscar Gostanian on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewController : UITableViewController{
    NSArray* dataSource;
    int addressLabelWidth;
}

@property (nonatomic, strong) NSArray* dataSource;


@end
