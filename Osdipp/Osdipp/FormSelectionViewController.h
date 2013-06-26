//
//  FormSelectionViewController.h
//  Osdipp
//
//  Created by Juan Francisco on 21/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectorViewController.h"

@interface FormSelectionViewController : UIViewController<SelectorDelegate>{


    NSMutableArray *opciones;
    NSMutableDictionary *selected;
    BOOL *isFarmacia;
}

@property (nonatomic, strong) IBOutlet UITableView *optionsTable;
@property (nonatomic, strong) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *searchButtom;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic) BOOL *isCartilla;

-(NSArray*)getCartilla:(NSDictionary*)selectedOptions;
-(NSArray*)getFarmacias:(NSDictionary*)selectedOptions;

@end
