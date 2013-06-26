//
//  EmergenciasViewController.h
//  Osdipp
//
//  Created by Juan Escudero on 2/28/12.
//  Copyright (c) 2012 Three Pillar Global. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmergenciasViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) IBOutlet UITableView *tableViewNacional;

@property (nonatomic, strong) IBOutlet UITableView *tableViewDomicilio;
@end
