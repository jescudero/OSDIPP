//
//  CAPCell.m
//  Osdipp
//
//  Created by Alan Gostanian on 27/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CAPCell.h"

@implementation CAPCell

@synthesize lblTel, lblEmail, lblTitle, lblAddress1, lblAddress2, txtTel, txtEmail;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
