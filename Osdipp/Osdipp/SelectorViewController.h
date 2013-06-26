//
//  SelectorViewController.h
//  Osdipp
//
//  Created by Juan Escudero on 4/23/12.
//  Copyright (c) 2012 Three Pillar Global. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectorDelegate <NSObject>

@required
-(void)didSelectElement:(NSMutableDictionary *)options;
@end

@interface SelectorViewController : UITableViewController{
    NSMutableArray* dataSource;
    NSMutableDictionary *selectores;
    NSString *selKey;
    NSMutableDictionary *selectedFilters;
    
}

@property (nonatomic, strong) id<SelectorDelegate> delegate;
@property (nonatomic, strong) NSMutableDictionary *selectedFilters;
@property (nonatomic, copy) NSString *selKey;
@property (nonatomic, copy) NSString *preSelectedMethod;

@end
