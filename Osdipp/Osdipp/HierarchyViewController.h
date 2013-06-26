//
//  HierarchyViewController.h
//  test
//
//  Created by Alan Oscar Gostanian on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HierarchyDelegate <NSObject>

@required
-(UIViewController*)getLastViewControllerWithOptions:(NSArray*)options;

@end

@interface HierarchyViewController : UITableViewController{
    
    NSArray* dataSource;
    NSMutableArray* blocks;
    NSMutableArray* selectedOptions;
    
    id delegate;
}
@property (nonatomic, strong) id<HierarchyDelegate> delegate;
@property (nonatomic, strong) NSArray* dataSource;
@property (nonatomic, strong) NSMutableArray* blocks;
@property (nonatomic, strong) NSMutableArray* selectedOptions;

@end
