//
//  CAPCell.h
//  Osdipp
//
//  Created by Alan Gostanian on 27/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAPCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* lblTitle;
@property (nonatomic, strong) IBOutlet UILabel* lblAddress1;
@property (nonatomic, strong) IBOutlet UILabel* lblAddress2;
@property (nonatomic, strong) IBOutlet UILabel* lblTel;
@property (nonatomic, strong) IBOutlet UILabel* lblEmail;
@property (nonatomic, strong) IBOutlet UITextView* txtTel;
@property (nonatomic, strong) IBOutlet UITextView* txtEmail;

@end
